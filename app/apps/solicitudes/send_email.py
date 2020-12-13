import smtplib
from datetime import datetime
from email.mime.multipart import MIMEMultipart
# Necesario para importar los datos guardados del correo
from email.mime.text import MIMEText
from django.template.loader import render_to_string

from config import settings


def solicitante_fecha(data):
    if data.is_valid():
        pass
    # obtener la fecha de la solicitud
    fecha = data.cleaned_data.get("fecha_solicitud")
    fecha = str(fecha)
    fecha = fecha[:-6]
    fecha = datetime.strptime(fecha, "%Y-%m-%d %H:%M:%S").strftime("%d-%m-%Y %H:%M:%S")
    # conversión a string
    fecha = str(fecha)
    return (fecha)


def solicitante_dni(data):
    if data.is_valid():
        pass
    # obtener el dni
    dni = data.cleaned_data.get("dni")
    # conversión a string
    dni = str(dni)
    return (dni)


def solicitante_nombres(data):
    if data.is_valid():
        pass
    # obtener el nombre
    nombres = data.cleaned_data.get("nombres")
    # conversión a string
    nombres = str(nombres)
    return (nombres)


def solicitante_apellido(data):
    if data.is_valid():
        pass
    # obtener el apellido
    apellido = data.cleaned_data.get("apellido")
    # conversión a string
    apellido = str(apellido)
    return (apellido)


def solicitante_email(data):
    if data.is_valid():
        pass
    # obtener el email
    email = data.cleaned_data.get("email")
    # conversión a string
    email = str(email)
    return (email)


def solicitante_tipo(data):
    if data.is_valid():
        pass
    # obtener el tipo de reserva
    tipo = data.cleaned_data.get("tipo")
    # conversión a string
    tipo = str(tipo)
    return (tipo)


def solicitante_motivo(data):
    if data.is_valid():
        pass
    # obtener el motivo de la reserva
    motivo = data.cleaned_data.get("motivo")
    # conversión a string
    motivo = str(motivo)
    return (motivo)


def solicitante_observaciones(data):
    if data.is_valid():
        pass
    # obtener las observaciones
    observaciones = data.cleaned_data.get("observaciones")
    # conversión a string
    observaciones = str(observaciones)
    if observaciones is '':
        observaciones = '----------'
    return (observaciones)


def solicitante_sede(data):
    if data.is_valid():
        pass
    # obtener la sede
    sede = data.cleaned_data.get("sede")
    # conversión a string
    sede = str(sede)
    return (sede)


def solicitante_carrera(data):
    if data.is_valid():
        pass
    # obtener la carrera
    carrera = data.cleaned_data.get("carrera")
    # conversión a string
    carrera = str(carrera)
    return (carrera)


def solicitante_materia(data):
    if data.is_valid():
        pass
    # obtener la materia
    materia = data.cleaned_data.get("materia")
    # conversión a string
    materia = str(materia)
    return (materia)


def solicitante_comision(data):
    if data.is_valid():
        pass
    # obtener la comision
    comision = data.cleaned_data.get("comision")
    # conversión a string
    comision = str(comision)
    return (comision)


def solicitante_fecha_reserva(data):
    if data.is_valid():
        pass
    # obtener la fecha_reserva
    fecha_reserva = data.cleaned_data.get("fecha_reserva")
    fecha_reserva = str(fecha_reserva)
    fecha_reserva = datetime.strptime(fecha_reserva, "%Y-%m-%d").strftime("%d-%m-%Y")
    # conversión a string
    fecha_reserva = str(fecha_reserva)
    return (fecha_reserva)


def solicitante_inicio_hs(data):
    if data.is_valid():
        pass
    # obtener el horario de inicio_hs
    inicio_hs = data.cleaned_data.get("inicio_hs")
    # conversión a string
    inicio_hs = str(inicio_hs)
    inicio_hs = inicio_hs[:-3]
    return (inicio_hs)


def solicitante_fin_hs(data):
    if data.is_valid():
        pass
    # obtener el horario de fin_hs
    fin_hs = data.cleaned_data.get("fin_hs")
    # conversión a string
    fin_hs = str(fin_hs)
    fin_hs = fin_hs[:-3]
    return (fin_hs)


