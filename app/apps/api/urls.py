from django.urls import path

from . import views

urlpatterns = [
    # ex: /polls/5/vote/
    path('', views.hola, name='hola_API'),
]
