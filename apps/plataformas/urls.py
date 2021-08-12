from django.urls import path

from apps.plataformas.views.plataformas.views import *
from apps.plataformas.views.salasvirtuales.views import *

app_name = 'plataformas'

urlpatterns = [
    #Plataformas
    path('list/', PlataformasListView.as_view(), name='plataformas_list'),
    path('add/', PlataformasCreateView.as_view(), name='plataformas_create'),
    path('update/<int:pk>/', PlataformasUpdateView.as_view(), name='plataformas_update'),
    path('delete/<int:pk>/', PlataformasDeleteView.as_view(), name='plataformas_delete'),

    #SalasVirtuales
    path('salas/list/', SalasVirtualesListView.as_view(), name='salas_virtuales_list'),
    path('salas/add/', SalasVirtualesCreateView.as_view(), name='salas_virtuales_create'),
    path('salas/update/<int:pk>/', SalasVirtualesUpdateView.as_view(), name='salas_virtuales_update'),
    path('salas/delete/<int:pk>/', SalasVirtualesDeleteView.as_view(), name='salas_virtuales_delete'),

]