def send_email(form):
    try:
        mailServer = smtplib.SMTP(settings.EMAIL_HOST, settings.EMAIL_PORT)
        print(mailServer.ehlo())
        mailServer.starttls()
        print(mailServer.ehlo())
        mailServer.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)

        print('Conectado al servidor de correo')

        # informacion solicitud
        fecha = solicitante_fecha(form)
        dni = solicitante_dni(form)
        nombres = solicitante_nombres(form)
        apellido = solicitante_apellido(form)
        email_to = solicitante_email(form)
        tipo = solicitante_tipo(form)
        motivo = solicitante_motivo(form)
        observaciones = solicitante_observaciones(form)
        sede = solicitante_sede(form)
        carrera = solicitante_carrera(form)
        materia = solicitante_materia(form)
        comision = solicitante_comision(form)
        fecha_reserva = solicitante_fecha_reserva(form)
        inicio_hs = solicitante_inicio_hs(form)
        fin_hs = solicitante_fin_hs(form)
        inicio_hs = str(inicio_hs)
        fin_hs = str(fin_hs)

        print('Enviando Correo..')

        # Construimos el mensaje
        mensaje = MIMEMultipart()
        mensaje['From'] = settings.EMAIL_HOST_USER
        mensaje['To'] = email_to
        mensaje['Subject'] = "Sistema de Reservas Académicas - FCEQyN - UNaM"
        content = render_to_string('solicitudes/send_email_solicitud.html', {'fecha': fecha, 'dni': dni,'nombres': nombres,
                                   'apellido': apellido,'email': email_to,'tipo': tipo,'motivo': motivo,
                                   'observaciones': observaciones, 'sede': sede, 'carrera': carrera,
                                   'materia': materia, 'comision': comision, 'fecha_reserva': fecha_reserva,
                                   'inicio_hs': inicio_hs, 'fin_hs': fin_hs})
        mensaje.attach(MIMEText(content, 'html'))

        mailServer.sendmail(settings.EMAIL_HOST_USER,
                            email_to,
                            mensaje.as_string())

        print('Correo enviado correctamente')
    except Exception as e:
        print(e)


def send_email_confirmacion(form):
    try:
        mailServer = smtplib.SMTP(settings.EMAIL_HOST, settings.EMAIL_PORT)
        #print(mailServer.ehlo())
        mailServer.starttls()
        #print(mailServer.ehlo())
        mailServer.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)

        print('Conectado al servidor de correo')

        # informacion confirmacion
        fecha = solicitante_fecha(form)
        dni = solicitante_dni(form)
        nombres = solicitante_nombres(form)
        apellido = solicitante_apellido(form)
        email_to = solicitante_email(form)
        tipo = solicitante_tipo(form)
        motivo = solicitante_motivo(form)
        observaciones = solicitante_observaciones(form)
        sede = solicitante_sede(form)
        carrera = solicitante_carrera(form)
        materia = solicitante_materia(form)
        comision = solicitante_comision(form)
        fecha_reserva = solicitante_fecha_reserva(form)
        inicio_hs = solicitante_inicio_hs(form)
        fin_hs = solicitante_fin_hs(form)
        inicio_hs = str(inicio_hs)
        fin_hs = str(fin_hs)

        print('Enviando Correo..')

        # Construimos el mensaje
        mensaje = MIMEMultipart()
        mensaje['From'] = settings.EMAIL_HOST_USER
        mensaje['To'] = email_to
        mensaje['Subject'] = "Sistema de Reservas Académicas - FCEQyN - UNaM"
        content = render_to_string('solicitudes/send_email_confirmacion.html', {'fecha': fecha, 'dni': dni,'nombres': nombres,
                                   'apellido': apellido,'email': email_to,'tipo': tipo,'motivo': motivo,
                                   'observaciones': observaciones, 'sede': sede, 'carrera': carrera,
                                   'materia': materia, 'comision': comision, 'fecha_reserva': fecha_reserva,
                                   'inicio_hs': inicio_hs, 'fin_hs': fin_hs})
        mensaje.attach(MIMEText(content, 'html'))

        mailServer.sendmail(settings.EMAIL_HOST_USER,
                            email_to,
                            mensaje.as_string())

        print('Correo enviado correctamente')
    except Exception as e:
        print(e)