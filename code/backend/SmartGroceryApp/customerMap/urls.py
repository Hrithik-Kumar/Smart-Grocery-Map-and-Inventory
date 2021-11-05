from django.urls import path
from . import views

urlpatterns = [
    path('getItemLocations', views.customer_get_item_locations),
]
