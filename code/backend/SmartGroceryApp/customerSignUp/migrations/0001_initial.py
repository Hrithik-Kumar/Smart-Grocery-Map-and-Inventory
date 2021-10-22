# Generated by Django 3.2.8 on 2021-10-16 04:45

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='customer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=20)),
                ('password', models.CharField(max_length=80)),
                ('email', models.CharField(max_length=80)),
                ('firstname', models.CharField(max_length=80)),
                ('lastname', models.CharField(max_length=80)),
            ],
            options={
                'db_table': 'customer_info',
            },
        ),
    ]
