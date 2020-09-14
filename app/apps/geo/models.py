from django.db import models

from django.forms import model_to_dict, TextInput


class Paises(models.Model):
    nombre = models.TextField(verbose_name='Nombre', unique=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Pais'
        verbose_name_plural = 'Paises'
        db_table = 'paises'
        ordering = ['id']


#   Clase Provincias
class Provincias(models.Model):
    pais = models.ForeignKey(Paises, models.DO_NOTHING, verbose_name='Pais')
    nombre = models.TextField()

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['pais'] = self.pais.toJSON()
        return item

    class Meta:
        verbose_name = 'Provincia'
        verbose_name_plural = 'Provincias'
        db_table = 'provincias'
        ordering = ['id']


#   Clase Localidades
class Localidades(models.Model):
    provincia = models.ForeignKey(Provincias, models.DO_NOTHING, verbose_name='Provincia')
    nombre = models.TextField()
    codigo_postal = models.TextField(null=True, blank=True, verbose_name='Código Postal')

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['provincia'] = self.provincia.toJSON()
        return item

    class Meta:
        verbose_name = 'Localidad'
        verbose_name_plural = 'Localidades'
        db_table = 'localidades'
        ordering = ['id']

