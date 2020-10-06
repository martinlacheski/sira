from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.mixins import ValidatePermissionRequiredMixin
from apps.usuarios.forms import DocentesForm
from apps.usuarios.models import Docentes


class DocentesListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = Docentes
    template_name = 'docentes/list.html'
    permission_required = 'usuarios.view_docentes'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Docentes.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Docentes'
        context['create_url'] = reverse_lazy('usuarios:docentes_create')
        context['list_url'] = reverse_lazy('usuarios:docentes_list')
        context['entity'] = 'Docentes'
        return context

class DocentesCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = Docentes
    form_class = DocentesForm
    template_name = 'docentes/create.html'
    success_url = reverse_lazy('usuarios:docentes_list')
    permission_required = 'usuarios.add_docentes'
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
        context['title'] = 'Crear un Docente'
        context['entity'] = 'Docentes'
        context['list_url'] = reverse_lazy('usuarios:docentes_list')
        context['action'] = 'add'
        return context

class DocentesUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Docentes
    form_class = DocentesForm
    template_name = 'docentes/create.html'
    success_url = reverse_lazy('usuarios:docentes_list')
    permission_required = 'usuarios.change_docentes'
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
        context['title'] = 'Editar Docente'
        context['entity'] = 'Docentes'
        context['list_url'] = reverse_lazy('usuarios:docentes_list')
        context['action'] = 'edit'
        return context

class DocentesDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = Docentes
    template_name = 'docentes/delete.html'
    success_url = reverse_lazy('usuarios:docentes_list')
    permission_required = 'usuarios.delete_docentes'
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
        context['title'] = 'Eliminar Docente'
        context['entity'] = 'Docentes'
        context['list_url'] = reverse_lazy('usuarios:docentes_list')
        return context