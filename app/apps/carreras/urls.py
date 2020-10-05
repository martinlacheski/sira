from django.urls import path

from apps.carreras.views.anios.views import *
from apps.carreras.views.periodos.views import *
from apps.carreras.views.materias.views import *
from apps.carreras.views.tipos.views import *
from apps.carreras.views.carreras.views import *

app_name = 'carreras'

urlpatterns = [
    #Tipos de Carreras
    path('tipo_carrera/list/', TiposListView.as_view(), name='tipo_carrera_list'),
    path('tipo_carrera/add/', TiposCreateView.as_view(), name='tipo_carrera_create'),
    path('tipo_carrera/update/<int:pk>/', TiposUpdateView.as_view(), name='tipo_carrera_update'),
    path('tipo_carrera/delete/<int:pk>/', TiposDeleteView.as_view(), name='tipo_carrera_delete'),
    #Carreras
    path('list/', CarrerasListView.as_view(), name='carreras_list'),
    path('add/', CarrerasCreateView.as_view(), name='carreras_create'),
    path('update/<int:pk>/', CarrerasUpdateView.as_view(), name='carreras_update'),
    path('delete/<int:pk>/', CarrerasDeleteView.as_view(), name='carreras_delete'),
    #Años de Cursado
    path('cursado/list/', AniosListView.as_view(), name='anios_list'),
    path('cursado/add/', AniosCreateView.as_view(), name='anios_create'),
    path('cursado/update/<int:pk>/', AniosUpdateView.as_view(), name='anios_update'),
    path('cursado/delete/<int:pk>/', AniosDeleteView.as_view(), name='anios_delete'),
    #Periodos de Cursado
    path('periodos/list/', PeriodoListView.as_view(), name='periodos_list'),
    path('periodos/add/', PeriodoCreateView.as_view(), name='periodos_create'),
    path('periodos/update/<int:pk>/', PeriodoUpdateView.as_view(), name='periodos_update'),
    path('periodos/delete/<int:pk>/', PeriodoDeleteView.as_view(), name='periodos_delete'),
    #Materias
    path('materias/list/', MateriasListView.as_view(), name='materias_list'),
    path('materias/add/', MateriasCreateView.as_view(), name='materias_create'),
    path('materias/update/<int:pk>/', MateriasUpdateView.as_view(), name='materias_update'),
    path('materias/delete/<int:pk>/', MateriasDeleteView.as_view(), name='materias_delete'),
]