from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.plataformas.forms import SalasVirtualesForm
from apps.plataformas.models import SalasVirtuales
from apps.mixins import ValidatePermissionRequiredMixin


def salas_virtuales_list(request):
    data = {
        'title': 'Listado de Salas Virtuales',
        'Salas Virtuales': SalasVirtuales.objects.all()
    }
    return render(request, 'salasvirtuales/list.html', data)


class SalasVirtualesListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = SalasVirtuales
    template_name = 'salasvirtuales/list.html'
    permission_required = 'plataformas.view_salasvirtuales'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in SalasVirtuales.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Salas Virtuales'
        context['create_url'] = reverse_lazy('plataformas:salas_virtuales_create')
        context['list_url'] = reverse_lazy('plataformas:salas_virtuales_list')
        context['entity'] = 'Salas Virtuales'
        return context


class SalasVirtualesCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = SalasVirtuales
    form_class = SalasVirtualesForm
    template_name = 'salasvirtuales/create.html'
    success_url = reverse_lazy('plataformas:salas_virtuales_list')
    permission_required = 'plataformas.add_salasvirtuales'
    url_redirect = success_url

    @method_decorator(csrf_exempt)
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
        context['title'] = 'Crear Sala Virtual'
        context['entity'] = 'Salas Virtuales'
        context['list_url'] = reverse_lazy('plataformas:salas_virtuales_list')
        context['action'] = 'add'
        return context


class SalasVirtualesUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = SalasVirtuales
    form_class = SalasVirtualesForm
    template_name = 'salasvirtuales/update.html'
    success_url = reverse_lazy('plataformas:salas_virtuales_list')
    permission_required = 'plataformas.change_salasvirtuales'
    url_redirect = success_url

    @method_decorator(csrf_exempt)
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
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Editar Sala Virtual'
        context['entity'] = 'Salas Virtuales'
        context['list_url'] = reverse_lazy('plataformas:salas_virtuales_list')
        context['action'] = 'edit'
        return context


class SalasVirtualesDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = SalasVirtuales
    template_name = 'salasvirtuales/delete.html'
    success_url = reverse_lazy('plataformas:salas_virtuales_list')
    permission_required = 'plataformas.delete_salasvirtuales'
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
        context['title'] = 'Eliminar Sala Virtual'
        context['entity'] = 'Salas Virtuales'
        context['list_url'] = reverse_lazy('plataformas:salas_virtuales_list')
        return context
