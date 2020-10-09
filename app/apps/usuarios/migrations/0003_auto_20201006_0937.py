# Generated by Django 3.1.1 on 2020-10-06 12:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('usuarios', '0002_docentes'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='docentes',
            name='legajo',
        ),
        migrations.AlterField(
            model_name='docentes',
            name='email',
            field=models.EmailField(max_length=254, verbose_name='Correo Electrónico'),
        ),
    ]