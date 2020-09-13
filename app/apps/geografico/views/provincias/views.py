from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.geografico.forms import ProvinciasForm
from apps.geografico.models import Provincias


def provincias_list(request):
    data = {
        'title': 'Listado de Provincias',
        'provincias': Provincias.objects.all()
    }
    return render(request, 'provincias/list.html', data)


class ProvinciasListView(ListView):
    model = Provincias
    template_name = 'provincias/list.html'

    @method_decorator(csrf_exempt)
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Provincias.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Provincias'
        context['create_url'] = reverse_lazy('geografico:provincias_create')
        context['list_url'] = reverse_lazy('geografico:provincias_list')
        context['entity'] = 'Provincias'
        return context


class ProvinciasCreateView(CreateView):
    model = Provincias
    form_class = ProvinciasForm
    template_name = 'provincias/create.html'
    success_url = reverse_lazy('geografico:provincias_list')

    @method_decorator(login_required)
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
        context['title'] = 'Crear una Provincia'
        context['entity'] = 'Provincia'
        context['list_url'] = reverse_lazy('geografico:provincias_list')
        context['action'] = 'add'
        return context


class ProvinciasUpdateView(UpdateView):
    model = Provincias
    form_class = ProvinciasForm
    template_name = 'provincias/create.html'
    success_url = reverse_lazy('geografico:provincias_list')

    @method_decorator(login_required)
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
        context['title'] = 'Editar Provincia'
        context['entity'] = 'Provincia'
        context['list_url'] = reverse_lazy('geografico:provincias_list')
        context['action'] = 'edit'
        return context

class ProvinciasDeleteView(DeleteView):
    model = Provincias
    template_name = 'provincias/delete.html'
    success_url = reverse_lazy('geografico:provincias_list')

    @method_decorator(login_required)
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
        context['title'] = 'Eliminar Provincia'
        context['entity'] = 'Provincia'
        context['list_url'] = reverse_lazy('geografico:provincias_list')
        return context