import smtplib
from email.mime.text import MIMEText
#Necesario para importar los datos guardados del correo
from config import settings

def send_email(form):
    try:
        mailServer = smtplib.SMTP(settings.EMAIL_HOST, settings.EMAIL_PORT)
        print(mailServer.ehlo())
        mailServer.starttls()
        print(mailServer.ehlo())
        mailServer.login(settings.EMAIL_HOST_USER, settings.EMAIL_HOST_PASSWORD)
        print('Conectado..')
        #mail del solicitante
        #email = form.cleaned_data.get("email")
        #email_to = str(email)
        email_to = 'martinlacheski@gmail.com'
        #Construimos el mensaje simple
        mensaje = MIMEText("""Este es el mensaje de prueba""")
        mensaje['From'] = settings.EMAIL_HOST_USER
        mensaje['To'] = email_to
        mensaje['Subject'] = "Tienes un correo de SIRA"

        mailServer.sendmail(settings.EMAIL_HOST_USER,
                            email_to,
                            mensaje.as_string())

        print('Correo enviado correctamente')
    except Exception as e:
        print(e)