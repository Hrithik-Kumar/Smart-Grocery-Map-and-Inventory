from django.shortcuts import render
from django.http import JsonResponse
from .models import companyInventory
from django.views.decorators import csrf
from django.views.decorators.csrf import csrf_exempt

from django.core.files.storage import FileSystemStorage

# Create your views here.
@csrf_exempt
def company_inventory(request):

    if request.method != 'POST':
        return JsonResponse({'status': 'did not recieve a POST request'}, status=403)

    company_username = request.POST.get('company_username')


    if company_username is None:
        return JsonResponse({'status': 'no company was given'}, status=400)

    # if company.objects.filter(username=username):
    #     return JsonResponse({'status': 'username already exists'}, status=400)

    q = companyInventory.objects.filter(company_username = company_username)


    company_dict = list(q.values())  # A list of dictionaries, each index is an entry
    # print(company_dict)

    if len(company_dict) == 0:
        return JsonResponse({'status': 'No items in company'}, status=404)

    pid = []
    p = []
    p_type = []
    prices = []
    img = []

    for comp in company_dict:
        pid.append(comp.get("pid", ""))
        p.append(comp.get("product_name", ""))
        p_type.append(comp.get("product_type", ""))
        prices.append(comp.get("price", ""))
        img.append(comp.get("image_source", ""))
    

    return JsonResponse({
            'status': 'success',
            'product_ids': pid,
            'products': p,
            "product_types": p_type,
            "prices": prices,
            "img_sources": img
        }, 
        status=201)

