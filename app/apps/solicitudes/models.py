from datetime import datetime

from django.db import models
from django.forms import model_to_dict

from apps.carreras.models import Carreras, Materias, TiposComisiones
from apps.institucional.models import Sedes
from apps.plataformas.models import *

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

#   Clase Solicitudes de Reservas
class Solicitudes(models.Model):
    nombre = models.DateField(default=datetime.now, verbose_name='Fecha de Solicitud')
    dni = models.PositiveIntegerField(verbose_name='DNI')
    nombres = models.TextField(verbose_name='Nombres')
    apellido = models.TextField(verbose_name='Apellido')
    email = models.EmailField(verbose_name='Correo Electrónico')
    sede = models.ForeignKey(Sedes, models.DO_NOTHING, verbose_name='Sede')
    tipo = models.ForeignKey(TipoSolicitud, models.DO_NOTHING, verbose_name='Tipo de Reserva')
    motivo = models.ForeignKey(Motivos, models.DO_NOTHING, verbose_name='Motivo')
    observaciones = models.TextField(verbose_name='Observaciones', null=True, blank=True)
    carrera = models.ForeignKey(Carreras, models.DO_NOTHING, verbose_name='Carrera')
    materia = models.ForeignKey(Materias, models.DO_NOTHING, verbose_name='Materia')
    comision = models.ForeignKey(TiposComisiones, models.DO_NOTHING, verbose_name='Tipo de Comisión')
    fecha_reserva = models.DateField(verbose_name='Fecha de Reserva')
    inicio_hs = models.TimeField(default=datetime.now, verbose_name='Horario de Inicio')
    fin_hs = models.TimeField(default=datetime.now, verbose_name='Horario de Fin')
    repeticion = models.BooleanField(default=False)
    fin_repeticion = models.DateField(verbose_name='Fin de la Repetición', null=True, blank=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['tipo'] = self.tipo.toJSON()
        item['motivo'] = self.motivo.toJSON()
        item['sede'] = self.sede.toJSON()
        item['carrera'] = self.carrera.toJSON()
        item['materia'] = self.materia.toJSON()
        item['comision'] = self.comision.toJSON()
        return item

    class Meta:
        verbose_name = 'Solicitud'
        verbose_name_plural = 'Solicitudes'
        db_table = 'solicitudes'
        ordering = ['id']


class reservasVirtuales(models.Model):
    id_solicitud = models.ForeignKey(Solicitudes, models.DO_NOTHING, verbose_name='id solicitud de reserva')
    id_cuenta_virtual = models.ForeignKey(SalasVirtuales, models.DO_NOTHING, verbose_name='id solicitud cuenta virtual')
    confirmacion_reserva = models.BooleanField(default=False)

    def __str__(self):
        return self.nombre

    class Meta:
        verbose_name = 'reserva virtual'
        verbose_name_plural = 'ResevervasVirtuales'
        db_table = 'reservas_virtuales'
        ordering = ['id']



