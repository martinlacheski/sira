from django.contrib.auth.models import AbstractUser
from django.db import models

#from apps.inst.models import Facultad
from django.forms import model_to_dict


class Usuarios(AbstractUser):
    #facultad = models.ForeignKey(Facultad, models.DO_NOTHING, verbose_name='Facultad')
    legajo = models.CharField(max_length=10, null=True, blank=True, verbose_name='Legajo')
    dni = models.CharField(max_length=8, verbose_name='DNI', null=True, blank=True)
    telefono = models.TextField(null=True, blank=True)

    def toJSON(self):
        item = model_to_dict(self, exclude=['password', 'user_permissions', 'last_login', 'date_joined'])
        item['full_name'] = self.get_full_name()
        item['groups'] = [{'id': g.id, 'name': g.name} for g in self.groups.all()]
        return item




