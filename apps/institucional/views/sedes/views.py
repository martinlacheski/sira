from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.institucional.forms import SedesForm
from apps.institucional.models import Sedes
from apps.mixins import ValidatePermissionRequiredMixin


def sedes_list(request):
    data = {
        'title': 'Sedes',
        'sedes': Sedes.objects.all()
    }
    return render(request, 'sedes/list.html', data)


class SedesListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = Sedes
    template_name = 'sedes/list.html'
    permission_required = 'institucional.view_sedes'

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
                for i in Sedes.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Sedes'
        context['create_url'] = reverse_lazy('institucional:sedes_create')
        context['list_url'] = reverse_lazy('institucional:sedes_list')
        context['entity'] = 'Sedes'
        return context


class SedesCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = Sedes
    form_class = SedesForm
    template_name = 'sedes/create.html'
    success_url = reverse_lazy('institucional:sedes_list')
    permission_required = 'institucional.add_sedes'
    url_redirect = success_url

    #@method_decorator(login_required)
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
        context['title'] = 'Crear una Sede'
        context['entity'] = 'Sedes'
        context['list_url'] = reverse_lazy('institucional:sedes_list')
        context['action'] = 'add'
        return context


class SedesUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Sedes
    form_class = SedesForm
    template_name = 'sedes/create.html'
    success_url = reverse_lazy('institucional:sedes_list')
    permission_required = 'institucional.change_sedes'
    url_redirect = success_url

    #@method_decorator(login_required)
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
        context['title'] = 'Editar Sede'
        context['entity'] = 'Sedes'
        context['list_url'] = reverse_lazy('institucional:sedes_list')
        context['action'] = 'edit'
        return context

class SedesDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = Sedes
    template_name = 'sedes/delete.html'
    success_url = reverse_lazy('institucional:sedes_list')
    permission_required = 'institucional.delete_sedes'
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
        context['title'] = 'Eliminar Sede'
        context['entity'] = 'Sedes'
        context['list_url'] = reverse_lazy('institucional:sedes_list')
        return context