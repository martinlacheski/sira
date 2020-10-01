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
    facultad = models.ForeignKey(Facultad, models.DO_NOTHING, verbose_name='Facultad')
    carrera = models.CharField(max_length=5, verbose_name='Carrera', unique=True)
    nombre_corto = models.CharField(max_length=30, verbose_name='Nombre Corto', unique=True)
    nombre = models.TextField(verbose_name='Nombre')
    tipo = models.ForeignKey(TiposCarreras, models.DO_NOTHING, verbose_name='Tipo')
    duracion = models.IntegerField(verbose_name='Duración')

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['facultad'] = self.facultad.toJSON()
        item['tipo'] = self.tipo.toJSON()
        return item

    class Meta:
        verbose_name = 'Carrera'
        verbose_name_plural = 'Carreras'
        db_table = 'carreras'
        ordering = ['id']

#   Clase Planes de Estudios
class PlanesEstudios(models.Model):
    carrera = models.ForeignKey(Carreras, models.DO_NOTHING, verbose_name='Carrera')
    nombre = models.CharField(max_length=5, verbose_name='Nombre')

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['carrera'] = self.carrera.toJSON()
        return item

    class Meta:
        verbose_name = 'Plan de Estudio'
        verbose_name_plural = 'Planes de Estudios'
        db_table = 'carreras_planes'
        ordering = ['id']


#   Clase Año de Cursado
class AnioCursado(models.Model):
    nombre = models.IntegerField(verbose_name='Año', unique=True)

    def __str__(self):
        return self.nombre

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

#   Clase Materias
class Materias(models.Model):
    materia = models.CharField(max_length=5, verbose_name='Materia', unique=True)
    nombre_corto = models.CharField(max_length=30, verbose_name='Nombre Corto', unique=True)
    nombre = models.TextField(verbose_name='Nombre')

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Materia'
        verbose_name_plural = 'Materias'
        db_table = 'materias'
        ordering = ['id']