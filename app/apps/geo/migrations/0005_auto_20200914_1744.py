# Generated by Django 3.1.1 on 2020-09-14 20:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('geo', '0004_localidades_pais'),
    ]

    operations = [
        migrations.AlterField(
            model_name='localidades',
            name='codigo_postal',
            field=models.TextField(),
        ),
    ]
