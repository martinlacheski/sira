from apps.solicitudes.verificacion_cuenta_API import *
from apps.solicitudes.models import *
from apps.solicitudes.send_email import send_email_confirmacion

# necesario para que json no se enoje
false = False
true = True


# Completa campos en la BD de cuenta asignada, link, pass y nombre de la reunion.
# Cambia estado de la solitud de PENDIENTE a CONFIRMADO
def camposRespuestaMeeting(dict_respuesta, cuenta):
    link = dict_respuesta["webLink"]
    password = dict_respuesta["password"]
    nombre_reunion_dict = dict_respuesta["title"]
    ultima_adicion = Solicitudes.objects.order_by('-id')[0]
    Solicitudes.objects.filter(pk=ultima_adicion.id).update(estado="CONFIRMADO", cuenta_asociada_id=cuenta,
                                                            link_reunion=link, nombre_reunion=nombre_reunion_dict,
                                                            password_reunion=password)


def camposRespuestaMeetingID(id_sol, dict_respuesta, cuenta):
    link = dict_respuesta["webLink"]
    password = dict_respuesta["password"]
    nombre_reunion_dict = dict_respuesta["title"]
    Solicitudes.objects.filter(pk=id_sol).update(estado="CONFIRMADO", cuenta_asociada_id=cuenta, link_reunion=link,
                                                 nombre_reunion=nombre_reunion_dict, password_reunion=password)


def nombre_reunion(data):
    if data.is_valid():
        # obtener el nombre de la materia y carrera
        nombre_carrera = data.cleaned_data.get("carrera")
        nombre_materia = data.cleaned_data.get("materia")
        # conversión a string
        nombre_carrera = str(nombre_carrera)
        nombre_materia = str(nombre_materia)
        nombre_final = nombre_materia + ' - ' + nombre_carrera
    return (nombre_final)


# Formatea el inicio de la reunion a ISO-8690
def inicio_reunion(data):
    if data.is_valid():
        fecha_reserva = data.cleaned_data.get("fecha_reserva")
        hora_inicio = data.cleaned_data.get("inicio_hs")
        # conversión a string
        fecha_reserva = str(fecha_reserva)
        hora_inicio = str(hora_inicio)
        # Se formatea segun lo solicitado
        # 2020-09-17T21:40:00Z"
        inicio_reunion_formateada = fecha_reserva + "T" + hora_inicio
    return (inicio_reunion_formateada)


def fin_reunion(data):
    if data.is_valid():
        fecha_reserva = data.cleaned_data.get("fecha_reserva")
        hora_fin = data.cleaned_data.get("fin_hs")
        # conversión a string
        fecha_reserva = str(fecha_reserva)
        hora_fin = str(hora_fin)
        # Se formatea segun lo solicitado
        fin_reunion_formateada = fecha_reserva + "T" + hora_fin
    return (fin_reunion_formateada)


def email_creador(data):
    if data.is_valid():
        email = data.cleaned_data.get("email")
    return (email)


def nombre_creador_reunion(data):
    if data.is_valid():
        nombre = data.cleaned_data.get("nombres")
        apellido = data.cleaned_data.get("apellido")
        # conversión a string
        nombre = str(nombre)
        apellido = str(apellido)
        # Se formatea segun lo solicitado
        nombre_completo = nombre + ' ' + apellido
    return (nombre_completo)


# nos da la respuesta del POST request, convierte la respuesta a diccionario
def jprint(obj):
    text = json.dumps(obj, sort_keys=True, indent=2)

    text_dict_local = json.loads(text)

    print("El link de la reunión es: ", text_dict_local["webLink"])

    # se creó la reunión correctamente. Tiene numero de reunión
    if (text_dict_local["meetingNumber"] != ""):
        return (text_dict_local)
    else:
        return (0)


def crearReunion(form):
    url = "https://webexapis.com/v1/meetings"
    # función que llama a la funcionalidad inteligente
    dict_respuesta = token_verificado(form)
    token = dict_respuesta["token"]
    cuenta_asociada = dict_respuesta["cuenta_asociada"]

    if (token == 0):
        assert False, ("ERROR AL PROGRAMAR REUNIÓN")
    else:
        headers = {
            "Authorization": "Bearer " + token,
            "Content-Type": "application/json"
        }
        datos_reunion = {
            "enabledAutoRecordMeeting": false,
            "allowAnyUserToBeCoHost": true,
            "title": nombre_reunion(form),
            # Se debe generar una contraseña automaticamente FALTA
            "password": "202020",
            "start": inicio_reunion(form),
            "end": fin_reunion(form),
            "timezone": "America/Argentina/Cordoba",
            "invitees": [
                {
                    # email del solicitante
                    "email": str(email_creador(form)),
                    # nombre y apellido del solicitante
                    "displayName": str(nombre_creador_reunion(form)),
                    # Se va a activar cuando se utilice desde la aplicacion PROBAR
                    "coHost": false
                }
            ]
        }

        # realiza la request
        response = requests.post(url, headers=headers, json=datos_reunion)

        # imprime los datos de vuelta de la request, luego crea y devuelve un diccionario
        # de la respuesta

        diccionario_datos = jprint(response.json())

        if (diccionario_datos == 0):
            assert False, ("Ha ocurrido un error en la conexión del sistema hacia la API")
            return (0)
        else:
            exito_y_guardar = {"todo_correcto": 1, "datos_update": diccionario_datos,
                               "cuenta_asociada": cuenta_asociada}
            send_email_confirmacion(form)
            print("Planificación exitosa")
            return (exito_y_guardar)
