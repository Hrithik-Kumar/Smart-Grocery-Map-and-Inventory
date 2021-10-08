from django.shortcuts import render
from django.http import JsonResponse
from .models import company

from django.core.files.storage import FileSystemStorage

# Create your views here.

def company_sign_up(request):
    if request.method != 'POST':
        return JsonResponse({'status': 'did not recieve a POST request'}, status=403)

    username = request.POST.get('username')
    password =request.POST.get('password')
    email = request.POST.get('email')
    manager_name = request.POST.get('manager_name')
    store_name = request.POST.get('store_name')
    store_location = request.POST.get('store_location')
    logo_file = 'company_logos/default_logo.png'
    map_of_store_file = 'company_maps/default_map.png'

    if username is None:
        return JsonResponse({'status': 'no username was given'}, status=400)

    if password is None:
        return JsonResponse({'status': 'no password was given'}, status=400)

    if email is None:
        return JsonResponse({'status': 'no email was given'}, status=400)

    if manager_name is None:
        return JsonResponse({'status': 'no manager name was given'}, status=400)

    if store_name is None:
        return JsonResponse({'status': 'no store name was given'}, status=400)

    if store_location is None:
        return JsonResponse({'status': 'no store location was given'}, status=400)

    if company.objects.filter(username=username):
        return JsonResponse({'status': 'username already exists'}, status=400)

    if 'logo' in request.FILES:
        logo = request.FILES['logo']
        logo_file = 'company_logos/' + logo.name
        fs = FileSystemStorage()
        logo_file = fs.save(logo_file, logo)

    if 'map_of_store' in request.FILES:
        map_of_store = request.FILES['map_of_store']
        map_of_store_file = 'company_maps/' + map_of_store.name
        fs = FileSystemStorage()
        map_of_store_file = fs.save(map_of_store_file, map_of_store)

    new_company = company(username=username, password=password, email=email, manager_name=manager_name,
                                 store_name=store_name, store_location=store_location, logo=logo_file, map_of_store=map_of_store_file)
    new_company.save()

    return JsonResponse({'status': 'success'}, status=201)
