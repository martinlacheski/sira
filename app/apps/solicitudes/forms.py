from django.forms import ModelForm, TextInput, Select, DateInput, TimeInput, CheckboxInput
from tempus_dominus.widgets import TimePicker
from apps.solicitudes.models import *


class TipoSolicitudForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True

    class Meta:
        model = TipoSolicitud
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


class MotivoSolicitudForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True

    class Meta:
        model = Motivos
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


class SolicitudesForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['dni'].widget.attrs['autofocus'] = True

    class Meta:
        model = Solicitudes
        ordering = ['-id']
        fields = '__all__'
        widgets = {
            'nombre': DateInput(
                attrs={
                    'readonly': True,
                    'class': 'form-control',
                }
            ),
            'dni': TextInput(
                attrs={
                    'placeholder': 'Ingrese su DNI',
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'nombres': TextInput(
                attrs={
                    'placeholder': 'Ingrese su nombre',
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'apellido': TextInput(
                attrs={
                    'placeholder': 'Ingrese su apellido',
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
            'tipo': Select(
                attrs={
                    'class': 'form-control select2',
                    'style': 'width: 100%'
                }
            ),
            'motivo': Select(
                attrs={
                    'class': 'form-control select2',
                    'style': 'width: 100%'
                }
            ),
            'observaciones': TextInput(
                attrs={
                    'placeholder': 'En caso de DICTADO DE CURSOS, ingrese una descripción del mismo',
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'sede': Select(
                attrs={
                    'class': 'form-control select2',
                    'style': 'width: 100%'
                }
            ),
            'carrera': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
                }
            ),
            'materia': Select(attrs={
                'class': 'form-control select2',
                'style': 'width: 100%'
                }
            ),
            'comision': Select(
                attrs={
                    'class': 'form-control select2',
                    'style': 'width: 100%'
                }
            ),
            'fecha_reserva': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de reserva',
                    #'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'fecha_reserva',
                    'data-target': '#fecha_reserva',
                    'data-toggle': 'datepicker'
                }
            ),
            'inicio_hs': TimeInput(
                #format='%Y-%m-%d',
                attrs={
                    'autocomplete': 'off',
                    'class': 'form-control datetimepicker-input',
                    'id': 'inicio_hs',
                    'data-target': '#inicio_hs',
                    'data-toggle': 'datetimepicker'
                }
            ),
            'fin_hs': TimeInput(
                attrs={
                    'autocomplete': 'off',
                    'class': 'form-control datetimepicker-input',
                    'id': 'fin_hs',
                    'data-target': '#fin_hs',
                    'data-toggle': 'datetimepicker'
                }
            ),
            'repeticion': CheckboxInput(
                attrs={
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'fin_repeticion': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de finalización',
                    #'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'fin_repeticion',
                    'data-target': '#fin_repeticion',
                    'data-toggle': 'datepicker'
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
