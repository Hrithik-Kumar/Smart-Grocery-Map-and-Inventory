from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator

# Create your models here.
class companyInventory(models.Model):
    company_username = models.CharField(max_length=20)
    product_name = models.CharField(max_length=30)
    product_type = models.CharField(max_length=50)
    description = models.CharField(max_length=100)
    price = models.DecimalField(max_digits = 8, decimal_places = 2)
    image_source = models.CharField(max_length=50)

    class Meta:
        db_table = 'company_inventory'
