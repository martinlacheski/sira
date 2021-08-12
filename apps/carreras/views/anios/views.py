from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.carreras.forms import AnioCursadoForm
from apps.carreras.models import AnioCursado
from apps.mixins import ValidatePermissionRequiredMixin


def tipos_list(request):
    data = {
        'title': 'Listado de Años de Cursado',
        'tipos': AnioCursado.objects.all()
    }
    return render(request, 'anios/list.html', data)


class AniosListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = AnioCursado
    template_name = 'anios/list.html'
    permission_required = 'carreras.view_aniocursado'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in AnioCursado.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Años de Cursado'
        context['create_url'] = reverse_lazy('carreras:anios_create')
        context['list_url'] = reverse_lazy('carreras:anios_list')
        context['entity'] = 'Anios'
        return context


class AniosCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = AnioCursado
    form_class = AnioCursadoForm
    template_name = 'anios/create.html'
    success_url = reverse_lazy('carreras:anios_list')
    permission_required = 'carreras.add_aniocursado'
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
        context['title'] = 'Crear un Año de Cursado'
        context['entity'] = 'Anios'
        context['list_url'] = reverse_lazy('carreras:anios_list')
        context['action'] = 'add'
        return context


class AniosUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = AnioCursado
    form_class = AnioCursadoForm
    template_name = 'anios/create.html'
    success_url = reverse_lazy('carreras:anios_list')
    permission_required = 'carreras.change_aniocursado'
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
        context['title'] = 'Editar Año de Cursado'
        context['entity'] = 'Anios'
        context['list_url'] = reverse_lazy('carreras:anios_list')
        context['action'] = 'edit'
        return context

class AniosDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = AnioCursado
    template_name = 'anios/delete.html'
    success_url = reverse_lazy('carreras:anios_list')
    permission_required = 'carreras.delete_aniocursado'
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
        context['title'] = 'Eliminar Año de Cursado'
        context['entity'] = 'Anios'
        context['list_url'] = reverse_lazy('carreras:anios_list')
        return context