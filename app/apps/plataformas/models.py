from django.db import models
from django.forms import model_to_dict

#   Clase Plataformas
from apps.institucional.models import Sedes


class Plataformas(models.Model):
    nombre = models.CharField(verbose_name='Nombre', unique=True, max_length=30)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Nombre'
        verbose_name_plural = 'Nombres'
        db_table = 'plataformas'
        ordering = ['id']


#   Clase Salas Virtuales
class SalasVirtuales(models.Model):
    plataforma = models.ForeignKey(Plataformas, models.DO_NOTHING, verbose_name='Plataforma')
    sede = models.ForeignKey(Sedes, models.DO_NOTHING, verbose_name='Sede')
    nombre = models.TextField(verbose_name='Nombre Sala Virtual', unique=True)
    email = models.EmailField(verbose_name='Correo Electrónico Sala Virtual', unique=True)
    password = models.TextField(verbose_name='Contraseña')
    estado = models.CharField(verbose_name='Estado', max_length=1, default='A')
    access_token = models.CharField(verbose_name='Token de Acceso', max_length=200, null=True, blank=True)
    refresh_token = models.CharField(verbose_name='Token de Refresco', max_length=200, null=True, blank=True)
    
    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['plataforma'] = self.plataforma.toJSON()
        item['sede'] = self.sede.toJSON()
        return item

    class Meta:
        verbose_name = 'Sala Virtual'
        verbose_name_plural = 'Salas Virtuales'
        db_table = 'cuentas_salas_virtuales'
        ordering = ['id']
