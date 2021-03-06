from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views import View
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, View
from django.utils.decorators import method_decorator

from apps.solicitudes.create_meeting import *
from apps.solicitudes.forms import SolicitudesForm, Materias, horarios_choices, ConfirmSolicitudesForm, \
    GenerateSolicitudesForm
from apps.solicitudes.models import Solicitudes
from apps.mixins import ValidatePermissionRequiredMixin
from apps.solicitudes.send_email import send_email, send_email_confirmacion
from apps.usuarios.models import Usuarios

hola = 'error'

def solicitudes_list(request):
    data = {
        'title': 'Listado de Solicitudes',
        'solicitudes': Solicitudes.objects.all()
    }
    return render(request, 'solicitudes/list.html', data)

class SolicitudesListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = Solicitudes
    template_name = 'solicitudes/list.html'
    permission_required = 'solicitudes.view_solicitudes'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Solicitudes.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Solicitudes'
        context['create_url'] = reverse_lazy('solicitudes:solicitudes_create')
        context['list_url'] = reverse_lazy('solicitudes:solicitudes_list')
        context['entity'] = 'Solicitudes'
        return context

class SolicitudesPendientesListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = Solicitudes
    template_name = 'solicitudes/list_naturaltime.html'
    permission_required = 'solicitudes.view_solicitudes'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Solicitudes.objects.filter(estado='PENDIENTE'):
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Solicitudes Pendientes'
        context['create_url'] = reverse_lazy('solicitudes:solicitudes_create')
        context['list_url'] = reverse_lazy('solicitudes:solicitudes_pendientes_list')
        context['entity'] = 'Solicitudes'
        return context

class SolicitudesCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = Solicitudes
    form_class = SolicitudesForm
    template_name = 'solicitudes/create.html'
    success_url = reverse_lazy('solicitudes:solicitudes_list')
    permission_required = 'solicitudes.add_solicitudes'
    url_redirect = success_url

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_materias_id':
                # assert false, (hola)
                data = [{'id': '', 'text': '---------'}]
                for i in Materias.objects.filter(carrera_id=request.POST['id']):
                    data.append({'id': i.id, 'text': i.nombre})
            elif action == 'search_horarios_id':
                data = [{'id': '', 'text': 'Seleccione el horario de FIN'}]
                array_length = len(horarios_choices)
                # print(array_length)
                # horario_inicio = datetime.datetime.strptime(request.POST['id'], '%H:%M:%S')
                horario_inicio = request.POST['id']
                # print(horario_inicio)
                for i in range(array_length):
                    # horario = datetime.datetime.strptime(horarios_choices[i][0], '%H:%M:%S')
                    horario = horarios_choices[i][0]
                    # print(horario)
                    if horario > horario_inicio:
                        data.append({'id': horarios_choices[i][0], 'text': horarios_choices[i][1]})
                        # print(horarios_choices[i][1])
            elif action == 'autocomplete':
                data = []
                for i in Usuarios.objects.filter(dni=request.POST['term']):
                    item = i.toJSON()
                    item['value'] = i.dni
                    data.append(item)
            elif action == 'add':
                form = SolicitudesForm(request.POST)
                #Funcion de SUPERPOSICION DE MATERIAS FALTA AGREGAR
                ###################################################

                if form.is_valid():
                    form = self.get_form()
                    #id_sol = self.get_object()
                    # para grabar, comentar cuando se desee crear la reunion de Webex

                    data = form.save()

                    #Busco la ultima reserva creada para actualizar el valor del campo "estado"
                    ultima_adicion = Solicitudes.objects.order_by('-id')[0]
                    Solicitudes.objects.filter(pk=ultima_adicion.id).update(estado="CONFIRMADO")

                    #envio correo electronico de confirmacion
                    #send_email_confirmacion(form)

                    # Creando la Reunion en WEBEX --- DESCOMENTAR
                    ###################################################
                    #Estoy en la vista, por entrar a crearReunión()
                    #exito = crearReunion(form)

                    #if(exito["todo_correcto"] == 1):

                    #    data = form.save()
                    #    datos_faltantes = exito["datos_update"]
                    #    cuenta_asociada = exito["cuenta_asociada"]
                    #    camposRespuestaMeeting(datos_faltantes, cuenta_asociada)

                    #else:
                    #    assert False, ("NO SE PUDO CREAR LA REUNION")

                return redirect('solicitudes:solicitudes_list')
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear Solicitud'
        context['entity'] = 'Solicitudes'
        context['list_url'] = reverse_lazy('solicitudes:solicitudes_list')
        context['action'] = 'add'
        return context

class SolicitudesUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Solicitudes
    form_class = SolicitudesForm
    template_name = 'solicitudes/update.html'
    success_url = reverse_lazy('solicitudes:solicitudes_list')
    permission_required = 'solicitudes.change_solicitudes'
    url_redirect = success_url

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        self.object = self.get_object()
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_materias_id':
                data = [{'id': '', 'text': '---------'}]
                for i in Materias.objects.filter(carrera_id=request.POST['id']):
                    data.append({'id': i.id, 'text': i.nombre})
            elif action == 'search_horarios_id':
                data = [{'id': '', 'text': 'Seleccione el horario de FIN'}]
                array_length = len(horarios_choices)
                #print(array_length)
                horario_inicio = request.POST['id']
                #print(horario_inicio)
                for i in range(array_length):
                    horario = horarios_choices[i][0]
                    #print(horario)
                    if horario > horario_inicio:
                        data.append({'id': horarios_choices[i][0], 'text': horarios_choices[i][1]})
                        #print(horarios_choices[i][1])
            elif action == 'autocomplete':
                data = []
                for i in Usuarios.objects.filter(dni=request.POST['term']):
                    item = i.toJSON()
                    item['value'] = i.dni
                    data.append(item)
            elif action == 'edit':
                form = self.get_form()
                data = form.save()
            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Editar Solicitud'
        context['entity'] = 'solicitudes'
        context['list_url'] = reverse_lazy('solicitudes:solicitudes_list')
        context['action'] = 'edit'
        return context

class SolicitudesGenerateView(CreateView):
    model = Solicitudes
    form_class = GenerateSolicitudesForm
    template_name = 'solicitudes.html'
    success_url = reverse_lazy('solicitudes:solicitudes_generate')
    url_redirect = success_url

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_materias_id':
                #assert false, (hola)
                data = [{'id': '', 'text': '---------'}]
                for i in Materias.objects.filter(carrera_id=request.POST['id']):
                    data.append({'id': i.id, 'text': i.nombre})
            elif action == 'search_horarios_id':
                data = [{'id': '', 'text': 'Seleccione el horario de FIN'}]
                array_length = len(horarios_choices)
                #print(array_length)
                horario_inicio = request.POST['id']
                #print(horario_inicio)
                for i in range(array_length):
                    horario = horarios_choices[i][0]
                    #print(horario)
                    if horario > horario_inicio:
                        data.append({'id': horarios_choices[i][0], 'text': horarios_choices[i][1]})
                        #print(horarios_choices[i][1])
            elif action == 'autocomplete':
                data = []
                # Imprimir DNI Solicitante
                #print(request.POST['term'])
                for i in Usuarios.objects.filter(dni=request.POST['term']):
                    item = i.toJSON()
                    item['value'] = i.dni
                    data.append(item)
            elif action == 'add':
                form = SolicitudesForm(request.POST)
                #assert false, (hola)
                if form.is_valid():
                    #assert false, (hola)
                    form = self.get_form()
                    data = form.save()
                    # Enviar email de Solicitud de Reserva
                    #assert false, (hola)
                    #send_email(form)
                else:
                    data['error'] = 'Error en el Formulario'
                return redirect('solicitudes:solicitudes_generate')
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Generar Solicitud'
        context['entity'] = 'Solicitudes'
        context['list_url'] = reverse_lazy('solicitudes:solicitudes_generate')
        context['action'] = 'add'
        return context

