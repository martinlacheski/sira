from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.solicitudes.forms import TipoSolicitudForm
from apps.solicitudes.models import TipoSolicitud
from apps.mixins import ValidatePermissionRequiredMixin


def tipo_solicitud_list(request):
    data = {
        'title': 'Listado de Tipos de Reservas',
        'tipo_solicitud': TipoSolicitud.objects.all()
    }
    return render(request, 'tipo_solicitud/list.html', data)


class TipoSolicitudListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = TipoSolicitud
    template_name = 'tipo_solicitud/list.html'
    permission_required = 'solicitud_reserva.view_tipo_solicitud'

    @method_decorator(csrf_exempt)

    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in TipoSolicitud.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Tipos de Reservas'
        context['create_url'] = reverse_lazy('solicitudes:tipo_solicitud_create')
        context['list_url'] = reverse_lazy('solicitudes:tipo_solicitud_list')
        context['entity'] = 'Tipos de Reservas'
        return context


class TipoSolicitudCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = TipoSolicitud
    form_class = TipoSolicitudForm
    template_name = 'tipo_solicitud/create.html'
    success_url = reverse_lazy('solicitudes:tipo_solicitud_list')
    permission_required = 'solicitudes.add_tipo_solicitud'
    url_redirect = success_url

    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'add':
                form = self.get_form()
                data = form.save()
            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear un Tipo de Reserva'
        context['entity'] = 'Tipos de Reservas'
        context['list_url'] = reverse_lazy('solicitudes:tipo_solicitud_list')
        context['action'] = 'add'
        return context


class TipoSolicitudUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = TipoSolicitud
    form_class = TipoSolicitudForm
    template_name = 'tipo_solicitud/create.html'
    success_url = reverse_lazy('solicitudes:tipo_solicitud_list')
    permission_required = 'solicitudes.change_tipo_solicitud'
    url_redirect = success_url

    def dispatch(self, request, *args, **kwargs):
        self.object = self.get_object()
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'edit':
                form = self.get_form()
                data = form.save()
            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Editar un Tipo de Reserva'
        context['entity'] = 'Tipos de Reservas'
        context['list_url'] = reverse_lazy('solicitudes:tipo_solicitud_list')
        context['action'] = 'edit'
        return context

class TipoSolicitudDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = TipoSolicitud
    template_name = 'tipo_solicitud/delete.html'
    success_url = reverse_lazy('solicitudes:tipo_solicitud_list')
    permission_required = 'solicitudes.delete_tipo_solicitud'
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
        context['title'] = 'Eliminar Tipo de Reserva'
        context['entity'] = 'Tipos de Reservas'
        context['list_url'] = reverse_lazy('solicitudes:tipo_solicitud_list')
        return context