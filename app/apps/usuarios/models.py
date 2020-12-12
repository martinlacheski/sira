from django.contrib.auth.models import AbstractUser
from django.db import models

#from apps.inst.models import Facultad
from django.forms import model_to_dict

from apps.institucional.models import Sedes

#   Clase Tipos de Usuarios
class TiposUsuarios(models.Model):
    nombre = models.TextField(verbose_name='Nombre', unique=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Tipo'
        verbose_name_plural = 'Tipos'
        db_table = 'usuarios_tipos'
        ordering = ['id']

#   Clase Usuarios
class Usuarios(AbstractUser):
    #facultad = models.ForeignKey(Facultad, models.DO_NOTHING, verbose_name='Facultad')
    sede = models.ForeignKey(Sedes, models.DO_NOTHING, null=True, blank=True, verbose_name='Sede')
    legajo = models.CharField(max_length=10, null=True, blank=True, verbose_name='Legajo')
    dni = models.PositiveIntegerField(verbose_name='DNI', null=True, blank=True)
    telefono = models.TextField(null=True, blank=True)
    tipo = models.ForeignKey(TiposUsuarios, models.DO_NOTHING, verbose_name='Tipo')

    def toJSON(self):
        item = model_to_dict(self, exclude=['password', 'user_permissions', 'last_login', 'date_joined'])
        item['full_name'] = self.get_full_name()
        item['groups'] = [{'id': g.id, 'name': g.name} for g in self.groups.all()]
        return item
