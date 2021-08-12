from django.urls import path

from apps.calendario_academico.views.calendarios.views import *
from apps.calendario_academico.views.turnos.views import *

app_name = 'calendario_academico'

urlpatterns = [
    #Calendario Academico
    path('list/', CalendarioListView.as_view(), name='calendario_list'),
    path('add/', CalendarioCreateView.as_view(), name='calendario_create'),
    path('update/<int:pk>/', CalendarioUpdateView.as_view(), name='calendario_update'),
    path('delete/<int:pk>/', CalendarioDeleteView.as_view(), name='calendario_delete'),

#Calendario Academico
    path('turnos/list/', TurnosListView.as_view(), name='turnos_list'),
    path('turnos/add/', TurnosCreateView.as_view(), name='turnos_create'),
    path('turnos/update/<int:pk>/', TurnosUpdateView.as_view(), name='turnos_update'),
    path('turnos/delete/<int:pk>/', TurnosDeleteView.as_view(), name='turnos_delete'),


]