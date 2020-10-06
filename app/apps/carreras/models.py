from django.db import models

from django.forms import model_to_dict
from apps.institucional.models import Facultad

#   Clase Tipos de Carreras
class TiposCarreras(models.Model):
    nombre = models.TextField(verbose_name='Nombre', unique=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Tipo'
        verbose_name_plural = 'Tipos'
        db_table = 'carreras_tipos'
        ordering = ['id']

#   Clase Carreras
class Carreras(models.Model):
    #facultad = models.ForeignKey(Facultad, models.DO_NOTHING, verbose_name='Facultad')
    nombre_corto = models.CharField(max_length=30, verbose_name='Nombre Corto', unique=True)
    nombre = models.TextField(verbose_name='Nombre')
    plan = models.CharField(max_length=20, verbose_name='Plan de Estudios', null=True, blank=True)
    tipo = models.ForeignKey(TiposCarreras, models.DO_NOTHING, verbose_name='Tipo')
    duracion = models.IntegerField(verbose_name='Duración')

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        #item['facultad'] = self.facultad.toJSON()
        item['tipo'] = self.tipo.toJSON()
        return item

    class Meta:
        verbose_name = 'Carrera'
        verbose_name_plural = 'Carreras'
        db_table = 'carreras'
        ordering = ['id']

#   Clase Año de Cursado
class AnioCursado(models.Model):
    nombre = models.IntegerField(verbose_name='Año', unique=True)

    def __str__(self):
        return str(self.nombre)

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Año'
        verbose_name_plural = 'Años'
        db_table = 'carreras_anios_cursado'
        ordering = ['id']

#   Clase Periodo de Cursado
class PeriodoCursado(models.Model):
    nombre = models.TextField(verbose_name='Periodo', unique=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Periodo'
        verbose_name_plural = 'Periodos'
        db_table = 'carreras_periodos_cursado'
        ordering = ['id']

#   Clase Materias de la Carrera
class Materias(models.Model):
    carrera = models.ForeignKey(Carreras, models.DO_NOTHING, verbose_name='Carrera')
    nombre = models.TextField(verbose_name='Nombre')
    nombre_corto = models.CharField(max_length=30, verbose_name='Nombre Corto')
    anio = models.ForeignKey(AnioCursado, models.DO_NOTHING, verbose_name='Año')
    periodo = models.ForeignKey(PeriodoCursado, models.DO_NOTHING, verbose_name='Periodo')

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['carrera'] = self.carrera.toJSON()
        item['anio'] = self.anio.toJSON()
        item['periodo'] = self.periodo.toJSON()
        return item

    class Meta:
        verbose_name = 'Materia'
        verbose_name_plural = 'Materias'
        db_table = 'materias'
        ordering = ['id']

#   Clase Tipos de Comisiones
class TiposComisiones(models.Model):
    nombre = models.TextField(verbose_name='Nombre', unique=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Tipo'
        verbose_name_plural = 'Tipos'
        db_table = 'materias_tipos_comisiones'
        ordering = ['id']