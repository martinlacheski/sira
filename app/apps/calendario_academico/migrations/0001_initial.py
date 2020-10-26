# Generated by Django 3.1.1 on 2020-10-26 19:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CalendarioAcademico',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=4, unique=True, verbose_name='Año Académico')),
                ('fecha_desde', models.DateField(verbose_name='Fecha de Inicio')),
                ('fecha_hasta', models.DateField(verbose_name='Fecha de Fin')),
                ('primer_cuat_inicio', models.DateField(verbose_name='Inicio Primer Cuatrimestre')),
                ('primer_cuat_fin', models.DateField(verbose_name='Finalización Primer Cuatrimestre')),
                ('segundo_cuat_inicio', models.DateField(verbose_name='Inicio Segundo Cuatrimestre')),
                ('segundo_cuat_fin', models.DateField(verbose_name='Finalización Segundo Cuatrimestre')),
            ],
            options={
                'verbose_name': 'Calendario Académico',
                'verbose_name_plural': 'Calendarios Académicos',
                'db_table': 'calendario_academico',
                'ordering': ['id'],
            },
        ),
        migrations.CreateModel(
            name='TurnosExamen',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=20, verbose_name='Turno de Examen')),
                ('inicio', models.DateField(verbose_name='Fecha de Inicio')),
                ('fin', models.DateField(verbose_name='Fecha de Fin')),
                ('anio', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='calendario_academico.calendarioacademico', verbose_name='Año')),
            ],
            options={
                'verbose_name': 'Turno de Examen',
                'verbose_name_plural': 'turnos de Examenes',
                'db_table': 'calendario_turnos_examen',
                'ordering': ['id'],
            },
        ),
    ]