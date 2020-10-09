# Generated by Django 3.1.1 on 2020-10-08 20:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('carreras', '0003_tiposcomisiones'),
        ('solicitudes', '0006_auto_20201008_1731'),
    ]

    operations = [
        migrations.AlterField(
            model_name='solicitudes',
            name='comision',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='carreras.tiposcomisiones', verbose_name='Tipo de Comisión'),
        ),
        migrations.AlterField(
            model_name='solicitudes',
            name='fin_repeticion',
            field=models.DateField(blank=True, null=True, verbose_name='Fin de la Repetición'),
        ),
    ]
