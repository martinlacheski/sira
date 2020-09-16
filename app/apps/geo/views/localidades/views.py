from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import ListView, CreateView, UpdateView, DeleteView, TemplateView
from django.utils.decorators import method_decorator

from apps.geo.forms import LocalidadesForm, LocalidadesCreateForm
from apps.geo.models import Localidades, Provincias


def localidades_list(request):
    data = {
        'title': 'Listado de Localidades',
        'localidades': Localidades.objects.all()
    }
    return render(request, 'localidades/list.html', data)


class LocalidadesListView(ListView):
    model = Localidades
    template_name = 'localidades/list.html'

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
                for i in Localidades.objects.all():
                    data.append(i.toJSON())
            else:
                data['error'] = 'Ha ocurrido un error'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data, safe=False)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Listado de Localidades'
        context['create_url'] = reverse_lazy('geo:localidades_create')
        context['list_url'] = reverse_lazy('geo:localidades_list')
        context['entity'] = 'Localidades'
        return context


# AJAX
def load_provincias(request):

    pais_id = request.GET.get('pais_id')
    provincias = Provincias.objects.filter(pais_id=pais_id).all()
    return render(request, 'localidades/provincias_dropdown_list_options.html', {'provincias': provincias})
    # return JsonResponse(list(cities.values('id', 'name')), safe=False)

class LocalidadesCreateView(CreateView):
    model = Localidades
    form_class = LocalidadesCreateForm
    template_name = 'localidades/create.html'
    success_url = reverse_lazy('geo:localidades_list')

    @method_decorator(csrf_exempt)
    @method_decorator(login_required)
    def dispatch(self, request, *args, **kwargs):
        return super().dispatch(request, *args, **kwargs)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            action = request.POST['action']
            if action == 'add':
                #Esto MODIFIQUE SEGUN EL Select ANIDADO
                #form = LocalidadesForm(request.POST)
                #if form.is_valid():
                #    form.save()
                    #return redirect('person_add')
                #Esto es la version normal
                form = self.get_form()
                data = form.save()
                return redirect('geo:localidades_list')
            else:
                data['error'] = 'No ha ingresado ninguna opción'
        except Exception as e:
            data['error'] = str(e)
        return JsonResponse(data)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['title'] = 'Crear una Localidad'
        context['entity'] = 'Localidades'
        context['list_url'] = reverse_lazy('geo:localidades_list')
        context['action'] = 'add'
        return context


class LocalidadesUpdateView(UpdateView):
    model = Localidades
    form_class = LocalidadesForm
    template_name = 'localidades/update.html'
    success_url = reverse_lazy('geo:localidades_list')

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
        context['title'] = 'Editar Localidad'
        context['entity'] = 'Localidades'
        context['list_url'] = reverse_lazy('geo:localidades_list')
        context['action'] = 'edit'
        return context


class LocalidadesDeleteView(DeleteView):
    model = Localidades
    template_name = 'localidades/delete.html'
    success_url = reverse_lazy('geo:localidades_list')

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
        context['title'] = 'Eliminar Localidad'
        context['entity'] = 'Localidades'
        context['list_url'] = reverse_lazy('geo:localidades_list')
        return context
