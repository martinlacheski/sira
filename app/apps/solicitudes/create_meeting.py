import json
import requests

from apps.solicitudes.verificacion_cuenta_API import *

#necesario para que json no se enoje
false = False
true = True

#genera el nombre de la reunion automáticamente
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
		#print(inicio_reunion_formateada)
		
	#	2020-09-17T21:40:00Z"
	
	return(inicio_reunion_formateada)

def fin_reunion(data):
	if data.is_valid():
		fecha_reserva = data.cleaned_data.get("fecha_reserva")
		hora_fin = data.cleaned_data.get("fin_hs")
		
		fecha_reserva = str(fecha_reserva)
		hora_fin = str(hora_fin)
				
		fin_reunion_formateada = fecha_reserva+"T"+hora_fin
		
		#print(fin_reunion_formateada)
	
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
	
	
#nos da la respuesta del POST request
def jprint(obj):
	text = json.dumps(obj, sort_keys=True, indent=2)
	print(text)

def crearReunion(form):

	hola = "Reunión creada en Webex"
	
	url = "https://webexapis.com/v1/meetings"
	token = token_verificado(form)       #función que llama a la funcionalidad inteligente
	
	headers = {

	"Authorization" : token, 
	"Content-Type" : "application/json"
	}
	
	datos_reunion = {
		"enabledAutoRecordMeeting": false,
		"allowAnyUserToBeCoHost": true,
		"title" : nombre_reunion(form),
		"password" : "202020", #TO-DO:: se necesita un campo para rellenar ésto
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

	#imprime los datos de vuelta de la request (IMPORTANTE)
	jprint(response.json())
	
	print("Exito. Se ha realizado la planificación adecuadamente")
	
	#assert False, (hola)
	return(0)
	
	
	
	
	
	
	
	
	
	
	
