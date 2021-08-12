from apps.solicitudes.models import Solicitudes
import datetime
import time  #unicamente para efectos de demostración


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
            print("entra acá")
            if (horario_form in superposiciones):
                print("Existe una reunión planificada planificada en ese horario")
                time.sleep(2.0)
                return True
            else:
                print("Existen reuniones superpuestas. Cambiando de cuenta...")
                time.sleep(2.0)
                return False

def proposicion_horarios():    
    horarios = []
    inicio_reunion = "2020-12-13 07:00"
    fin_reunion = "2020-12-13 10:00"
    horarios.append([datetime.datetime.strptime(inicio_reunion, '%Y-%m-%d %H:%M'), datetime.datetime.strptime(fin_reunion, '%Y-%m-%d %H:%M')])
    


#horarios()
#propuestas = verficacion(horario_a_evaluar)


