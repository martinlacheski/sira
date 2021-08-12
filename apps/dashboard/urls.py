from django.urls import path
from apps.dashboard.views import *

app_name = 'dashboard'

urlpatterns = [
    # home
    path('', DashboardView.as_view(), name='home'),
]
