# Generated by Django 3.1.1 on 2020-12-12 20:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('plataformas', '0012_auto_20201207_1653'),
        ('solicitudes', '0015_auto_20201212_1736'),
    ]

    operations = [
        migrations.AlterField(
            model_name='solicitudes',
            name='cuenta_asociada',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='plataformas.salasvirtuales', verbose_name='Cuenta Asociada'),
        ),
    ]
