from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.inst.forms import UniversidadForm
from apps.inst.models import Universidad


def universidad_list(request):
    data = {
        'title': 'Universidad',
        'universidad': Universidad.objects.all()
    }
    return render(request, 'universidad/list.html', data)


class UniversidadListView(ListView):
    model = Universidad
    template_name = 'universidad/list.html'

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
                for i in Universidad.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Universidad'
        context['create_url'] = reverse_lazy('inst:universidad_create')
        context['list_url'] = reverse_lazy('inst:universidad_list')
        context['entity'] = 'Universidad'
        return context


class UniversidadCreateView(CreateView):
    model = Universidad
    form_class = UniversidadForm
    template_name = 'universidad/create.html'
    success_url = reverse_lazy('inst:universidad_list')

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
        context['title'] = 'Crear una Universidad'
        context['entity'] = 'Universidad'
        context['list_url'] = reverse_lazy('inst:universidad_list')
        context['action'] = 'add'
        return context


class UniversidadUpdateView(UpdateView):
    model = Universidad
    form_class = UniversidadForm
    template_name = 'universidad/create.html'
    success_url = reverse_lazy('inst:universidad_list')

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
        context['title'] = 'Editar Universidad'
        context['entity'] = 'Universidad'
        context['list_url'] = reverse_lazy('inst:universidad_list')
        context['action'] = 'edit'
        return context

class UniversidadDeleteView(DeleteView):
    model = Universidad
    template_name = 'universidad/delete.html'
    success_url = reverse_lazy('inst:universidad_list')

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
        context['title'] = 'Eliminar Universidad'
        context['entity'] = 'Universidad'
        context['list_url'] = reverse_lazy('inst:universidad_list')
        return context