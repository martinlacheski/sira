from django.http import HttpResponse

#necesario para hacer la request
import requests
import json

#para manipular el link
from urllib.parse import urlparse

def hola(request):
	
#________________________________________________________________________________________________
#OBTENCIÓN DE CÓDIGO EMBEBIDO EN EL LINK
	
	#obtiene link actual
	full_url = request.build_absolute_uri(None)

	parsed = urlparse(full_url) #urlparse es para heredar el método query
	parsed_str = str(parsed.query)  #convertimos lo que devuelve query en un string para manipularlo
	
	#sacamos cosas innecesarias
	codigo_link = parsed_str.replace("code=", "")
	codigo_link = codigo_link.replace("&state=set_state_here", "")

#_________________________________________________________________________________________________

#LA SOLICITUD REAL A LOS SERVIDORES DE WEBEX

	#ESTOS DATOS SE VAN A ALMACENAR EN LA BD, en la tabla salas_virtuales
	
	#definiciones importantes (se obtuvieron en el registro de la integración)
	client_ID = "Ced6a429a4bb07a24ad1d1d64b3363c155f2f0a92db67232b4f6d52f1891c47b8"
	client_secret = "add6f18e0e1ab5644a00bc2a03ad7ae5e3ce3446f071255afa59a433be2a1995"
	redirect_URI = "https://b104ed63dc7f.ngrok.io/api"     #esto va a cambiar cada vez que se cierre el acceso publico de ngrok
	
	#armado de solicitud
	url = "https://api.ciscospark.com/v1/access_token"
	headers = {'accept':'application/json','content-type':'application/x-www-form-urlencoded'}
	payload = ("grant_type=authorization_code&client_id="+client_ID+"&client_secret="+client_secret+"&code="+codigo_link+"&redirect_uri="+redirect_URI)
	
	#request. Comunicarse con webex
	req = requests.post(url=url, data=payload, headers=headers)
	results = json.loads(req.text)
	print(results)
	
	#estos dos se deben guardar en la tabla salas_virtuales-
	#El proceso se debe repetir para las 40 cuentas.
	#access_token = results["access_token"]
	#refresh_token = results["refresh_token"]

	return HttpResponse(results)
