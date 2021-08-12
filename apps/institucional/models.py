from django.db import models

from django.forms import model_to_dict

from apps.geografico.models import Localidades

#   Clase Universidad
class Universidad(models.Model):
    nombre = models.TextField(verbose_name='Nombre', unique=True)
    localidad = models.ForeignKey(Localidades, models.DO_NOTHING, verbose_name='Localidad')
    direccion = models.TextField(verbose_name='Dirección', null=True, blank=True)
    telefonos = models.TextField(verbose_name='Teléfonos', null=True, blank=True)
    web = models.TextField(verbose_name='Página Web', null=True, blank=True)
    #logo = models.ImageField(upload_to='universidad/%Y/%m/%d', null=True, blank=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['localidad'] = self.localidad.toJSON()
        return item

    class Meta:
        verbose_name = 'Universidad'
        db_table = 'universidad'
        ordering = ['id']


#   Clase Facultad
class Facultad(models.Model):
    universidad = models.ForeignKey(Universidad, models.DO_NOTHING, verbose_name='Universidad')
    nombre = models.TextField(verbose_name='Nombre', unique=True)
    localidad = models.ForeignKey(Localidades, models.DO_NOTHING, verbose_name='Localidad')
    direccion = models.TextField(verbose_name='Dirección', null=True, blank=True)
    telefonos = models.TextField(verbose_name='Teléfonos', null=True, blank=True)
    web = models.TextField(verbose_name='Página Web', null=True, blank=True)
    #logo = models.ImageField(upload_to='universidad/%Y/%m/%d', null=True, blank=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['universidad'] = self.universidad.toJSON()
        item['localidad'] = self.localidad.toJSON()
        return item

    class Meta:
        verbose_name = 'Facultad'
        db_table = 'facultad'
        ordering = ['id']


#   Clase Sedes
class Sedes(models.Model):
    facultad = models.ForeignKey(Facultad, models.DO_NOTHING, verbose_name='Facultad')
    nombre = models.TextField(verbose_name='Nombre', unique=True)
    localidad = models.ForeignKey(Localidades, models.DO_NOTHING, verbose_name='Localidad')
    direccion = models.TextField(verbose_name='Dirección', null=True, blank=True)
    telefonos = models.TextField(verbose_name='Teléfonos', null=True, blank=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['facultad'] = self.facultad.toJSON()
        item['localidad'] = self.localidad.toJSON()
        return item

    class Meta:
        verbose_name = 'Sede'
        verbose_name_plural = 'Sedes'
        db_table = 'sedes'
        ordering = ['id']

