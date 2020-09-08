# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

#   Clase Paises
class Paises(models.Model):
    id_pais = models.AutoField(primary_key=True)
    nombre = models.TextField(verbose_name='Nombre', unique=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        #managed = False
        #db_table = 'paises'
        verbose_name = 'País'
        verbose_name_plural = 'Paises'
        ordering = ['nombre']

#   Clase Provincias
class Provincias(models.Model):
    id_provincia = models.AutoField(primary_key=True)
    id_pais = models.ForeignKey(Paises, models.DO_NOTHING, db_column='id_pais')
    nombre = models.TextField()

    def __str__(self):
        return self.nombre

    class Meta:
        managed = False
        db_table = 'provincias'
        verbose_name = 'Provincia'
        verbose_name_plural = 'Provincias'
        ordering = ['nombre']

#   Clase Localidades
class Localidades(models.Model):
    id_localidad = models.AutoField(primary_key=True)
    id_provincia = models.ForeignKey(Provincias, models.DO_NOTHING, db_column='id_provincia')
    nombre = models.TextField()
    codigo_postal = models.IntegerField()

    def __str__(self):
        return self.nombre

    class Meta:
        managed = False
        db_table = 'localidades'
        verbose_name = 'Localidad'
        verbose_name_plural = 'Localidades'
        ordering = ['nombre']