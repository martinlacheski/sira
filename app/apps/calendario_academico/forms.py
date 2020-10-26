from django.forms import ModelForm, TextInput, DateInput, Select

from apps.calendario_academico.models import CalendarioAcademico, TurnosExamen


class CalendarioAcademicoForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True

    class Meta:
        model = CalendarioAcademico
        fields = '__all__'
        widgets = {
            'nombre': DateInput(
                attrs={
                    'placeholder': 'Seleccione el Año',
                    #'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'nombre',
                    'data-target': '#nombre',
                    'data-toggle': 'datepicker'
                }
            ),
            'fecha_desde': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de inicio del Año Académico',
                    # 'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'fecha_desde',
                    'data-target': '#fecha_desde',
                    'data-toggle': 'datepicker'
                }
            ),
            'fecha_hasta': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de fin del Año Académico',
                    # 'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'fecha_hasta',
                    'data-target': '#fecha_hasta',
                    'data-toggle': 'datepicker'
                }
            ),
            'primer_cuat_inicio': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de inicio del Primer Cuatrimestre',
                    # 'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'primer_cuat_inicio',
                    'data-target': '#primer_cuat_inicio',
                    'data-toggle': 'datepicker'
                }
            ),
            'primer_cuat_fin': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de fin del Primer Cuatrimestr',
                    # 'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'primer_cuat_fin',
                    'data-target': '#primer_cuat_fin',
                    'data-toggle': 'datepicker'
                }
            ),
            'segundo_cuat_inicio': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de inicio del Segundo Cuatrimestre',
                    # 'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'segundo_cuat_inicio',
                    'data-target': '#segundo_cuat_inicio',
                    'data-toggle': 'datepicker'
                }
            ),
            'segundo_cuat_fin': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de inicio del Segundo Cuatrimestre',
                    # 'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'segundo_cuat_fin',
                    'data-target': '#segundo_cuat_fin',
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

class TurnosExamenForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['nombre'].widget.attrs['autofocus'] = True

    class Meta:
        model = TurnosExamen
        fields = '__all__'
        widgets = {
            'anio': Select(
                attrs={
                    'class': 'form-control select2',
                    'style': 'width: 100%'
                }
            ),
            'nombre': TextInput(
                attrs={
                    'placeholder': 'Ingrese el nombre del Turno de Examen',
                }
            ),
            'inicio': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de Inicio del Turno de Exameno',
                    # 'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'inicio',
                    'data-target': '#inicio',
                    'data-toggle': 'datepicker'
                }
            ),
            'fin': DateInput(
                attrs={
                    'placeholder': 'Seleccione la fecha de Fin del Turno de Examen',
                    # 'autocomplete': 'off',
                    'class': 'form-control datepicker-input',
                    'id': 'fin',
                    'data-target': '#fin',
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
