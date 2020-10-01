from django.urls import path

from apps.solicitudes.views.motivos.views import *
from apps.solicitudes.views.tipos.views import *

app_name = 'solicitudes'

urlpatterns = [
    #Tipos de Reservas
    path('tipos/list/', TipoSolicitudListView.as_view(), name='tipos_list'),
    path('tipos/add/', TipoSolicitudCreateView.as_view(), name='tipos_create'),
    path('tipos/update/<int:pk>/', TipoSolicitudUpdateView.as_view(), name='tipos_update'),
    path('tipos/delete/<int:pk>/', TipoSolicitudDeleteView.as_view(), name='tipos_delete'),

    #Motivos de Reservas
    path('motivos/list/', MotivoSolicitudListView.as_view(), name='motivos_list'),
    path('motivos/add/', MotivoSolicitudCreateView.as_view(), name='motivos_create'),
    path('motivos/update/<int:pk>/', MotivoSolicitudUpdateView.as_view(), name='motivos_update'),
    path('motivos/delete/<int:pk>/', MotivoSolicitudDeleteView.as_view(), name='motivos_delete'),
]
