# Generated by Django 3.1.1 on 2020-12-12 11:44

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('solicitudes', '0013_auto_20201211_2017'),
    ]

    operations = [
        migrations.AlterField(
            model_name='solicitudes',
            name='nombre',
            field=models.DateTimeField(default=datetime.datetime.now, verbose_name='Fecha de Solicitud'),
        ),
    ]