class SolicitudesConfirmView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Solicitudes
    form_class = ConfirmSolicitudesForm
    template_name = 'solicitudes/confirm.html'
    success_url = reverse_lazy('solicitudes:solicitudes_pendientes_list')
    permission_required = 'solicitudes.change_solicitudes'
    url_redirect = success_url

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        self.object = self.get_object()
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_materias_id':
                data = [{'id': '', 'text': '---------'}]
                for i in Materias.objects.filter(carrera_id=request.POST['id']):
                    data.append({'id': i.id, 'text': i.nombre})
            if action == 'search_horarios_id':
                data = [{'id': '', 'text': 'Seleccione el horario de FIN'}]
                array_length = len(horarios_choices)
                #print(array_length)
                horario_inicio = request.POST['id']
                #print(horario_inicio)
                for i in range(array_length):
                    horario = horarios_choices[i][0]
                    #print(horario)
                    if horario > horario_inicio:
                        data.append({'id': horarios_choices[i][0], 'text': horarios_choices[i][1]})
                        #print(horarios_choices[i][1])
            elif action == 'autocomplete':
                data = []
                for i in Usuarios.objects.filter(dni=request.POST['term']):
                    item = i.toJSON()
                    item['value'] = i.dni
                    data.append(item)

            elif action == 'confirm':
                form = SolicitudesForm(request.POST)
                id_sol = self.get_object()

                #print("el id de solicitud es:")
                #print(id_sol.pk)
                if form.is_valid():
                    form = self.get_form()
                    id_sol = self.get_object()
                    # para grabar, comentar cuando se desee crear la reunion de Webex
                    id_sol.estado = "CONFIRMADO"
                    data = id_sol.save()

                    # envio correo electronico de confirmacion
                    # send_email_confirmacion(form)


                    # Creando la Reunion en WEBEX --- DESCOMENTAR
                    ###################################################
                    #exito = crearReunion(form)
                    
                    #if(exito["todo_correcto"] == 1):
                    #    data = form.save()
                    #    datos_faltantes = exito["datos_update"]
                    #    cuenta_asociada = exito["cuenta_asociada"]
                    #    camposRespuestaMeetingID(id_sol.pk, datos_faltantes, cuenta_asociada)
                    #else:
                    #    assert False, ("NO SE PUDO CREAR LA REUNION")

                return redirect('solicitudes:solicitudes_pendientes_list')

            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Confirmar Solicitud'
        context['entity'] = 'Solicitudes'
        context['list_url'] = reverse_lazy('solicitudes:solicitudes_pendientes_list')
        context['action'] = 'confirm'
        return context

class SolicitudesCancelView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Solicitudes
    form_class = ConfirmSolicitudesForm
    template_name = 'solicitudes/cancel.html'
    success_url = reverse_lazy('solicitudes:solicitudes_pendientes_list')
    permission_required = 'solicitudes.change_solicitudes'
    url_redirect = success_url

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        self.object = self.get_object()
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_materias_id':
                data = [{'id': '', 'text': '---------'}]
                for i in Materias.objects.filter(carrera_id=request.POST['id']):
                    data.append({'id': i.id, 'text': i.nombre})
            if action == 'search_horarios_id':
                data = [{'id': '', 'text': 'Seleccione el horario de FIN'}]
                array_length = len(horarios_choices)
                print(array_length)
                horario_inicio = request.POST['id']
                print(horario_inicio)
                for i in range(array_length):
                    horario = horarios_choices[i][0]
                    #print(horario)
                    if horario > horario_inicio:
                        data.append({'id': horarios_choices[i][0], 'text': horarios_choices[i][1]})
                        #print(horarios_choices[i][1])
            elif action == 'autocomplete':
                data = []
                for i in Usuarios.objects.filter(dni=request.POST['term']):
                    item = i.toJSON()
                    item['value'] = i.dni
                    data.append(item)
            elif action == 'cancel':
                form = SolicitudesForm(request.POST)
                if form.is_valid():
                    #form = self.get_form()
                    id_sol = self.get_object()
                    id_sol.estado = "CANCELADO"
                    data = id_sol.save()
                return redirect('solicitudes:solicitudes_pendientes_list')
            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Cancelar Solicitud'
        context['entity'] = 'Solicitudes'
        context['list_url'] = reverse_lazy('solicitudes:solicitudes_pendientes_list')
        context['action'] = 'cancel'
        return context

