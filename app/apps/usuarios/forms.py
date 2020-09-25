from django.forms import ModelForm, TextInput
from apps.usuarios.models import *


class UsuariosForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['autofocus'] = True

    class Meta:
        model = Usuarios
        fields = '__all__'
        widgets = {
            'username': TextInput(
                attrs={
                    'placeholder': 'Ingrese un nombre',
                }
            ),
            'password': TextInput(
                attrs={
                    'placeholder': 'Ingrese una contraseña',
                    'style': 'width: 100%'
                }
            ),
            'first_name': TextInput(
                attrs={
                    'placeholder': 'Ingrese un nombre',
                    'style': 'width: 100%'
                }
            ),
            'last_name': TextInput(
                attrs={
                    'placeholder': 'Ingrese un apellido',
                    'style': 'width: 100%'
                }
            ),
            'dni': TextInput(
                attrs={
                    'placeholder': 'Ingrese un DNI sin los puntos',
                }
            ),
            'legajo': TextInput(
                attrs={
                    'placeholder': 'Ingrese un legajo',
                    'style': 'width: 100%'
                }
            ),
            'email': TextInput(
                attrs={
                    'placeholder': 'Ingrese un número correo electrónico',
                    'style': 'width: 100%'
                }
            ),
            'telefono': TextInput(
                attrs={
                    'placeholder': 'Ingrese un número de teléfono',
                    'style': 'width: 100%'
                }
            ),
        }

    def save(self, commit=True):
        data = {}
        form = super()
        try:
            if form.is_valid():
                form.save()
            else:
                data['error'] = form.errors
        except Exception as e:
            data['error'] = str(e)
        return data