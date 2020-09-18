from django.forms import ModelForm, TextInput
from apps.inst.models import *


class UniversidadForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True

    class Meta:
        model = Universidad
        fields = '__all__'
        widgets = {
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese un nombre',
                }
            ),
            'direccion': TextInput(
                attrs={
                    'placeholder': 'Ingrese una dirección',
                    'style': 'width: 100%'
                }
            ),
            'telefonos': TextInput(
                attrs={
                    'placeholder': 'Ingrese los teléfonos',
                    'style': 'width: 100%'
                }
            ),
            'web': TextInput(
                attrs={
                    'placeholder': 'Ingrese la dirección de la página web',
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

class FacultadForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True

    class Meta:
        model = Facultad
        fields = '__all__'
        widgets = {
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese un nombre',
                }
            ),
            'direccion': TextInput(
                attrs={
                    'placeholder': 'Ingrese una dirección',
                    'style': 'width: 100%'
                }
            ),
            'telefonos': TextInput(
                attrs={
                    'placeholder': 'Ingrese los teléfonos',
                    'style': 'width: 100%'
                }
            ),
            'web': TextInput(
                attrs={
                    'placeholder': 'Ingrese la dirección de la página web',
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

class SedesForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True


    class Meta:
        model = Sedes
        fields = '__all__'
        widgets = {
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese un nombre',
                }
            ),
            'direccion': TextInput(
                attrs={
                    'placeholder': 'Ingrese una dirección',
                    'style': 'width: 100%'
                }
            ),
            'telefonos': TextInput(
                attrs={
                    'placeholder': 'Ingrese los teléfonos',
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
