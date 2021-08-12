from apps.solicitudes.propuestas_horarios import *

# Maneja el horario propuesto en el formulario (lo extrae y lo agrega a la lista de horarios)
def horario_propuesto(data):
    horario_propuesto = []
    if data.is_valid():
        fecha_reserva = data.cleaned_data.get("fecha_reserva")
        hora_inicio = data.cleaned_data.get("inicio_hs")
        # conversión a string
        fecha_reserva = str(fecha_reserva)
        hora_inicio = str(hora_inicio)
        inicio_reunion_formateada = fecha_reserva + " " + hora_inicio

        fecha_reserva = data.cleaned_data.get("fecha_reserva")
        hora_fin = data.cleaned_data.get("fin_hs")
        # conversión a string
        fecha_reserva = str(fecha_reserva)
        hora_fin = str(hora_fin)
        # Se formatea segun lo solicitado
        fin_reunion_formateada = fecha_reserva + " " + hora_fin

        inicio_reunion_formateada = inicio_reunion_formateada[:-3]
        fin_reunion_formateada = fin_reunion_formateada[:-3]

        horario_propuesto.append([datetime.datetime.strptime(inicio_reunion_formateada, '%Y-%m-%d %H:%M'),
                                  datetime.datetime.strptime(fin_reunion_formateada, '%Y-%m-%d %H:%M')])

    return (horario_propuesto)


# Verificación de superposiciones
def verificacion(random_cuenta, horarios, horario_form):
    i = 0

    print("Procesando datos...")
    time.sleep(1.0)

    # reformatea fecha de reserva de formulario para realizar la búsqueda
    fecha_busqueda = horario_form[0][0]
    fecha_busqueda = str(fecha_busqueda)[:10]

    #   Se buscan cuentas que hayan sido confirmadas y que estén en la misma fecha
    #   de proposición que la fecha del formulario.
    cuentas_a_analizar = Solicitudes.objects.all().filter(estado="CONFIRMADO", cuenta_asociada_id=random_cuenta,
                                                          fecha_reserva=fecha_busqueda)

    # Cambia formato de queryset a datetime de todos los resultados de la consulta anterior
    for cuentas in cuentas_a_analizar:
        fin_hs = cuentas_a_analizar.values_list("fin_hs", flat=True)[i]
        inicio_hs = cuentas_a_analizar.values_list("inicio_hs", flat=True)[i]
        fecha_reserva = cuentas_a_analizar.values_list("fecha_reserva", flat=True)[i]
        # Se formatea segun lo solicitado
        inicio_reunion = str(fecha_reserva) + ' ' + str(inicio_hs)[:-3]
        fin_reunion = str(fecha_reserva) + ' ' + str(fin_hs)[:-3]
        horarios.append([datetime.datetime.strptime(inicio_reunion, '%Y-%m-%d %H:%M'),
                         datetime.datetime.strptime(fin_reunion, '%Y-%m-%d %H:%M')])

        i = i + 1

    # ordena horarios
    horarios.sort()

    # algoritmo de superposicion con 30 minutos de consideración por cada reunion
    print("Comprobando superposicones en cuenta...")
    time.sleep(1.0)
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

    # si no existen superposiciones, no hay problema
    if (len(superposiciones) == 0):
        print("No existen reuniones planificadas en ese horario")
        time.sleep(1.0)
        return True

    # si existe una superposicion
    elif len(superposiciones) == 1:
        if (horario_form[0] == superposiciones[0][0]) or ((horario_form[0] == superposiciones[0][1])):
            print("El horario propuesto no implica superposiciones considerables.")
            time.sleep(1.0)
            return True
        else:
            print("Existe una superposición pero el horario propuesto no la causa.")
            time.sleep(1.0)
            return True
    # si existen dos superposiciones, no PERMITE
    else:
        print("Existen superposiciones considerables")
        return False


# FUNCIÓN PRINCIPAL
def token_verificado(form):
    cuentas_probadas = []
    # condición de salida de WHILE
    verificacion_exitosa = False
    # En caso de que ninguna cuenta esté disponible en ese horario
    cuentas_agotadas = False
    # cuentas que administro yo LUEGO SERAN TODAS
    cuentas_disponibles = [3, 4, 32]

    while (verificacion_exitosa == False):
        horarios = horario_propuesto(form)
        # variable para hacer comparación única.
        horario_form = horario_propuesto(form)
        # obtención de numero para elegir token de una cuenta random
        random_cuenta = random.choice(cuentas_disponibles)
        # control para no repetir busquedas en cuentas
        if random_cuenta in cuentas_probadas:
            if (len(cuentas_probadas) >= 3):  #
                print("No hay más cuentas que probar... ABORTANDO")
                verificacion_exitosa = True
                cuentas_agotadas = True
                break
            else:
                # si se ejecuta significa que ya se probó esta cuenta y que se probará otra
                continue
        else:
            cuentas_probadas.append(random_cuenta)
            cuenta_virtual = SalasVirtuales.objects.filter(
                # busca una cuenta aleatoria, devuelve un renglon
                pk=random_cuenta)
            print("Se probará la cuenta:", cuenta_virtual[0])
            time.sleep(1.0)
            # condición de salida de while
            verificacion_exitosa = verificacion(random_cuenta, horarios, horario_form)

    if (cuentas_agotadas == True):
        print("A ocurrido un error, no existen cuentas disponibles para este horario en particular")

        # devuelve un mensaje informando que no hay cuentas disponibles en el horario seleccionado
        assert False, ("No existen cuentas disponibles para el horario seleccionado.")
        return (0)
    else:
        print("Estableciendo planificación para cuenta:", cuenta_virtual[0])
        time.sleep(1.0)
        token = cuenta_virtual.values_list("access_token", flat=True)

        token_y_cuenta = {"token": token[0], "cuenta_asociada": random_cuenta}
        return (token_y_cuenta)
