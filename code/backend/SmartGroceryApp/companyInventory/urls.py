from django.urls import path
from . import views

urlpatterns = [
    path('inventory', views.company_inventory)
]