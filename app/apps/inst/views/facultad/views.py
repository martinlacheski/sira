from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.inst.forms import FacultadForm
from apps.inst.models import Facultad


def facultad_list(request):
    data = {
        'title': 'Facultad',
        'facultad': Facultad.objects.all()
    }
    return render(request, 'facultad/list.html', data)


class FacultadListView(ListView):
    model = Facultad
    template_name = 'facultad/list.html'

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
                for i in Facultad.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Facultad'
        context['create_url'] = reverse_lazy('inst:facultad_create')
        context['list_url'] = reverse_lazy('inst:facultad_list')
        context['entity'] = 'Facultad'
        return context


class FacultadCreateView(CreateView):
    model = Facultad
    form_class = FacultadForm
    template_name = 'facultad/create.html'
    success_url = reverse_lazy('inst:facultad_list')

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
        context['title'] = 'Crear una Facultad'
        context['entity'] = 'Facultad'
        context['list_url'] = reverse_lazy('inst:facultad_list')
        context['action'] = 'add'
        return context


class FacultadUpdateView(UpdateView):
    model = Facultad
    form_class = FacultadForm
    template_name = 'facultad/create.html'
    success_url = reverse_lazy('inst:facultad_list')

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
        context['title'] = 'Editar Facultad'
        context['entity'] = 'Facultad'
        context['list_url'] = reverse_lazy('inst:facultad_list')
        context['action'] = 'edit'
        return context

class FacultadDeleteView(DeleteView):
    model = Facultad
    template_name = 'facultad/delete.html'
    success_url = reverse_lazy('inst:facultad_list')

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
        context['title'] = 'Eliminar Facultad'
        context['entity'] = 'Facultad'
        context['list_url'] = reverse_lazy('inst:facultad_list')
        return context