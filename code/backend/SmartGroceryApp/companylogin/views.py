from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators import csrf
from .models import company
from django.views.decorators.csrf import csrf_exempt
from django.core.files.storage import FileSystemStorage
from django.contrib.auth import authenticate

# Create your views here.
@csrf_exempt
def company_log_in(request):
    if request.method != 'POST':
        return JsonResponse({'status': 'did not recieve a POST request'}, status=403)
    username = request.POST.get('username')
    password = request.POST.get('password')
    
    loginsuccess = authenticate(request,username=username,password=password)
    
    if loginsuccess is not None:     
        return JsonResponse({'status': 'success'}, status=201)
    else: 
        return JsonResponse({'status': 'username/password incorrect'}, status=400)