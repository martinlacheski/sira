from django.forms import ModelForm, TextInput, Select, DateInput, TimeInput, CheckboxInput, forms, DateField
from apps.solicitudes.models import *
from config import settings


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
        fields = '__all__'
        widgets = {
            'nombre': DateInput(
                format='%Y-%m-%d',
                attrs={
                    'readonly': True,
                    'class': 'form-control',
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
            'telefono': TextInput(
                attrs={
                    'placeholder': 'Ingrese su teléfono de contacto',
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
            'carrera': Select(
                attrs={
                    'class': 'form-control select2',
                    'style': 'width: 100%'
                }
            ),
            'materia': Select(
                attrs={
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
                format='%Y-%m-%d',
                attrs={
                    'placeholder': 'Seleccione la fecha de reserva',
                    #'value': datetime.now().strftime('%Y-%m-%d'),
                    'autocomplete': 'off',
                    'class': 'form-control datetimepicker-input',
                    'id': 'fecha_reserva',
                    'data-target': '#fecha_reserva',
                    'data-toggle': 'datetimepicker'
                }
            ),
            'inicio_hs': TimeInput(
                attrs={
                    'placeholder': 'Seleccione el horario de Inicio',
                    #'value': datetime.now().strftime('%Y-%m-%d'),
                    'autocomplete': 'off',
                    'class': 'form-control datetimepicker-input',
                    'id': 'inicio_hs',
                    'data-target': '#inicio_hs',
                    'data-toggle': 'datetimepicker'
                }
            ),
            'fin_hs': TimeInput(
                attrs={
                    'placeholder': 'Seleccione el horario de Fin',
                    #'value': datetime.now().strftime('%Y-%m-%d'),
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
                format='%Y-%m-%d',
                attrs={
                    'placeholder': 'Seleccione la fecha de finalización',
                    #'value': datetime.now().strftime('%Y-%m-%d'),
                    'autocomplete': 'off',
                    'class': 'form-control datetimepicker-input',
                    'id': 'fin_repeticion',
                    'data-target': '#fin_repeticion',
                    'data-toggle': 'datetimepicker'
                }
            ),
        }
        #exclude = ['initial-nombre', 'initial-fecha_reserva', 'initial-inicio_hs', 'initial-fin_hs', 'initial-fin_repeticion']

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
