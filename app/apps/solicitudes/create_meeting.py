import json
import requests


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


#	"2020-09-17T21:40:00Z",

def fin_reunion(data):
	if data.is_valid():
		fecha_reserva = data.cleaned_data.get("fecha_reserva")
		hora_fin = data.cleaned_data.get("fin_hs")
		
		fecha_reserva = str(fecha_reserva)
		hora_fin = str(hora_fin)
				
		fin_reunion_formateada = fecha_reserva+"T"+hora_fin
		
		#print(fin_reunion_formateada)
	
	return(fin_reunion_formateada)

#nos da la respuesta del POST request
def jprint(obj):
	text = json.dumps(obj, sort_keys=True, indent=2)
	print(text)


def crearReunion(form):
	#Funciones que hacen el trabajo sucio
	nombre_reunion(form)
	inicio_reunion(form)
	fin_reunion(form)	
	
	url = "https://webexapis.com/v1/meetings"
	token = "Bearer NjU1ZDA1NDgtOWFiZC00ZmIzLWE2ODUtNTgzMDE4ZmUzMDY0NDczZGIzZTAtYzRl_P0A1_bbbd8451-22ce-44ba-a050-4b19c5cf4ecb"
	
	headers = {

	"Authorization" : token, 
	"Content-Type" : "application/json"
	}
	
	datos_reunion = {
		"enabledAutoRecordMeeting": false,
		"allowAnyUserToBeCoHost": true,
		"title" : nombre_reunion(form),
		"password" : "202020",
		"start" : str(inicio_reunion(form)),
		"end" : fin_reunion(form),
		"timezone": "America/Argentina/Cordoba",
		"invitees" : []
	}
	
	#realiza la request
	response = requests.post(url, headers=headers, json=datos_reunion)
	
	#imprime los datos de vuelta de la request
	jprint(response.json())
	
	return(0)
	

