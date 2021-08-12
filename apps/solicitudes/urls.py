from django.urls import path

from apps.solicitudes.views.motivos.views import *
from apps.solicitudes.views.solicitudes.views import *

app_name = 'solicitudes'

urlpatterns = [
    #Tipos de Reservas
    #path('tipo_solicitud/list/', TipoSolicitudListView.as_view(), name='tipo_solicitud_list'),
    #path('tipo_solicitud/add/', TipoSolicitudCreateView.as_view(), name='tipo_solicitud_create'),
    #path('tipo_solicitud/update/<int:pk>/', TipoSolicitudUpdateView.as_view(), name='tipo_solicitud_update'),
    #path('tipo_solicitud/delete/<int:pk>/', TipoSolicitudDeleteView.as_view(), name='tipo_solicitud_delete'),

    #Motivos de Reservas
    path('motivos/list/', MotivoSolicitudListView.as_view(), name='motivos_list'),
    path('motivos/add/', MotivoSolicitudCreateView.as_view(), name='motivos_create'),
    path('motivos/update/<int:pk>/', MotivoSolicitudUpdateView.as_view(), name='motivos_update'),
    path('motivos/delete/<int:pk>/', MotivoSolicitudDeleteView.as_view(), name='motivos_delete'),

    #Solicitudes de Reservas
    path('list/', SolicitudesListView.as_view(), name='solicitudes_list'),
    path('pendientes/', SolicitudesPendientesListView.as_view(), name='solicitudes_pendientes_list'),
    path('add/', SolicitudesCreateView.as_view(), name='solicitudes_create'),
    path('update/<int:pk>/', SolicitudesUpdateView.as_view(), name='solicitudes_update'),
    path('delete/<int:pk>/', SolicitudesDeleteView.as_view(), name='solicitudes_delete'),
    path('generate/', SolicitudesGenerateView.as_view(), name='solicitudes_generate'),
    path('confirm/<int:pk>/', SolicitudesConfirmView.as_view(), name='solicitudes_confirm'),
    path('cancel/<int:pk>/', SolicitudesCancelView.as_view(), name='solicitudes_cancel'),

]
