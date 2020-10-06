from django.urls import path

from apps.usuarios.views.docentes.views import *
from apps.usuarios.views.usuarios.views import *

app_name = 'usuarios'

urlpatterns = [
    #Usuarios
    path('usuarios/list/', UsuariosListView.as_view(), name='usuarios_list'),
    path('usuarios/add/', UsuariosCreateView.as_view(), name='usuarios_create'),
    path('usuarios/update/<int:pk>/', UsuariosUpdateView.as_view(), name='usuarios_update'),
    path('usuarios/delete/<int:pk>/', UsuariosDeleteView.as_view(), name='usuarios_delete'),

    # Docentes
    path('docentes/list/', DocentesListView.as_view(), name='docentes_list'),
    path('docentes/add/', DocentesCreateView.as_view(), name='docentes_create'),
    path('docentes/update/<int:pk>/', DocentesUpdateView.as_view(), name='docentes_update'),
    path('docentes/delete/<int:pk>/', DocentesDeleteView.as_view(), name='docentes_delete'),
]
