from django.urls import path

from apps.institucional.views.universidad.views import *
from apps.institucional.views.facultad.views import *
from apps.institucional.views.sedes.views import *
app_name = 'institucional'

urlpatterns = [
    #Universidad
    path('universidad/list/', UniversidadListView.as_view(), name='universidad_list'),
    path('universidad/add/', UniversidadCreateView.as_view(), name='universidad_create'),
    path('universidad/update/<int:pk>/', UniversidadUpdateView.as_view(), name='universidad_update'),
    path('universidad/delete/<int:pk>/', UniversidadDeleteView.as_view(), name='universidad_delete'),
    #Facultad
    path('facultad/list/', FacultadListView.as_view(), name='facultad_list'),
    path('facultad/add/', FacultadCreateView.as_view(), name='facultad_create'),
    path('facultad/update/<int:pk>/', FacultadUpdateView.as_view(), name='facultad_update'),
    path('facultad/delete/<int:pk>/', FacultadDeleteView.as_view(), name='facultad_delete'),
    #Sedes
    path('sedes/list/', SedesListView.as_view(), name='sedes_list'),
    path('sedes/add/', SedesCreateView.as_view(), name='sedes_create'),
    path('sedes/update/<int:pk>/', SedesUpdateView.as_view(), name='sedes_update'),
    path('sedes/delete/<int:pk>/', SedesDeleteView.as_view(), name='sedes_delete'),

]
