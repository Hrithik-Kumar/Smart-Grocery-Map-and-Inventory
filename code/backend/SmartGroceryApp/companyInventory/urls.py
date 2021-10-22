from django.urls import path
from . import views

urlpatterns = [
    path('inventory/query', views.company_inventory_query), 
    path('inventory/create', views.company_inventory_create_item),
    path('inventory/update', views.company_inventory_update_item),
]