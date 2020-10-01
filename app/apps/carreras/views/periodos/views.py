from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.carreras.forms import PeriodoCursadoForm
from apps.carreras.models import PeriodoCursado
from apps.mixins import ValidatePermissionRequiredMixin


def tipos_list(request):
    data = {
        'title': 'Listado de Periodos de Cursado',
        'periodo': PeriodoCursado.objects.all()
    }
    return render(request, 'periodos/list.html', data)


class PeriodoListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = PeriodoCursado
    template_name = 'periodos/list.html'
    permission_required = 'carreras.view_periodocursado'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in PeriodoCursado.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Periodos de Cursado'
        context['create_url'] = reverse_lazy('carreras:periodos_create')
        context['list_url'] = reverse_lazy('carreras:periodos_list')
        context['entity'] = 'Periodo'
        return context


class PeriodoCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = PeriodoCursado
    form_class = PeriodoCursadoForm
    template_name = 'periodos/create.html'
    success_url = reverse_lazy('carreras:periodos_list')
    permission_required = 'carreras.add_periodocursado'
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
        context['title'] = 'Crear un Periodo de Cursado'
        context['entity'] = 'Periodo'
        context['list_url'] = reverse_lazy('carreras:periodos_list')
        context['action'] = 'add'
        return context


class PeriodoUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = PeriodoCursado
    form_class = PeriodoCursadoForm
    template_name = 'periodos/create.html'
    success_url = reverse_lazy('carreras:periodos_list')
    permission_required = 'carreras.change_periodocursado'
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
        context['title'] = 'Editar Periodo de Cursado'
        context['entity'] = 'Periodo'
        context['list_url'] = reverse_lazy('carreras:periodos_list')
        context['action'] = 'edit'
        return context

class PeriodoDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = PeriodoCursado
    template_name = 'periodos/delete.html'
    success_url = reverse_lazy('carreras:periodos_list')
    permission_required = 'carreras.delete_periodocursado'
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
        context['title'] = 'Eliminar Periodo de Cursado'
        context['entity'] = 'Periodo'
        context['list_url'] = reverse_lazy('carreras:periodos_list')
        return context