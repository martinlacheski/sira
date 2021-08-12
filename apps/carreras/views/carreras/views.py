from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.carreras.forms import CarrerasForm
from apps.carreras.models import Carreras
from apps.mixins import ValidatePermissionRequiredMixin


def carreras_list(request):
    data = {
        'title': 'Listado de Carreras',
        'carreras': Carreras.objects.all()
    }
    return render(request, 'carreras/list.html', data)


class CarrerasListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = Carreras
    template_name = 'carreras/list.html'
    permission_required = 'carreras.view_carreras'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Carreras.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Carreras'
        context['create_url'] = reverse_lazy('carreras:carreras_create')
        context['list_url'] = reverse_lazy('carreras:carreras_list')
        context['entity'] = 'Carreras'
        return context


class CarrerasCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = Carreras
    form_class = CarrerasForm
    template_name = 'carreras/create.html'
    success_url = reverse_lazy('carreras:carreras_list')
    permission_required = 'carreras.add_carreras'
    url_redirect = success_url

    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'add':
                form = CarrerasForm(request.POST)
                form = self.get_form()
                data = form.save()
            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear una Carrera'
        context['entity'] = 'Carrera'
        context['list_url'] = reverse_lazy('carreras:carreras_list')
        context['action'] = 'add'
        return context


class CarrerasUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Carreras
    form_class = CarrerasForm
    template_name = 'carreras/create.html'
    success_url = reverse_lazy('carreras:carreras_list')
    permission_required = 'carreras.change_carreras'
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
        context['title'] = 'Editar Carrera'
        context['entity'] = 'Carrera'
        context['list_url'] = reverse_lazy('carreras:carreras_list')
        context['action'] = 'edit'
        return context

class CarrerasDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = Carreras
    template_name = 'carreras/delete.html'
    success_url = reverse_lazy('carreras:carreras_list')
    permission_required = 'carreras.delete_carreras'
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
        context['title'] = 'Eliminar Carrera'
        context['entity'] = 'Carrera'
        context['list_url'] = reverse_lazy('carreras:carreras_list')
        return context