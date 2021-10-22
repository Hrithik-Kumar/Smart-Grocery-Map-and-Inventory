from django.shortcuts import render
from django.http import JsonResponse
from .models import companyInventory
from django.views.decorators.csrf import csrf_exempt

from django.core.files.storage import FileSystemStorage
# Create your views here.


@csrf_exempt
def company_create_item(request):
    if request.method != 'POST':
        return JsonResponse({'status': 'did not recieve a POST request'}, status=403)

    company_username = request.POST.get('company_username')
    product_name = request.POST.get('product_name')
    product_type = request.POST.get('product_type')
    description = request.POST.get('description')
    price = request.POST.get('price')

    if product_name is None:
        return JsonResponse({'status': 'no product name was given'}, status=400)

    if product_type is None:
        return JsonResponse({'status': 'no product type was given'}, status=400)

    if description is None:
        return JsonResponse({'status': 'no description was given'}, status=400)

    if price is None:
        return JsonResponse({'status': 'no price was given'}, status=400)

    if not ('image_source' in request.FILES):
        return JsonResponse({'status': 'no image was given'}, status=400)

    image = request.FILES['image_source']
    image_file = 'company_items/' + image.name
    fs = FileSystemStorage()
    image_file = fs.save(image_file, image)

    new_item = companyInventory(company_username=company_username, product_name=product_name,
                                product_type=product_type, description=description, price=price, image_source=image_file)
    new_item.save()

    return JsonResponse({'status': 'success'}, status=201)
