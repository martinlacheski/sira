from apps.solicitudes.propuestas_horarios import *

#usada en archivo create_meeting para saber qué cuenta se asignó a la reserva confirmada

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
def verificacion(random_cuenta, horarios, horario_form):
    i = 0
    
    print("Procesando datos...")
    time.sleep(2.0)
    
    #reformatea fecha de reserva de formulario para realizar la búsqueda
    fecha_busqueda = horario_form[0][0]
    fecha_busqueda = str(fecha_busqueda)[:10]
    
#   Se buscan cuentas que hayan sido confirmadas y que estén en la misma fecha de proposición 
#   que la fecha del formulario.
    cuentas_a_analizar = Solicitudes.objects.all().filter(cuenta_asociada_id=random_cuenta, fecha_reserva=fecha_busqueda) 
    
    
    #Cambia formato de queryset a datetime de todos los resultados de la consulta anterior
    for cuentas in cuentas_a_analizar:
        fin_hs = cuentas_a_analizar.values_list("fin_hs", flat=True)[i]
        inicio_hs = cuentas_a_analizar.values_list("inicio_hs", flat=True)[i]
        fecha_reserva = cuentas_a_analizar.values_list("fecha_reserva", flat=True)[i]
	    
        inicio_reunion = str(fecha_reserva) + ' ' + str(inicio_hs)[:-3] 
        fin_reunion =    str(fecha_reserva) + ' ' + str(fin_hs)[:-3]
        horarios.append([datetime.datetime.strptime(inicio_reunion, '%Y-%m-%d %H:%M'), datetime.datetime.strptime(fin_reunion, '%Y-%m-%d %H:%M')])
        
        i = i + 1
        
    
    #ordena horarios
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


    
# FUNCIÓN PRINCIPAL
def token_verificado(form):
    cuentas_probadas = []
    verificacion_exitosa = False  # condición de salida de WHILE
    cuentas_agotadas = False  # En caso de que ninguna cuenta esté disponible en ese horario
    cuentas_disponibles = [3, 4, 32] #cuentas que administro yo
    
    
    while (verificacion_exitosa == False):
        horarios = horario_propuesto(form)
        horario_form = horario_propuesto(form) #variable para hacer comparación única. 
    
        random_cuenta = random.choice(cuentas_disponibles)     # obtención de numero para elegir token de una cuenta random

       
        if random_cuenta in cuentas_probadas:  # control para no repetir busquedas en cuentas
            if (len(cuentas_probadas) >= 3): #
                print("No hay más cuentas que probar... ABORTANDO")
                verificacion_exitosa = True
                cuentas_agotadas = True
                break
            else:
                continue  # si se ejecuta significa que ya se probó esta cuenta y que se probará otra
        else:
            cuentas_probadas.append(random_cuenta)
            cuenta_virtual = SalasVirtuales.objects.filter(pk=random_cuenta)  # busca una cuenta aleatoria, devuelve un renglon
            print("Se probará la cuenta:", cuenta_virtual[0])
            time.sleep(2.0)
           
            # condición de salida de while
            verificacion_exitosa = verificacion(random_cuenta, horarios, horario_form)
   
        
    if (cuentas_agotadas == True):
        print("A ocurrido un error, no existen cuentas disponibles para este horario en particular")
        #propuestas = proposicion_horarios(horario_form)
        assert False,("A ocurrido un error, no existen cuentas disponibles para este horario en particular")
        return(0)
    else:
        print("Estableciendo planificación para cuenta:", cuenta_virtual[0])
        time.sleep(2.0)
        token = cuenta_virtual.values_list("access_token", flat=True)
        
        token_y_cuenta = {"token":token[0], "cuenta_asociada":random_cuenta}
        return (token_y_cuenta)
