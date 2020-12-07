# Generated by Django 3.1.1 on 2020-12-07 19:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('plataformas', '0008_auto_20201207_1643'),
    ]

    operations = [
        migrations.AddField(
            model_name='salasvirtuales',
            name='access_token',
            field=models.CharField(default=1, max_length=200, verbose_name='Token de Acceso'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='salasvirtuales',
            name='refresh_token',
            field=models.CharField(default=1, max_length=200, verbose_name='Token de Refresco'),
            preserve_default=False,
        ),
    ]
