from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from django.utils.decorators import method_decorator

from apps.carreras.forms import MateriasForm
from apps.carreras.models import Materias, AnioCursado, Carreras
from apps.mixins import ValidatePermissionRequiredMixin


def materias_list(request):
    data = {
        'title': 'Listado de Materias',
        'materias': Materias.objects.all()
    }
    return render(request, 'materias/list.html', data)


class MateriasListView(LoginRequiredMixin, ValidatePermissionRequiredMixin, ListView):
    model = Materias
    template_name = 'materias/list.html'
    permission_required = 'carreras.view_materias'

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'searchdata':
                data = []
                for i in Materias.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Materias'
        context['create_url'] = reverse_lazy('carreras:materias_create')
        context['list_url'] = reverse_lazy('carreras:materias_list')
        context['entity'] = 'Materias'
        return context


class MateriasCreateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, CreateView):
    model = Materias
    form_class = MateriasForm
    template_name = 'materias/create.html'
    success_url = reverse_lazy('carreras:materias_list')
    permission_required = 'carreras.add_materias'
    url_redirect = success_url

    @method_decorator(csrf_exempt)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    #MODO NORMAL
    #def post(self, request, *args, **kwargs):
    #    data = {}
    #    try:
    #        action = request.POST['action']
    #        if action == 'add':
    #            form = MateriasForm(request.POST)
    #            form = self.get_form()
    #            data = form.save()
    #        else:
    #            data['error'] = 'No ha ingresado ninguna opción'
    #    except Exception as e:
    #        data['error'] = str(e)
    #    return JsonResponse(data)

    #Modo con AJAX para controlar los años en el combobox
    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'search_anios_id':
                carrera = Carreras.objects.get(pk=request.POST['id'])
                #print(carrera.duracion)
                anios = carrera.duracion
                print(anios)
                data = [{'id': '', 'text': '---------'}]
                #for i in AnioCursado.objects.filter(nombre=request.POST['id']):
                for i in AnioCursado.objects.filter(nombre__gte=1, nombre__lte=anios):
                    data.append({'id': i.id, 'text': i.nombre})
            elif action == 'add':
                form = MateriasForm(request.POST)
                if form.is_valid():
                    form = self.get_form()
                    data = form.save()
                return redirect('carreras:materias_list')
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear una Materia'
        context['entity'] = 'Materias'
        context['list_url'] = reverse_lazy('carreras:materias_list')
        context['action'] = 'add'
        return context


class MateriasUpdateView(LoginRequiredMixin, ValidatePermissionRequiredMixin, UpdateView):
    model = Materias
    form_class = MateriasForm
    template_name = 'materias/create.html'
    success_url = reverse_lazy('carreras:materias_list')
    permission_required = 'carreras.change_materias'
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
        context['title'] = 'Editar Materia'
        context['entity'] = 'Materias'
        context['list_url'] = reverse_lazy('carreras:materias_list')
        context['action'] = 'edit'
        return context

class MateriasDeleteView(LoginRequiredMixin, ValidatePermissionRequiredMixin, DeleteView):
    model = Materias
    template_name = 'materias/delete.html'
    success_url = reverse_lazy('carreras:materias_list')
    permission_required = 'carreras.delete_materias'
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
        context['title'] = 'Eliminar Materia'
        context['entity'] = 'Materias'
        context['list_url'] = reverse_lazy('carreras:materias_list')
        return context