# Generated by Django 3.2.8 on 2021-10-22 09:51

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('companyInventory', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='companyinventory',
            name='pid',
        ),
    ]