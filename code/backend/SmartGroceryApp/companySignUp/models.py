from django.db import models

# Create your models here.
class company(models.Model):
    username = models.CharField(max_length=20)
    password = models.CharField(max_length=80)
    email = models.CharField(max_length=80)
    manager_name = models.CharField(max_length=80)
    store_name = models.CharField(max_length=80)
    store_location = models.CharField(max_length=80)
    logo = models.ImageField(default="company_logos/default_logo.png", upload_to="company_logos", blank=True, null=True)
    map_of_store = models.ImageField(default="company_maps/default_map.png", upload_to="company_maps", blank=True, null=True)

    class Meta:
        db_table = 'company_info'