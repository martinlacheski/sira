from apps.plataformas.models import SalasVirtuales
import random
import json
import requests
import datetime
import time  # unicamente para efectos de demostración


# Maneja el horario propuesto en el formulario (lo extrae y lo agrega a la lista de horarios)
def horario_propuesto(data):
    horario_propuesto = []
    if data.is_valid():
        fecha_reserva = data.cleaned_data.get("fecha_reserva")
        hora_inicio = data.cleaned_data.get("inicio_hs")
        fecha_reserva = str(fecha_reserva)
        hora_inicio = str(hora_inicio)
        inicio_reunion_formateada = fecha_reserva + " " + hora_inicio

        fecha_reserva = data.cleaned_data.get("fecha_reserva")
        hora_fin = data.cleaned_data.get("fin_hs")
        fecha_reserva = str(fecha_reserva)
        hora_fin = str(hora_fin)
        fin_reunion_formateada = fecha_reserva + " " + hora_fin

        inicio_reunion_formateada = inicio_reunion_formateada[:-3]
        fin_reunion_formateada = fin_reunion_formateada[:-3]

        horario_propuesto.append([datetime.datetime.strptime(inicio_reunion_formateada, '%Y-%m-%d %H:%M'),
                                  datetime.datetime.strptime(fin_reunion_formateada, '%Y-%m-%d %H:%M')])

    return (horario_propuesto)


#Verificación de superposiciones
def verificacion(diccionario, horarios, horario_form):
    i = 0
    print("Procesando datos...")
    time.sleep(2.0)
    for obj in diccionario["items"]:
        start_str = (diccionario["items"][i]["start"])
        end_str = (diccionario["items"][i]["end"])
		#Formatea el horario de la reunion a ISO-8690
        start_str = start_str.replace("T", " ")
        end_str = end_str.replace("T", " ")
        start_str = start_str.replace(":00Z", "")
        end_str = end_str.replace(":00Z", "")

        horarios.append([datetime.datetime.strptime(start_str, '%Y-%m-%d %H:%M'),
                         datetime.datetime.strptime(end_str, '%Y-%m-%d %H:%M')])
        i = i + 1

    horarios.sort()

    # algoritmo de superposicion con 30 minutos de consideración por cada reunion
    print("Comprobando superposicones en cuenta...")
    time.sleep(2.0)
    l = len(horarios)
    superposiciones = []
    for i in range(l):
        for j in range(i + 1, l):
            x = horarios[i]
            y = horarios[j]
            if x[0] == y[0]:
                superposiciones.append([x, y])
            elif x[1] == y[1]:
                superposiciones.append([x, y])
            elif ((x[1] + datetime.timedelta(hours=0, minutes=30)) > (y[0]) and x[0] < y[0]):
                superposiciones.append([x, y])

    # borra los horarios
    horarios = []
    if (len(superposiciones) == 0):  # si no existen superposiciones, no hay problema
        print("No existen reuniones planificadas en ese horario")
        time.sleep(2.0)
        return True
    else:
        # si la única superposición es provocada por el horario ingresado en form, no supone problema
        if (len(superposiciones) == 1):
            if (horario_form in superposiciones):
                print("Existe una reunión planificada planificada en ese horario")
                time.sleep(2.0)
                return True
        else:
            print("Existen reuniones superpuestas. Cambiando de cuenta...")
            time.sleep(2.0)
            return False

    # Le da formato a la respuesta de GET y la convierte a dict


def jprint(obj):
    text = json.dumps(obj, sort_keys=True, indent=2)
    text_dict_local = json.loads(text)
    return text_dict_local


# FUNCIÓN PRINCIPAL
def token_verificado(form):
    cuentas_probadas = []
    verificacion_exitosa = False  # condición de salida de WHILE
    cuentas_agotadas = False  # En caso de que ninguna cuenta esté disponible en ese horario

    cuentas_disponibles = [3, 4, 32] #cuentas que administro yo
    while (verificacion_exitosa == False):
        horarios = horario_propuesto(form)
        horario_form = horario_propuesto(form)
        # obtención de numero para elegir token de una cuenta random
        random_cuenta = random.choice(cuentas_disponibles)

        # control para no repetir busquedas en cuentas
        if random_cuenta in cuentas_probadas:
            if (len(cuentas_probadas) > 3): #
                print("No hay más cuentas que probar... ABORTANDO")
                verificacion_exitosa = True
                cuentas_agotadas == True
            else:
                continue  # si se ejecuta significa que ya se probó esta cuenta y que se probará otra
        else:
            if random_cuenta in cuentas_probadas:
                continue
            else:
                cuentas_probadas.append(random_cuenta)

            cuenta_virtual = SalasVirtuales.objects.filter(pk=random_cuenta)  # busca una cuenta aleatoria
            print("Se probará la cuenta:", cuenta_virtual[0])
            time.sleep(2.0)
            token_a_verificar = cuenta_virtual.values_list("access_token",
                                                           flat=True)  # selecciona su campo 'acces_token'

            # request
            url = "https://webexapis.com/v1/meetings"
            token = "Bearer " + str(token_a_verificar[0])
            headers = {"Authorization": token, "Content-Type": "application/json"}
            datos_reunion = {}
            print("Relizando request para cuenta:", cuenta_virtual[0])
            response = requests.get(url, headers=headers, params=datos_reunion)
            text_dict = jprint(response.json())

            # condición de salida de while
            verificacion_exitosa = verificacion(text_dict, horarios, horario_form)

    if (cuentas_agotadas == True):
        print("A ocurrido un error, no existen cuentas disponibles para este horario en particular")
    else:
        print("Estableciendo planificación para cuenta:", cuenta_virtual[0])
        time.sleep(2.0)
        return (token)