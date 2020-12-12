# Generated by Django 3.1.1 on 2020-12-12 20:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('plataformas', '0012_auto_20201207_1653'),
        ('solicitudes', '0014_auto_20201212_0844'),
    ]

    operations = [
        migrations.RenameField(
            model_name='solicitudes',
            old_name='nombre',
            new_name='fecha_solicitud',
        ),
        migrations.AddField(
            model_name='solicitudes',
            name='cuenta_asociada',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='plataformas.salasvirtuales', verbose_name='Cuenta Asociada'),
        ),
        migrations.AddField(
            model_name='solicitudes',
            name='link_reunion',
            field=models.TextField(blank=True, null=True, verbose_name='Link'),
        ),
        migrations.AddField(
            model_name='solicitudes',
            name='nombre_reunion',
            field=models.TextField(blank=True, null=True, verbose_name='Reunión'),
        ),
        migrations.AddField(
            model_name='solicitudes',
            name='password_reunion',
            field=models.TextField(blank=True, null=True, verbose_name='Contraseña'),
        ),
        migrations.AlterField(
            model_name='solicitudes',
            name='fin_hs',
            field=models.TimeField(verbose_name='Horario de Fin'),
        ),
        migrations.AlterModelTable(
            name='solicitudes',
            table='solicitudes_salas_virtuales',
        ),
        migrations.DeleteModel(
            name='reservasVirtuales',
        ),
    ]
