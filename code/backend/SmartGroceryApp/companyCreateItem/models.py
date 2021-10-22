from django.db import models

# Create your models here.


class companyInventory(models.Model):
    company_username = models.CharField(max_length=20)
    product_name = models.CharField(max_length=100)
    product_type = models.CharField(max_length=50)
    description = models.CharField(max_length=100)
    price = models.DecimalField(max_digits=11, decimal_places=2)
    image_source = models.ImageField(upload_to="company_items", max_length=50)

    class Meta:
        db_table = 'company_inventory'
