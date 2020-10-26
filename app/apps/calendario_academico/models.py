from django.db import models
from django.forms import model_to_dict

#   Clase Calendario Academico
class CalendarioAcademico(models.Model):
    nombre = models.CharField(verbose_name='Año Académico', unique=True, max_length=4)
    fecha_desde = models.DateField(verbose_name='Fecha de Inicio')
    fecha_hasta = models.DateField(verbose_name='Fecha de Fin')
    primer_cuat_inicio = models.DateField(verbose_name='Inicio Primer Cuatrimestre')
    primer_cuat_fin = models.DateField(verbose_name='Finalización Primer Cuatrimestre')
    segundo_cuat_inicio = models.DateField(verbose_name='Inicio Segundo Cuatrimestre')
    segundo_cuat_fin = models.DateField(verbose_name='Finalización Segundo Cuatrimestre')

    def __str__(self):
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        return item

    class Meta:
        verbose_name = 'Calendario Académico'
        verbose_name_plural = 'Calendarios Académicos'
        db_table = 'calendario_academico'
        ordering = ['id']


#   Clase Turnos de Examen
class TurnosExamen(models.Model):
    anio = models.ForeignKey(CalendarioAcademico, models.DO_NOTHING, verbose_name='Año')
    nombre = models.CharField(verbose_name='Turno de Examen', max_length=20)
    inicio = models.DateField(verbose_name='Fecha de Inicio')
    fin = models.DateField(verbose_name='Fecha de Fin')

    def __str__(self):
        #return str(self.anio) + ' - ' + str(self.nombre)
        return self.nombre

    def toJSON(self):
        item = model_to_dict(self)
        item['anio'] = self.anio.toJSON()
        return item

    class Meta:
        verbose_name = 'Turno de Examen'
        verbose_name_plural = 'turnos de Examenes'
        db_table = 'calendario_turnos_examen'
        ordering = ['id']
