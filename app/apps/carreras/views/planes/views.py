from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.carreras.forms import PlanesForm
from apps.carreras.models import PlanesEstudios
from apps.mixins import ValidatePermissionRequiredMixin


def carreras_list(request):
    data = {
        'title': 'Listado de Planes de Estudios',
        'carreras': PlanesEstudios.objects.all()
    }
    return render(request, 'planes/list.html', data)


class PlanesListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = PlanesEstudios
    template_name = 'planes/list.html'
    permission_required = 'carreras.view_planesestudios'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in PlanesEstudios.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Planes de Estudios'
        context['create_url'] = reverse_lazy('carreras:planes_create')
        context['list_url'] = reverse_lazy('carreras:planes_list')
        context['entity'] = 'Plan'
        return context


class PlanesCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = PlanesEstudios
    form_class = PlanesForm
    template_name = 'planes/create.html'
    success_url = reverse_lazy('carreras:planes_list')
    permission_required = 'carreras.add_planesestudios'
    url_redirect = success_url

    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'add':
                form = PlanesForm(request.POST)
                form = self.get_form()
                data = form.save()
            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear un Plan de Estudios'
        context['entity'] = 'Plan'
        context['list_url'] = reverse_lazy('carreras:planes_list')
        context['action'] = 'add'
        return context


class PlanesUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = PlanesEstudios
    form_class = PlanesForm
    template_name = 'planes/create.html'
    success_url = reverse_lazy('carreras:planes_list')
    permission_required = 'carreras.change_planesestudios'
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
        context['title'] = 'Editar Plan de Estudios'
        context['entity'] = 'Plan'
        context['list_url'] = reverse_lazy('carreras:planes_list')
        context['action'] = 'edit'
        return context

class PlanesDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = PlanesEstudios
    template_name = 'planes/delete.html'
    success_url = reverse_lazy('carreras:planes_list')
    permission_required = 'carreras.delete_planesestudios'
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
        context['title'] = 'Eliminar Plan de Estudios'
        context['entity'] = 'Plan'
        context['list_url'] = reverse_lazy('carreras:planes_list')
        return context