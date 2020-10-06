from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.carreras.forms import TiposComisionesForm
from apps.carreras.models import TiposComisiones
from apps.mixins import ValidatePermissionRequiredMixin


def tipo_comision_list(request):
    data = {
        'title': 'Listado de Tipos de Comisiones',
        'tipos_comisiones': TiposComisiones.objects.all()
    }
    return render(request, 'tipo_comision/list.html', data)


class TipoComisionListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = TiposComisiones
    template_name = 'tipo_comision/list.html'
    permission_required = 'carreras.view_tiposcomisiones'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in TiposComisiones.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Tipos de Comisiones'
        context['create_url'] = reverse_lazy('carreras:tipo_comision_create')
        context['list_url'] = reverse_lazy('carreras:tipo_comision_list')
        context['entity'] = 'Tipos'
        return context


class TipoComisionCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = TiposComisiones
    form_class = TiposComisionesForm
    template_name = 'tipo_comision/create.html'
    success_url = reverse_lazy('carreras:tipo_comision_list')
    permission_required = 'carreras.add_tiposcomisiones'
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
        context['title'] = 'Crear un Tipo de Comisión'
        context['entity'] = 'Tipos'
        context['list_url'] = reverse_lazy('carreras:tipo_comision_list')
        context['action'] = 'add'
        return context


class TipoComisionUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = TiposComisiones
    form_class = TiposComisionesForm
    template_name = 'tipo_comision/create.html'
    success_url = reverse_lazy('carreras:tipo_comision_list')
    permission_required = 'carreras.change_tiposcomisiones'
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
        context['title'] = 'Editar Tipo de Comisión'
        context['entity'] = 'Tipos'
        context['list_url'] = reverse_lazy('carreras:tipo_comision_list')
        context['action'] = 'edit'
        return context

class TipoComisionDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = TiposComisiones
    template_name = 'tipo_comision/delete.html'
    success_url = reverse_lazy('carreras:tipo_comision_list')
    permission_required = 'carreras.delete_tiposcomisiones'
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
        context['title'] = 'Eliminar Tipo de Comisión'
        context['entity'] = 'Tipos'
        context['list_url'] = reverse_lazy('carreras:tipo_comision_list')
        return context