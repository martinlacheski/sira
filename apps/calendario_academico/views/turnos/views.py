from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.calendario_academico.forms import TurnosExamenForm
from apps.calendario_academico.models import TurnosExamen
from apps.mixins import ValidatePermissionRequiredMixin


def turnos_list(request):
    data = {
        'title': 'Listado de Turnos de Examen',
        'turnos de examen': TurnosExamen.objects.all()
    }
    return render(request, 'turnos/list.html', data)


class TurnosListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = TurnosExamen
    template_name = 'turnos/list.html'
    permission_required = 'calendario_academico.view_turnosexamen'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in TurnosExamen.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Turnos de Examen'
        context['create_url'] = reverse_lazy('calendario_academico:turnos_create')
        context['list_url'] = reverse_lazy('calendario_academico:turnos_list')
        context['entity'] = 'Turno'
        return context


class TurnosCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = TurnosExamen
    form_class = TurnosExamenForm
    template_name = 'turnos/create.html'
    success_url = reverse_lazy('calendario_academico:turnos_list')
    permission_required = 'calendario_academico.add_turnosexamen'
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
        context['title'] = 'Crear un Turno de Examen'
        context['entity'] = 'Turno'
        context['list_url'] = reverse_lazy('calendario_academico:turnos_list')
        context['action'] = 'add'
        return context


class TurnosUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = TurnosExamen
    form_class = TurnosExamenForm
    template_name = 'turnos/create.html'
    success_url = reverse_lazy('calendario_academico:turnos_list')
    permission_required = 'calendario_academico.change_turnosexamen'
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
        context['title'] = 'Editar Turno de Examen'
        context['entity'] = 'Turno'
        context['list_url'] = reverse_lazy('calendario_academico:turnos_list')
        context['action'] = 'edit'
        return context

class TurnosDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = TurnosExamen
    template_name = 'turnos/delete.html'
    success_url = reverse_lazy('calendario_academico:turnos_list')
    permission_required = 'calendario_academico.delete_turnosexamen'
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
        context['title'] = 'Eliminar Turno de Examen'
        context['entity'] = 'Turno'
        context['list_url'] = reverse_lazy('calendario_academico:turnos_list')
        return context