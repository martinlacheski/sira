# Generated by Django 3.1.1 on 2020-10-26 20:11

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('institucional', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Plataformas',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=30, unique=True, verbose_name='Nombre')),
            ],
            options={
                'verbose_name': 'Nombre',
                'verbose_name_plural': 'Nombres',
                'db_table': 'plataformas',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='SalasVirtuales',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.TextField(unique=True, verbose_name='Nombre Sala Virtual')),
                ('email', models.TextField(unique=True, verbose_name='Correo Electrónico Sala Virtual')),
                ('password', models.TextField(verbose_name='Contraseña')),
                ('estado', models.CharField(default='A', max_length=1, verbose_name='Estado')),
                ('plataforma', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='plataformas.plataformas', verbose_name='Plataforma')),
                ('sede', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='institucional.sedes', verbose_name='Sede')),
            ],
            options={
                'verbose_name': 'Sala Virtual',
                'verbose_name_plural': 'Salas Virtuales',
                'db_table': 'plataformas_salas_virtuales',
                'ordering': ['id'],
            },
        ),
    ]
