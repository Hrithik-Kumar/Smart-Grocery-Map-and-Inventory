from django.shortcuts import render
from django.http import JsonResponse
import json
from companyInventory.models import companyInventory
from userCart.models import userCart
from django.views.decorators.csrf import csrf_exempt

# Create your views here.


@csrf_exempt
def customer_get_item_locations(request):
    if request.method != 'GET':
        return JsonResponse({'status': 'did not receive a GET request'}, status=403)

    body = json.loads(request.body)

    if not 'customer_username' in body:
        return JsonResponse({'status': 'no customer username was given'}, status=400)

    customer_username = body['customer_username']

    customer_items = list(userCart.objects.filter(
        username=customer_username).values('company_username', 'product_name'))

    item_data_list = []

    for customer_item_dict in customer_items:
        item_data = companyInventory.objects.filter(
            company_username=customer_item_dict["company_username"],
            product_name=customer_item_dict["product_name"]).values('product_name', 'aisle', 'shelf').get()

        item_data_list.append(item_data)

    return JsonResponse({'status': 'success', 'customer_items': item_data_list}, status=200)
