# Generated by Django 3.1.1 on 2020-12-07 19:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('plataformas', '0011_auto_20201207_1650'),
    ]

    operations = [
        migrations.AlterField(
            model_name='salasvirtuales',
            name='access_token',
            field=models.CharField(blank=True, max_length=200, null=True, verbose_name='Token de Acceso'),
        ),
        migrations.AlterField(
            model_name='salasvirtuales',
            name='refresh_token',
            field=models.CharField(blank=True, max_length=200, null=True, verbose_name='Token de Refresco'),
        ),
    ]
