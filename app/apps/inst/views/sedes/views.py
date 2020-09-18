from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.inst.forms import SedesForm
from apps.inst.models import Sedes


def sedes_list(request):
    data = {
        'title': 'Sedes',
        'sedes': Sedes.objects.all()
    }
    return render(request, 'sedes/list.html', data)


class SedesListView(ListView):
    model = Sedes
    template_name = 'sedes/list.html'

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
        context['create_url'] = reverse_lazy('inst:sedes_create')
        context['list_url'] = reverse_lazy('inst:sedes_list')
        context['entity'] = 'Sedes'
        return context


class SedesCreateView(CreateView):
    model = Sedes
    form_class = SedesForm
    template_name = 'sedes/create.html'
    success_url = reverse_lazy('inst:sedes_list')

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
        context['title'] = 'Crear una Sede'
        context['entity'] = 'Sedes'
        context['list_url'] = reverse_lazy('inst:sedes_list')
        context['action'] = 'add'
        return context


class SedesUpdateView(UpdateView):
    model = Sedes
    form_class = SedesForm
    template_name = 'sedes/create.html'
    success_url = reverse_lazy('inst:sedes_list')

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
        context['title'] = 'Editar Sede'
        context['entity'] = 'Sedes'
        context['list_url'] = reverse_lazy('inst:sedes_list')
        context['action'] = 'edit'
        return context

class SedesDeleteView(DeleteView):
    model = Sedes
    template_name = 'sedes/delete.html'
    success_url = reverse_lazy('inst:sedes_list')

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
        context['title'] = 'Eliminar Sede'
        context['entity'] = 'Sedes'
        context['list_url'] = reverse_lazy('inst:sedes_list')
        return context