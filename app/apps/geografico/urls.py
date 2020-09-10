from django.urls import path
from apps.geografico.views.paises.views import *

app_name = 'geografico'

urlpatterns = [
    path('paises/list/', PaisesListView.as_view(), name='paises_list'),
    path('paises/add/', PaisesCreateView.as_view(), name='paises_create'),
    path('paises/update/<int:pk>/', PaisesUpdateView.as_view(), name='paises_update'),
    path('paises/delete/<int:pk>/', PaisesDeleteView.as_view(), name='paises_delete'),
]
