"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    #se utiliza esta URL porque se requiere una vista accesible desde la web para que WEBEX autorice la integracion
    #path('api', include('apps.api.urls')),
    path('carreras/', include('apps.carreras.urls')),
    path('institucional/', include('apps.institucional.urls')),
    path('geografico/', include('apps.geografico.urls')),
    path('solicitudes/', include('apps.solicitudes.urls')),
    path('calendarios/', include('apps.calendario_academico.urls')),
    path('plataformas/', include('apps.plataformas.urls')),
    path('', include('apps.login.urls')),
    path('', include('apps.dashboard.urls')),
    # path('', include('apps.usuarios.urls')),
]
