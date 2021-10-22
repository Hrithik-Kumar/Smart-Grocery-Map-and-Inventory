from django.urls import path
from . import views

urlpatterns = [
    path('createProduct', views.company_create_item)
]
