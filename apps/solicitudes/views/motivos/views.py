from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.solicitudes.forms import MotivoSolicitudForm
from apps.solicitudes.models import Motivos
from apps.mixins import ValidatePermissionRequiredMixin


def motivos_list(request):
    data = {
        'title': 'Listado de Motivos',
        'motivos': Motivos.objects.all()
    }
    return render(request, 'motivos/list.html', data)


class MotivoSolicitudListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = Motivos
    template_name = 'motivos/list.html'
    permission_required = 'solicitudes.view_motivos'

    @method_decorator(csrf_exempt)
    #@method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Motivos.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Motivos'
        context['create_url'] = reverse_lazy('solicitudes:motivos_create')
        context['list_url'] = reverse_lazy('solicitudes:motivos_list')
        context['entity'] = 'Motivos'
        return context


class MotivoSolicitudCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = Motivos
    form_class = MotivoSolicitudForm
    template_name = 'motivos/create.html'
    success_url = reverse_lazy('solicitudes:motivos_list')
    permission_required = 'solicitudes.add_motivos'
    url_redirect = success_url

    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'add':
                form = MotivoSolicitudForm(request.POST)
                form = self.get_form()
                data = form.save()
            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear un Motivo de Solicitud'
        context['entity'] = 'Motivos'
        context['list_url'] = reverse_lazy('solicitudes:motivos_list')
        context['action'] = 'add'
        return context


class MotivoSolicitudUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Motivos
    form_class = MotivoSolicitudForm
    template_name = 'motivos/create.html'
    success_url = reverse_lazy('solicitudes:motivos_list')
    permission_required = 'solicitudes.change_motivos'
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
        context['title'] = 'Editar Motivo de Solicitud'
        context['entity'] = 'Motivos'
        context['list_url'] = reverse_lazy('solicitudes:motivos_list')
        context['action'] = 'edit'
        return context

class MotivoSolicitudDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = Motivos
    template_name = 'motivos/delete.html'
    success_url = reverse_lazy('solicitudes:motivos_list')
    permission_required = 'solicitudes.delete_motivos'
    url_redirect = success_url

    #@method_decorator(login_required)
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
        context['title'] = 'Eliminar Motivo de Solicitud'
        context['entity'] = 'Motivos'
        context['list_url'] = reverse_lazy('solicitudes:motivos_list')
        return context