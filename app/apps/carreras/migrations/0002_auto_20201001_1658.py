# Generated by Django 3.1.1 on 2020-10-01 19:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('carreras', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Materias',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('materia', models.CharField(max_length=5, unique=True, verbose_name='Materia')),
                ('nombre_corto', models.CharField(max_length=30, unique=True, verbose_name='Nombre Corto')),
                ('nombre', models.TextField(verbose_name='Nombre')),
            ],
            options={
                'verbose_name': 'Materia',
                'verbose_name_plural': 'Materias',
                'db_table': 'materias',
                'ordering': ['id'],
            },
        ),
        migrations.AlterField(
            model_name='carreras',
            name='duracion',
            field=models.IntegerField(verbose_name='Duración'),
        ),
        migrations.AlterModelTable(
            name='carreras',
            table='carreras',
        ),
    ]