from django.forms import ModelForm, TextInput, Select, DateInput, TimeInput, CheckboxInput

from apps.plataformas.models import *


class PlataformasForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True

    class Meta:
        model = Plataformas
        fields = '__all__'
        widgets = {
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese un nombre de Plataforma',
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


class SalasVirtualesForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['plataforma'].widget.attrs['autofocus'] = True

    class Meta:
        model = SalasVirtuales
        ordering = ['id']
        fields = 'plataforma', 'sede', 'nombre', 'email', 'password'
        widgets = {
            'plataforma': Select(
                attrs={
                    'class': 'form-control select2',
                    'style': 'width: 100%'
                }
            ),
            'sede': Select(
                attrs={
                    'class': 'form-control select2',
                    'style': 'width: 100%'
                }
            ),
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre de la Sala Virtual',
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'email': TextInput(
                attrs={
                    'placeholder': 'Ingrese un correo electrónico válido',
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'password': TextInput(
                attrs={
                    'placeholder': 'Ingrese la contraseña de la Sala Virtual',
                    'class': 'form-control',
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
