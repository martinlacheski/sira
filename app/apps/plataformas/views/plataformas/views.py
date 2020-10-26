from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.plataformas.forms import PlataformasForm
from apps.plataformas.models import Plataformas
from apps.mixins import ValidatePermissionRequiredMixin


def plataformas_list(request):
    data = {
        'title': 'Listado de Plataformas Virtuales',
        'plataforma': Plataformas.objects.all()
    }
    return render(request, 'plataformas/list.html', data)


class PlataformasListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = Plataformas
    template_name = 'plataformas/list.html'
    permission_required = 'plataformas.view_plataformas'

    @method_decorator(csrf_exempt)

    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Plataformas.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Plataformas Virtuales'
        context['create_url'] = reverse_lazy('plataformas:plataformas_create')
        context['list_url'] = reverse_lazy('plataformas:plataformas_list')
        context['entity'] = 'Plataforma'
        return context


class PlataformasCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = Plataformas
    form_class = PlataformasForm
    template_name = 'plataformas/create.html'
    success_url = reverse_lazy('plataformas:plataformas_list')
    permission_required = 'plataformas.add_plataformas'
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
        context['title'] = 'Crear una Plataforma Virtual'
        context['entity'] = 'Plataforma'
        context['list_url'] = reverse_lazy('plataformas:plataformas_list')
        context['action'] = 'add'
        return context


class PlataformasUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Plataformas
    form_class = PlataformasForm
    template_name = 'plataformas/create.html'
    success_url = reverse_lazy('plataformas:plataformas_list')
    permission_required = 'plataformas.change_plataformas'
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
        context['title'] = 'Editar una Plataforma Virtual'
        context['entity'] = 'Plataforma'
        context['list_url'] = reverse_lazy('plataformas:plataformas_list')
        context['action'] = 'edit'
        return context

class PlataformasDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = Plataformas
    template_name = 'plataformas/delete.html'
    success_url = reverse_lazy('plataformas:plataformas_list')
    permission_required = 'plataformas.delete_plataformas'
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
        context['title'] = 'Eliminar Plataforma Virtual'
        context['entity'] = 'Plataforma'
        context['list_url'] = reverse_lazy('plataformas:plataformas_list')
        return context