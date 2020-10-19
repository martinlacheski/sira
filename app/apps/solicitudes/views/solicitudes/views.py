from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.solicitudes.create_meeting import *
from apps.solicitudes.forms import SolicitudesForm, Materias
from apps.solicitudes.models import Solicitudes
from apps.mixins import ValidatePermissionRequiredMixin
from apps.usuarios.models import Docentes


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
                data = [{'id': '', 'text': '---------'}]
                for i in Materias.objects.filter(carrera_id=request.POST['id']):
                    data.append({'id': i.id, 'text': i.nombre})
            elif action == 'autocomplete':
                data = []
                for i in Docentes.objects.filter(dni=request.POST['term']):
                    item = i.toJSON()
                    item['value'] = i.dni
                    data.append(item)
            elif action == 'add':
                form = SolicitudesForm(request.POST)
                #Crear REUNION en WEBEX

                crearReunion(form)
                #assert false, (form)
                if form.is_valid():
                    form = self.get_form()
                    data = form.save()
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
            elif action == 'autocomplete':
                data = []
                for i in Docentes.objects.filter(dni=request.POST['term']):
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


class SolicitudesDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = Solicitudes
    template_name = 'solicitudes/delete.html'
    success_url = reverse_lazy('solicitudes:solicitudes_list')
    permission_required = 'solicitudes.delete_solicitudes'
    url_redirect = success_url

    def dispatch(self, request, *args, **kwargs):
        self.object = self.get_object()
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            self.object.delete()
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Eliminar Solicitud'
        context['entity'] = 'Solicitudes'
        context['list_url'] = reverse_lazy('solicitudes:solicitudes_list')
        return context
