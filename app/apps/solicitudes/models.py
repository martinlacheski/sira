from datetime import datetime
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
    #fecha de solicitud!
    fecha_solicitud = models.DateTimeField(default=datetime.now, verbose_name='Fecha de Solicitud')
    cuenta_asociada = models.ForeignKey(SalasVirtuales, models.DO_NOTHING, verbose_name='Cuenta Asociada', null=True, blank=True)
    dni = models.PositiveIntegerField(verbose_name='DNI')
    nombres = models.TextField(verbose_name='Nombres')
    apellido = models.TextField(verbose_name='Apellido')
    email = models.EmailField(verbose_name='Correo Electrónico')
    sede = models.ForeignKey(Sedes, models.DO_NOTHING, verbose_name='Sede')
    #tipo = models.ForeignKey(TipoSolicitud, models.DO_NOTHING, verbose_name='Tipo de Reserva')
    motivo = models.ForeignKey(Motivos, models.DO_NOTHING, verbose_name='Motivo')
    observaciones = models.TextField(verbose_name='Observaciones', null=True, blank=True)
    carrera = models.ForeignKey(Carreras, models.DO_NOTHING, verbose_name='Carrera')
    materia = models.ForeignKey(Materias, models.DO_NOTHING, verbose_name='Materia')
    comision = models.ForeignKey(TiposComisiones, models.DO_NOTHING, verbose_name='Tipo de Comisión')
    fecha_reserva = models.DateField(verbose_name='Fecha de Reserva')
    inicio_hs = models.TimeField(verbose_name='Horario de Inicio')
    fin_hs = models.TimeField(verbose_name='Horario de Fin')
    estado = models.TextField(verbose_name='Estado', default='PENDIENTE')
    link_reunion = models.TextField(verbose_name='Link', null=True, blank=True)
    nombre_reunion = models.TextField(verbose_name='Reunión', null=True, blank=True)
    password_reunion = models.TextField(verbose_name='Contraseña', null=True, blank=True)


    def __str__(self):
        return self.nombres

    def toJSON(self):
        item = model_to_dict(self)
        #item['tipo'] = self.tipo.toJSON()
        #item['cuenta_asociada'] = self.cuenta_asociada.toJSON()
        item['motivo'] = self.motivo.toJSON()
        item['sede'] = self.sede.toJSON()
        item['carrera'] = self.carrera.toJSON()
        item['materia'] = self.materia.toJSON()
        item['comision'] = self.comision.toJSON()
        return item

    class Meta:
        verbose_name = 'Solicitud'
        verbose_name_plural = 'Solicitudes'
        db_table = 'solicitudes_salas_virtuales'
        ordering = ['id']
