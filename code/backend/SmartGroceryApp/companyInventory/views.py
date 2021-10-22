from django.shortcuts import render
from django.http import JsonResponse
from .models import companyInventory
from django.views.decorators import csrf
from django.views.decorators.csrf import csrf_exempt

from django.core.files.storage import FileSystemStorage

# Create your views here.
@csrf_exempt
def company_inventory_query(request):

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
    descriptions = []
    img = []

    for comp in company_dict:
        pid.append(comp.get("id", ""))
        p.append(comp.get("product_name", ""))
        p_type.append(comp.get("product_type", ""))
        descriptions.append(comp.get("description", ""))
        prices.append(comp.get("price", ""))
        img.append(comp.get("image_source", ""))
    

    return JsonResponse({
            'status': 'success',
            'product_ids': pid,
            'products': p,
            "product_types": p_type,
            "descriptions": descriptions,
            "prices": prices,
            "img_sources": img
        }, 
        status=201)

@csrf_exempt
def company_inventory_create_item(request):
    if request.method != 'POST':
        return JsonResponse({'status': 'did not recieve a POST request'}, status=403)

    company_username = request.POST.get('company_username')
    product_name = request.POST.get('product_name')
    product_type = request.POST.get('product_type')
    description = request.POST.get('description')
    price = request.POST.get('price')

    if company_username is None:
        return JsonResponse({'status': 'no company name was given'}, status=400)

    if product_name is None:
        return JsonResponse({'status': 'no product name was given'}, status=400)

    if product_type is None:
        return JsonResponse({'status': 'no product type was given'}, status=400)

    if description is None:
        return JsonResponse({'status': 'no description was given'}, status=400)

    if price is None:
        return JsonResponse({'status': 'no price was given'}, status=400)

    if 'image_source' in request.FILES:
        image = request.FILES['image_source']
        image_file = 'company_items/' + image.name
        fs = FileSystemStorage()
        image_file = fs.save(image_file, image)

        new_item = companyInventory(company_username=company_username, product_name=product_name,
                                    product_type=product_type, description=description, price=price, image_source=image_file)
    else:
        new_item = companyInventory(company_username=company_username, product_name=product_name,
                                    product_type=product_type, description=description, price=price, image_source="NO_IMG")
    
    new_item.save()

    return JsonResponse({'status': 'success'}, status=201)

@csrf_exempt
def company_inventory_delete_item(request):
    if request.method != 'POST':
        return JsonResponse({'status': 'did not recieve a POST request'}, status=403)
    
    try:
        product_id = request.POST.get('id')
    except:
        return JsonResponse({'status': 'unable to fetch the item id'}, status=500)
        
    item = companyInventory.objects.filter(id=product_id)
    
    if item:
        if companyInventory.objects.filter(id=product_id).delete():    
            return JsonResponse({'status': 'success'}, status=201)
        else: 
            return JsonResponse({'status': 'unable to remove the item'}, status=400)
    else:
        return JsonResponse({'status': 'item does not exist in the database'}, status=401)