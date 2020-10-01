from django.forms import ModelForm, TextInput
from apps.carreras.models import *


class TiposCarrerasForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True


    class Meta:
        model = TiposCarreras
        fields = '__all__'
        widgets = {
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese un nombre',
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


class CarrerasForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['carrera'].widget.attrs['autofocus'] = True

    class Meta:
        model = Carreras
        fields = '__all__'
        widgets = {
            'carrera': TextInput(
                attrs={
                    'placeholder': 'Ingrese el código de la carrera (5 caracteres máximo)',
                }
            ),
            'nombre_corto': TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre corto de la Carrera (30 caracteres máximo)',
                }
            ),
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre de la Carrera',
                }
            ),
            'duracion': TextInput(
                attrs={
                    'placeholder': 'Ingrese la cantidad de años',
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


class PlanesForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['carrera'].widget.attrs['autofocus'] = True

    class Meta:
        model = PlanesEstudios
        fields = '__all__'
        widgets = {
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del Plan (Año)',
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


class AnioCursadoForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['anio'].widget.attrs['autofocus'] = True

    class Meta:
        model = AnioCursado
        fields = '__all__'
        widgets = {
            'anio': TextInput(
                attrs={
                    'placeholder': 'Ingrese el año de cursado',
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


class PeriodoCursadoForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['periodo'].widget.attrs['autofocus'] = True

    class Meta:
        model = PeriodoCursado
        fields = '__all__'
        widgets = {
            'periodo': TextInput(
                attrs={
                    'placeholder': 'Ingrese el periodo de cursado',
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


class MateriasForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['materia'].widget.attrs['autofocus'] = True

    class Meta:
        model = Materias
        fields = '__all__'
        widgets = {
            'materia': TextInput(
                attrs={
                    'placeholder': 'Ingrese el código de la materia (5 caracteres máximo)',
                }
            ),
            'nombre_corto': TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre corto de la Materia (30 caracteres máximo)',
                }
            ),
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre de la Materia',
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
