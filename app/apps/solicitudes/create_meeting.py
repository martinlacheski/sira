
from apps.solicitudes.verificacion_cuenta_API import *
from apps.solicitudes.models import *



#necesario para que json no se enoje
false = False
true = True

#genera el nombre de la reunion automáticamente
def camposRespuestaMeeting(dict_respuesta, cuenta):
    
    link = dict_respuesta["webLink"]
    password = dict_respuesta["password"]
    nombre_reunion_dict = dict_respuesta["title"]
    
    ultima_adicion = Solicitudes.objects.order_by('-id')[0]
    
    Solicitudes.objects.filter(pk=ultima_adicion.id).update(cuenta_asociada_id=cuenta, link_reunion=link, nombre_reunion=nombre_reunion_dict, password_reunion=password)
    
    return 0 
    
    

def nombre_reunion(data):
	
	if data.is_valid():
		#obtener el nombre de la materia y carrera
		nombre_carrera = data.cleaned_data.get("carrera")
		nombre_materia = data.cleaned_data.get("materia")
		
		#conversión a string
		nombre_carrera = str(nombre_carrera)
		nombre_materia = str(nombre_materia)
		nombre_final = nombre_materia + ' - ' + nombre_carrera
	
	return(nombre_final)
	
#Formatea el inicio de la reunion a ISO-8690
def inicio_reunion(data):
	if data.is_valid():
		fecha_reserva = data.cleaned_data.get("fecha_reserva")
		hora_inicio = data.cleaned_data.get("inicio_hs")
		
		fecha_reserva = str(fecha_reserva)
		hora_inicio = str(hora_inicio)
				
		inicio_reunion_formateada = fecha_reserva+"T"+hora_inicio
		
	#	2020-09-17T21:40:00Z"
	
	return(inicio_reunion_formateada)



def fin_reunion(data):
	if data.is_valid():
		fecha_reserva = data.cleaned_data.get("fecha_reserva")
		hora_fin = data.cleaned_data.get("fin_hs")
		
		fecha_reserva = str(fecha_reserva)
		hora_fin = str(hora_fin)
				
		fin_reunion_formateada = fecha_reserva+"T"+hora_fin
		
	
	return(fin_reunion_formateada)
	
def email_creador(data):
	if data.is_valid():
		email = data.cleaned_data.get("email")
	return(email)

def nombre_creador_reunion(data):
	if data.is_valid():
		nombre = data.cleaned_data.get("nombres")
		apellido = data.cleaned_data.get("apellido")
		
		nombre = str(nombre)
		apellido = str(apellido)
		
		nombre_completo = nombre + ' ' + apellido
	return(nombre_completo)	
	
	
#nos da la respuesta del POST request, convierte la respuesta a diccionario
def jprint(obj):
    text = json.dumps(obj, sort_keys=True, indent=2)
    
    text_dict_local = json.loads(text)
    
    print("El link de la reunión es: ", text_dict_local["webLink"])
    return(text_dict_local)


def crearReunion(form):

    url = "https://webexapis.com/v1/meetings"
    dict_respuesta = token_verificado(form)       #función que llama a la funcionalidad inteligente
	
    token = dict_respuesta["token"]
    cuenta_asociada = dict_respuesta["cuenta_asociada"]
    
    if(token == 0):
        assert False, ("ERROR AL PROGRAMAR REUNIÓN")
    else:
        
        headers = {
    
        "Authorization" : "Bearer "+token, 
        "Content-Type" : "application/json"
        }
        
        datos_reunion = {
            "enabledAutoRecordMeeting": false,
            "allowAnyUserToBeCoHost": true,
            "title" : nombre_reunion(form),
            "password" : "202020", #TO-DO: se necesita un campo para rellenar ésto
            "start" : inicio_reunion(form),
            "end" : fin_reunion(form),
            "timezone": "America/Argentina/Cordoba",
            "invitees" : [
                {
                    "email": str(email_creador(form)), #email del solicitante
                    "displayName": str(nombre_creador_reunion(form)), #nombre y apellido del solicitante
                    "coHost": false #no se utiliza porque los solicitantes no tienen cuenta webex
                }
            ]
        }
        
        #realiza la request
        response = requests.post(url, headers=headers, json=datos_reunion)
    
        #imprime los datos de vuelta de la request, luego crea y devuelve un diccionario de la respuesta
        diccionario_datos = jprint(response.json())

        #completa campos en la BD de cuenta asignada, link, pass y nombre de la reunion
        camposRespuestaMeeting(diccionario_datos, cuenta_asociada)
    
    print("Planificación exitosa")
    
    return()    





#   TO - DO
#   Se necesita un control por si falla el access token. En ese caso la reunión no debe ser guardada 
#   y el error debe ser informado. 
#   Para ello, se necesita controlar el resultado de la función crearReunión y agregar 
#   lógica en la vista de solicitudes (probablemente sea la vista de reservas en un futuro)    
    
    
    
	
	
	
	
	
	
	
	
	
	
	
