from django.contrib.auth.models import AbstractUser
from django.db import models

#from apps.inst.models import Facultad
from django.forms import model_to_dict

from apps.institucional.models import Sedes

#   Clase Usuarios
class Usuarios(AbstractUser):
    #facultad = models.ForeignKey(Facultad, models.DO_NOTHING, verbose_name='Facultad')
    sede = models.ForeignKey(Sedes, models.DO_NOTHING, null=True, blank=True, verbose_name='Sede')
    legajo = models.CharField(max_length=10, null=True, blank=True, verbose_name='Legajo')
    dni = models.PositiveIntegerField(verbose_name='DNI', null=True, blank=True)
    telefono = models.TextField(null=True, blank=True)

    def toJSON(self):
        item = model_to_dict(self, exclude=['password', 'user_permissions', 'last_login', 'date_joined'])
        item['full_name'] = self.get_full_name()
        item['groups'] = [{'id': g.id, 'name': g.name} for g in self.groups.all()]
        return item

#   Clase Docentes
class Docentes(models.Model):
    dni = models.PositiveIntegerField(verbose_name='DNI', unique=True)
    nombre = models.TextField(verbose_name='Nombre')
    apellido = models.TextField(verbose_name='Apellido')
    #legajo = models.CharField(max_length=10, null=True, blank=True, verbose_name='Legajo')
    email = models.EmailField(verbose_name='Correo Electrónico')
    #telefono = models.TextField(verbose_name='Teléfono', null=True, blank=True)

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Docente'
        verbose_name_plural = 'Docentes'
        db_table = 'docentes'
        ordering = ['id']




