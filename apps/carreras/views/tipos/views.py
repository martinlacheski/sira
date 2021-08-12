from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.carreras.forms import TiposCarrerasForm
from apps.carreras.models import TiposCarreras
from apps.mixins import ValidatePermissionRequiredMixin


def tipos_carreras_list(request):
    data = {
        'title': 'Listado de Tipos de Carreras',
        'tipos_carreras': TiposCarreras.objects.all()
    }
    return render(request, 'tipo_carrera/list.html', data)


class TiposListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = TiposCarreras
    template_name = 'tipo_carrera/list.html'
    permission_required = 'carreras.view_tiposcarreras'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in TiposCarreras.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Tipos de Carreras'
        context['create_url'] = reverse_lazy('carreras:tipo_carrera_create')
        context['list_url'] = reverse_lazy('carreras:tipo_carrera_list')
        context['entity'] = 'Tipos'
        return context


class TiposCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = TiposCarreras
    form_class = TiposCarrerasForm
    template_name = 'tipo_carrera/create.html'
    success_url = reverse_lazy('carreras:tipo_carrera_list')
    permission_required = 'carreras.add_tiposcarreras'
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
        context['title'] = 'Crear un Tipo de Carrera'
        context['entity'] = 'Tipos'
        context['list_url'] = reverse_lazy('carreras:tipo_carrera_list')
        context['action'] = 'add'
        return context


class TiposUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = TiposCarreras
    form_class = TiposCarrerasForm
    template_name = 'tipo_carrera/create.html'
    success_url = reverse_lazy('carreras:tipo_carrera_list')
    permission_required = 'carreras.change_tiposcarreras'
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
        context['title'] = 'Editar Tipo de Carrera'
        context['entity'] = 'Tipos'
        context['list_url'] = reverse_lazy('carreras:tipo_carrera_list')
        context['action'] = 'edit'
        return context

class TiposDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = TiposCarreras
    template_name = 'tipo_carrera/delete.html'
    success_url = reverse_lazy('carreras:tipo_carrera_list')
    permission_required = 'carreras.delete_tiposcarreras'
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
        context['title'] = 'Eliminar Tipo de Carrera'
        context['entity'] = 'Tipos'
        context['list_url'] = reverse_lazy('carreras:tipo_carrera_list')
        return context