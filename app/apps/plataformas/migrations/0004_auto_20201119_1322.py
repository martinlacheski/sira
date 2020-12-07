# Generated by Django 3.1.1 on 2020-11-19 16:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('plataformas', '0003_auto_20201119_1314'),
    ]

    operations = [
        migrations.AddField(
            model_name='salasvirtuales',
            name='access_token',
            field=models.CharField(default='not_avaliable', max_length=200, unique=True, verbose_name='Token de Acceso'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='salasvirtuales',
            name='refresh_token',
            field=models.CharField(default='not_avaliable', max_length=200, unique=True, verbose_name='Token de Refresco'),
            preserve_default=False,
        ),
    ]
