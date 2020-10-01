from datetime import datetime

from django.db import models

from django.forms import model_to_dict

#   Clase tipo_solicitud
class TipoSolicitud(models.Model):
    nombre = models.TextField(verbose_name='Nombre', unique=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Tipo'
        verbose_name_plural = 'Tipos'
        db_table = 'solicitudes_tipos'
        ordering = ['id']

#   Clase Motivos Solicitud
class Motivos(models.Model):
    nombre = models.TextField(verbose_name='Nombre', unique=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Motivo'
        verbose_name_plural = 'Motivos'
        db_table = 'solicitudes_motivos'
        ordering = ['id']


