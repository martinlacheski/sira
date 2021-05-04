from django.forms import ModelForm, TextInput, Select, DateInput, DateTimeInput

from apps.solicitudes.models import *

horarios_choices = [
    ('06:00:00', '06:00'),
    ('06:15:00', '06:15'),
    ('06:30:00', '06:30'),
    ('06:45:00', '06:45'),
    ('07:00:00', '07:00'),
    ('07:15:00', '07:15'),
    ('07:30:00', '07:30'),
    ('07:45:00', '07:45'),
    ('08:00:00', '08:00'),
    ('08:15:00', '08:15'),
    ('08:30:00', '08:30'),
    ('08:45:00', '08:45'),
    ('09:00:00', '09:00'),
    ('09:15:00', '09:15'),
    ('09:30:00', '09:30'),
    ('09:45:00', '09:45'),
    ('10:00:00', '10:00'),
    ('10:15:00', '10:15'),
    ('10:30:00', '10:30'),
    ('10:45:00', '10:45'),
    ('11:00:00', '11:00'),
    ('11:15:00', '11:15'),
    ('11:30:00', '11:30'),
    ('11:45:00', '11:45'),
    ('12:00:00', '12:00'),
    ('12:15:00', '12:15'),
    ('12:30:00', '12:30'),
    ('12:45:00', '12:45'),
    ('13:00:00', '13:00'),
    ('13:15:00', '13:15'),
    ('13:30:00', '13:30'),
    ('13:45:00', '13:45'),
    ('14:00:00', '14:00'),
    ('14:15:00', '14:15'),
    ('14:30:00', '14:30'),
    ('14:45:00', '14:45'),
    ('15:00:00', '15:00'),
    ('15:15:00', '15:15'),
    ('15:30:00', '15:30'),
    ('15:45:00', '15:45'),
    ('16:00:00', '16:00'),
    ('16:15:00', '16:15'),
    ('16:30:00', '16:30'),
    ('16:45:00', '16:45'),
    ('17:00:00', '17:00'),
    ('17:15:00', '17:15'),
    ('17:30:00', '17:30'),
    ('17:45:00', '17:45'),
    ('18:00:00', '18:00'),
    ('18:15:00', '18:15'),
    ('18:30:00', '18:30'),
    ('18:45:00', '18:45'),
    ('19:00:00', '19:00'),
    ('19:15:00', '19:15'),
    ('19:30:00', '19:30'),
    ('19:45:00', '19:45'),
    ('20:00:00', '20:00'),
    ('20:15:00', '20:15'),
    ('20:30:00', '20:30'),
    ('20:45:00', '20:45'),
    ('21:00:00', '21:00'),
    ('21:15:00', '21:15'),
    ('21:30:00', '21:30'),
    ('21:45:00', '21:45'),
    ('22:00:00', '22:00'),
    ('22:15:00', '22:15'),
    ('22:30:00', '22:30'),
    ('22:45:00', '22:45'),
    ('23:00:00', '23:00'),
    ('23:15:00', '23:15'),
    ('23:30:00', '23:30'),
    ('23:45:00', '23:45'),
    ('23:59:00', '23:59')
]

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
        fields = 'fecha_solicitud', 'dni', 'nombres', 'apellido', 'email', 'sede', 'motivo', 'observaciones', 'carrera', \
                 'materia', 'comision', 'fecha_reserva', 'inicio_hs', 'fin_hs', 'estado'
        widgets = {
            'fecha_solicitud': DateTimeInput(
                attrs={
                    'readonly': True,
                    'class': 'form-control',
                    'is_hidden': True
                }
            ),
            'cuenta_asociada': TextInput(
                attrs={
                    'readonly': True,
                    'placeholder': 'Cuando la reunion este confirmada se visualizará',
                    'class': 'form-control',
                    'style': 'width: 100%',
                    'is_hidden': True
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
                    'class': 'form-control datepicker-input',
                    'id': 'fecha_reserva',
                    'data-target': '#fecha_reserva',
                    'data-toggle': 'datepicker'
                }
            ),
            'inicio_hs': Select(choices=horarios_choices,
                                attrs={
                                    'placeholder': 'Seleccione el horario de inicio',
                                    'class': 'form-control select2',
                                    'style': 'width: 100%'
                                }
                                ),
            'fin_hs': Select(choices=horarios_choices,
                             attrs={
                                 'placeholder': 'Seleccione el horario de fin',
                                 'class': 'form-control select2',
                                 'style': 'width: 100%'
                             }
                             ),
            'estado': TextInput(
                attrs={
                    'readonly': True,
                    'class': 'form-control',
                }
            ),
            'link_reunion': TextInput(
                attrs={
                    'placeholder': 'Cuando la reunion este confirmada se visualizará',
                    'readonly': True,
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'nombre_reunion': TextInput(
                attrs={
                    'placeholder': 'Cuando la reunion este confirmada se visualizará',
                    'readonly': True,
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'password_reunion': TextInput(
                attrs={
                    'placeholder': 'Cuando la reunion este confirmada se visualizará',
                    'readonly': True,
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


class GenerateSolicitudesForm(ModelForm):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['dni'].widget.attrs['autofocus'] = True

    class Meta:
        model = Solicitudes
        fields = 'fecha_solicitud', 'dni', 'nombres', 'apellido', 'email', 'sede', 'motivo', 'observaciones', 'carrera', \
                 'materia', 'comision', 'fecha_reserva', 'inicio_hs', 'fin_hs', 'estado'
        widgets = {
            'fecha_solicitud': DateTimeInput(
                attrs={
                    'readonly': True,
                    'class': 'form-control'
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
                    'class': 'form-control datepicker-input',
                    'id': 'fecha_reserva',
                    'data-target': '#fecha_reserva',
                    'data-toggle': 'datepicker'
                }
            ),
            'inicio_hs': Select(choices=horarios_choices,
                                attrs={
                                    'placeholder': 'Seleccione el horario de inicio',
                                    'class': 'form-control select2',
                                    'style': 'width: 100%'
                                }
                                ),
            'fin_hs': Select(choices=horarios_choices,
                             attrs={
                                 'placeholder': 'Seleccione el horario de fin',
                                 'class': 'form-control select2',
                                 'style': 'width: 100%'
                             }
                             ),
            'estado': TextInput(
                attrs={
                    'readonly': True,
                    'class': 'form-control'
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


class ConfirmSolicitudesForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['dni'].widget.attrs['autofocus'] = True

    class Meta:
        model = Solicitudes
        ordering = ['-id']
        fields = 'fecha_solicitud', 'dni', 'nombres', 'apellido', 'email', 'sede', 'motivo', 'observaciones', 'carrera', \
                 'materia', 'comision', 'fecha_reserva', 'inicio_hs', 'fin_hs', 'estado'
        widgets = {
            'fecha_solicitud': DateTimeInput(
                attrs={
                    'readonly': True,
                    'class': 'form-control',
                    'is_hidden': True
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
                    'class': 'form-control datepicker-input',
                    'id': 'fecha_reserva',
                    'data-target': '#fecha_reserva',
                    'data-toggle': 'datepicker'
                }
            ),
            'inicio_hs': Select(choices=horarios_choices,
                                attrs={
                                    'class': 'form-control select2',
                                    'style': 'width: 100%'
                                }
                                ),
            'fin_hs': Select(choices=horarios_choices,
                             attrs={
                                 'class': 'form-control select2',
                                 'style': 'width: 100%'
                             }
                             ),
            'estado': TextInput(
                attrs={
                    'readonly': True,
                    'class': 'form-control',
                }
            ),
            'link_reunion': TextInput(
                attrs={
                    'placeholder': 'Cuando la reunion este confirmada se visualizará',
                    'readonly': True,
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'nombre_reunion': TextInput(
                attrs={
                    'placeholder': 'Cuando la reunion este confirmada se visualizará',
                    'readonly': True,
                    'class': 'form-control',
                    'style': 'width: 100%'
                }
            ),
            'password_reunion': TextInput(
                attrs={
                    'placeholder': 'Cuando la reunion este confirmada se visualizará',
                    'readonly': True,
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
