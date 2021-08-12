from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.calendario_academico.forms import CalendarioAcademicoForm
from apps.calendario_academico.models import CalendarioAcademico
from apps.mixins import ValidatePermissionRequiredMixin


def calendarios_list(request):
    data = {
        'title': 'Listado de Calendarios Académicos',
        'calendario_academico': CalendarioAcademico.objects.all()
    }
    return render(request, 'calendarios/list.html', data)


class CalendarioListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = CalendarioAcademico
    template_name = 'calendarios/list.html'
    permission_required = 'calendario_academico.view_calendario_academico'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in CalendarioAcademico.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Calendarios Académicos'
        context['create_url'] = reverse_lazy('calendario_academico:calendario_create')
        context['list_url'] = reverse_lazy('calendario_academico:calendario_list')
        context['entity'] = 'Calendario'
        return context


class CalendarioCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = CalendarioAcademico
    form_class = CalendarioAcademicoForm
    template_name = 'calendarios/create.html'
    success_url = reverse_lazy('calendario_academico:calendario_list')
    permission_required = 'calendario_academico.add_calendario_academico'
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
        context['title'] = 'Crear un Calendario Académico'
        context['entity'] = 'Calendario'
        context['list_url'] = reverse_lazy('calendario_academico:calendario_list')
        context['action'] = 'add'
        return context


class CalendarioUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = CalendarioAcademico
    form_class = CalendarioAcademicoForm
    template_name = 'calendarios/create.html'
    success_url = reverse_lazy('calendario_academico:calendario_list')
    permission_required = 'calendario_academico.change_calendario_academico'
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
        context['title'] = 'Editar Calendario Académico'
        context['entity'] = 'Calendario'
        context['list_url'] = reverse_lazy('calendario_academico:calendario_list')
        context['action'] = 'edit'
        return context

class CalendarioDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = CalendarioAcademico
    template_name = 'calendarios/delete.html'
    success_url = reverse_lazy('calendario_academico:calendario_list')
    permission_required = 'calendario_academico.delete_calendario_academico'
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
        context['title'] = 'Eliminar Calendario Académico'
        context['entity'] = 'Calendario'
        context['list_url'] = reverse_lazy('calendario_academico:calendario_list')
        return context