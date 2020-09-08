
CREATE TABLE public.sexo (
                id_sexo SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_sexo PRIMARY KEY (id_sexo)
);


CREATE SEQUENCE public.solicitud_reserva_id_solicitud_reserva_seq;

CREATE TABLE public.solicitud_reserva (
                id_solicitud_reserva SERIAL NOT NULL,
                fecha_solicitud TIMESTAMP NOT NULL,
                dni CHAR(8) NOT NULL,
                nombre VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                id_tipo_reserva SERIAL NOT NULL,
                id_sede SERIAL NOT NULL,
                id_aula SERIAL,
                id_plataforma SERIAL,
                id_materia SERIAL NOT NULL,
                motivo VARCHAR NOT NULL,
                fecha_reserva DATE NOT NULL,
                inicio TIME NOT NULL,
                fin TIME NOT NULL,
                repeticion BOOLEAN NOT NULL,
                fin_repeticion DATE,
                estado CHAR(1),
                CONSTRAINT id_solicitud_reserva PRIMARY KEY (id_solicitud_reserva)
);


CREATE TABLE public.repeticion (
                id_repeticion SERIAL NOT NULL,
                id_solicitud_reserva SERIAL NOT NULL,
                dia VARCHAR NOT NULL,
                CONSTRAINT id_repeticion PRIMARY KEY (id_repeticion)
);


CREATE TABLE public.plataforma (
                id_plataforma SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_plataforma PRIMARY KEY (id_plataforma)
);


CREATE TABLE public.tipo_reserva (
                id_tipo_reserva SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_reserva PRIMARY KEY (id_tipo_reserva)
);


CREATE TABLE public.tipos_clases (
                id_tipo_clase SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_clase PRIMARY KEY (id_tipo_clase)
);


CREATE TABLE public.tipos_roles (
                id_tipo_rol SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_rol PRIMARY KEY (id_tipo_rol)
);


CREATE TABLE public.tipo_ocasional (
                id_tipo_ocasional SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_ocasional PRIMARY KEY (id_tipo_ocasional)
);


CREATE TABLE public.materias_comunes (
                id_materias_comunes SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_materias_comunes PRIMARY KEY (id_materias_comunes)
);


CREATE TABLE public.tipo_comision (
                id_tipo_comision SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                descripcion VARCHAR,
                CONSTRAINT id_tipo_comision PRIMARY KEY (id_tipo_comision)
);


CREATE TABLE public.tipo_material_apoyo (
                id_tipo_material_apoyo SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_material_apoyo PRIMARY KEY (id_tipo_material_apoyo)
);


CREATE TABLE public.tipo_equipamiento (
                id_tipo_equipamiento SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_equipamiento PRIMARY KEY (id_tipo_equipamiento)
);

CREATE TABLE public.equipamiento (
                id_equipamiento SERIAL NOT NULL,
                id_tipo_equipamiento SERIAL NOT NULL,
                descripcion VARCHAR NOT NULL,
                nro_inventario VARCHAR,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_equipamiento PRIMARY KEY (id_equipamiento)
);


CREATE TABLE public.tipos_aulas (
                id_tipo_aula SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_aula PRIMARY KEY (id_tipo_aula)
);


CREATE TABLE public.periodo_cursado (
                id_periodo_cursado SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_periodo_cursado PRIMARY KEY (id_periodo_cursado)
);


CREATE TABLE public.anio_cursado (
                id_anio_cursado INTEGER NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_anio_cursado PRIMARY KEY (id_anio_cursado)
);


CREATE TABLE public.tipo_carrera (
                id_tipo_carrera SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_carrera PRIMARY KEY (id_tipo_carrera)
);


CREATE TABLE public.rol_docente (
                id_rol_docente SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_rol_docente PRIMARY KEY (id_rol_docente)
);


CREATE TABLE public.tipos_usuarios (
                id_tipo_usuario SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_usuario PRIMARY KEY (id_tipo_usuario)
);


CREATE TABLE public.tipos_telefonos (
                id_tipo_telefono SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_tipo_telefono PRIMARY KEY (id_tipo_telefono)
);


CREATE TABLE public.paises (
                id_pais SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_pais PRIMARY KEY (id_pais)
);


CREATE TABLE public.provincias (
                id_provincia SERIAL NOT NULL,
                id_pais SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_provincia PRIMARY KEY (id_provincia)
);


CREATE TABLE public.localidades (
                id_localidad SERIAL NOT NULL,
                id_provincia SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                codigo_postal INTEGER NOT NULL,
                CONSTRAINT id_localidad PRIMARY KEY (id_localidad)
);


CREATE TABLE public.universidad (
                id_universidad SERIAL NOT NULL,
                id_localidad SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                direccion VARCHAR NOT NULL,
                telefonos VARCHAR NOT NULL,
                web VARCHAR NOT NULL,
                CONSTRAINT id_universidad PRIMARY KEY (id_universidad)
);


CREATE TABLE public.facultades (
                id_facultad SERIAL NOT NULL,
                id_universidad SERIAL NOT NULL,
                id_localidad SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                direccion VARCHAR NOT NULL,
                telefonos VARCHAR NOT NULL,
                web VARCHAR NOT NULL,
                CONSTRAINT id_facultad PRIMARY KEY (id_facultad)
);


CREATE TABLE public.carreras (
                id_carrera SERIAL NOT NULL,
                id_facultad SERIAL NOT NULL,
                id_tipo_carrera SERIAL NOT NULL,
                nombre_corto CHAR(20) NOT NULL,
                nombre VARCHAR NOT NULL,
                duracion_anios INTEGER NOT NULL,
                estado VARCHAR NOT NULL,
                CONSTRAINT id_carrera PRIMARY KEY (id_carrera)
);


CREATE TABLE public.plan_estudio (
                id_plan SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                id_carrera SERIAL NOT NULL,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_plan PRIMARY KEY (id_plan)
);


CREATE TABLE public.materias (
                id_materia SERIAL NOT NULL,
                id_carrera SERIAL NOT NULL,
                nombre_corto VARCHAR(20) NOT NULL,
                nombre VARCHAR NOT NULL,
                codigo VARCHAR NOT NULL,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_materia PRIMARY KEY (id_materia)
);

CREATE TABLE public.materias_de_materia_comun (
                id_materias_de_materia_comun SERIAL NOT NULL,
                id_materias_comunes SERIAL NOT NULL,
                id_materia SERIAL NOT NULL,
                CONSTRAINT id_materias_de_materia_comun PRIMARY KEY (id_materias_de_materia_comun)
);


CREATE TABLE public.materias_plan (
                id_materias_plan SERIAL NOT NULL,
                id_plan SERIAL NOT NULL,
                id_materia SERIAL NOT NULL,
                id_anio_cursado INTEGER NOT NULL,
                id_periodo_cursado INTEGER NOT NULL,
                CONSTRAINT id_materias_plan PRIMARY KEY (id_materias_plan)
);


CREATE TABLE public.personas (
                id_persona SERIAL NOT NULL,
                id_tipo_usuario SERIAL NOT NULL,
                id_facultad SERIAL NOT NULL,
                id_localidad SERIAL NOT NULL,
                usuario VARCHAR NOT NULL,
                password CHAR(128) NOT NULL,
                nombres VARCHAR NOT NULL,
                apellido VARCHAR NOT NULL,
                legajo VARCHAR NOT NULL,
                dni CHAR(8) NOT NULL,
                cuil CHAR(13) NOT NULL,
                id_sexo INTEGER NOT NULL,
                direccion VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                telefono VARCHAR,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_persona PRIMARY KEY (id_persona)
);


CREATE TABLE public.materias_docente (
                id_materias_docente SERIAL NOT NULL,
                id_persona SERIAL NOT NULL,
                id_materia SERIAL NOT NULL,
                id_rol_docente SERIAL NOT NULL,
                CONSTRAINT id_materias_docente PRIMARY KEY (id_materias_docente)
);


CREATE TABLE public.docente_materia_comun (
                id_docente_materia_comun SERIAL NOT NULL,
                id_materias_comunes SERIAL NOT NULL,
                id_materias_docente SERIAL NOT NULL,
                CONSTRAINT id_docente_materia_comun PRIMARY KEY (id_docente_materia_comun)
);


CREATE TABLE public.calendario_academico (
                anio INTEGER NOT NULL,
                id_facultad SERIAL NOT NULL,
                fecha_desde DATE NOT NULL,
                fecha_hasta DATE NOT NULL,
                primer_cuat_inicio DATE NOT NULL,
                primer_cuat_fin DATE NOT NULL,
                segundo_cuat_inicio DATE NOT NULL,
                segundo_cuat_fin DATE NOT NULL,
                CONSTRAINT anio PRIMARY KEY (anio)
);


CREATE TABLE public.comisiones (
                id_comision SERIAL NOT NULL,
                anio INTEGER NOT NULL,
                id_tipo_comision SERIAL NOT NULL,
                id_materia SERIAL NOT NULL,
                nombre_comision VARCHAR NOT NULL,
                cant_inscriptos INTEGER,
                CONSTRAINT id_comision PRIMARY KEY (id_comision)
);


CREATE TABLE public.docente_comision (
                id_docente_comision SERIAL NOT NULL,
                id_comision SERIAL NOT NULL,
                id_materias_docente SERIAL NOT NULL,
                CONSTRAINT id_docente_comision PRIMARY KEY (id_docente_comision)
);


CREATE TABLE public.libros_temas (
                id_libro_tema SERIAL NOT NULL,
                id_materia SERIAL NOT NULL,
                anio INTEGER NOT NULL,
                id_periodo_cursado INTEGER NOT NULL,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_libro_tema PRIMARY KEY (id_libro_tema)
);


CREATE TABLE public.detalles_clases (
                id_detalle_clase SERIAL NOT NULL,
                id_libro_tema SERIAL NOT NULL,
                id_persona SERIAL NOT NULL,
                fecha TIMESTAMP NOT NULL,
                unidad VARCHAR NOT NULL,
                clase VARCHAR NOT NULL,
                id_tipo_clase SERIAL NOT NULL,
                contenido VARCHAR NOT NULL,
                actividades VARCHAR,
                observaciones VARCHAR,
                CONSTRAINT id_detalle_clase PRIMARY KEY (id_detalle_clase)
);


CREATE TABLE public.turnos_examen (
                id_turno SERIAL NOT NULL,
                anio INTEGER NOT NULL,
                nombre VARCHAR NOT NULL,
                inicio DATE NOT NULL,
                fin DATE NOT NULL,
                CONSTRAINT id_turno PRIMARY KEY (id_turno)
);


CREATE TABLE public.feriados (
                id_feriado SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                fecha DATE NOT NULL,
                anio INTEGER NOT NULL,
                CONSTRAINT id_feriado PRIMARY KEY (id_feriado)
);


CREATE TABLE public.sedes (
                id_sede SERIAL NOT NULL,
                id_facultad SERIAL NOT NULL,
                id_localidad SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                direccion VARCHAR NOT NULL,
                CONSTRAINT id_sede PRIMARY KEY (id_sede)
);


CREATE TABLE public.cuentas_virtuales (
                id_cuenta_virtual SERIAL NOT NULL,
                id_plataforma SERIAL NOT NULL,
                id_sede SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                password VARCHAR NOT NULL,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_cuenta_virtual PRIMARY KEY (id_cuenta_virtual)
);


CREATE TABLE public.reservas_virtuales (
                id_reserva_virtual SERIAL NOT NULL,
                id_persona SERIAL NOT NULL,
                id_tipo_reserva SERIAL NOT NULL,
                id_cuenta_virtual SERIAL NOT NULL,
                inicio TIMESTAMP NOT NULL,
                fin TIMESTAMP NOT NULL,
                link VARCHAR NOT NULL,
                nro_reunion VARCHAR,
                password VARCHAR NOT NULL,
                clave_organizador VARCHAR,
                CONSTRAINT id_reserva_virtual PRIMARY KEY (id_reserva_virtual)
);


CREATE TABLE public.materiales_apoyo (
                id_material_apoyo SERIAL NOT NULL,
                id_sede SERIAL NOT NULL,
                id_tipo_material_apoyo SERIAL NOT NULL,
                descripcion VARCHAR NOT NULL,
                nro_inventario VARCHAR,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_material_apoyo PRIMARY KEY (id_material_apoyo)
);


CREATE TABLE public.reservas_materiales_apoyo (
                reservas_materiales_apoyo SERIAL NOT NULL,
                id_material_apoyo SERIAL NOT NULL,
                id_persona SERIAL NOT NULL,
                inicio TIMESTAMP NOT NULL,
                fin TIMESTAMP NOT NULL,
                descripcion VARCHAR NOT NULL,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_reserva_material_apoyo PRIMARY KEY (reservas_materiales_apoyo)
);


CREATE TABLE public.aulas (
                id_aula SERIAL NOT NULL,
                id_tipo_aula SERIAL NOT NULL,
                id_sede SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                capacidad INTEGER NOT NULL,
                ubicacion VARCHAR NOT NULL,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_aula PRIMARY KEY (id_aula)
);


CREATE TABLE public.reservas_aulas (
                id_reserva_aula SERIAL NOT NULL,
                id_persona SERIAL NOT NULL,
                id_tipo_reserva SERIAL NOT NULL,
                id_aula SERIAL NOT NULL,
                inicio TIMESTAMP NOT NULL,
                fin TIMESTAMP NOT NULL,
                estado CHAR(1) NOT NULL,
                CONSTRAINT id_reserva_aula PRIMARY KEY (id_reserva_aula)
);


CREATE TABLE public.reservas_examenes (
                id_reserva_examen SERIAL NOT NULL,
                id_reserva_aula SERIAL,
                id_reserva_virtual SERIAL,
                id_materia SERIAL NOT NULL,
                id_turno SERIAL NOT NULL,
                acta_examen VARCHAR NOT NULL,
                CONSTRAINT id_reserva_examen PRIMARY KEY (id_reserva_examen)
);


CREATE TABLE public.estudiantes_examen (
                id_estudiantes_examen SERIAL NOT NULL,
                id_reserva_examen SERIAL NOT NULL,
                legajo VARCHAR NOT NULL,
                apellido VARCHAR NOT NULL,
                nombres VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                CONSTRAINT id_estudiantes_examen PRIMARY KEY (id_estudiantes_examen)
);


CREATE TABLE public.tribunales_evaluadores (
                id_tribunal_evaluador SERIAL NOT NULL,
                id_reserva_examen SERIAL NOT NULL,
                id_persona SERIAL NOT NULL,
                id_tipo_rol SERIAL NOT NULL,
                CONSTRAINT id_tribunal_evaluador PRIMARY KEY (id_tribunal_evaluador)
);


CREATE TABLE public.reservas_comisiones (
                id_reserva_comision SERIAL NOT NULL,
                id_reserva_aula SERIAL,
                id_reserva_virtual SERIAL,
                id_comision SERIAL NOT NULL,
                CONSTRAINT id_reserva_comision PRIMARY KEY (id_reserva_comision)
);


CREATE TABLE public.reservas_materias_comunes (
                id_reserva_materia_comun SERIAL NOT NULL,
                id_reserva_aula SERIAL,
                id_reserva_virtual SERIAL,
                id_materias_comunes SERIAL NOT NULL,
                CONSTRAINT id_reserva_materia_comun PRIMARY KEY (id_reserva_materia_comun)
);


CREATE TABLE public.reservas_ocasionales (
                id_reserva_ocasional SERIAL NOT NULL,
                id_reserva_aula SERIAL,
                id_reserva_virtual SERIAL,
                id_tipo_ocasional SERIAL NOT NULL,
                descripcion VARCHAR NOT NULL,
                CONSTRAINT id_reserva_ocasional PRIMARY KEY (id_reserva_ocasional)
);


CREATE TABLE public.equipamiento_aula (
                id_equipamiento_aula SERIAL NOT NULL,
                id_aula SERIAL NOT NULL,
                id_equipamiento SERIAL NOT NULL,
                CONSTRAINT id_equipamiento_aula PRIMARY KEY (id_equipamiento_aula)
);


CREATE TABLE public.telefonos (
                id_telefono SERIAL NOT NULL,
                id_sede SERIAL NOT NULL,
                id_tipo_telefono SERIAL NOT NULL,
                numero VARCHAR NOT NULL,
                CONSTRAINT id_telefono PRIMARY KEY (id_telefono)
);


ALTER TABLE public.personas ADD CONSTRAINT sexo_usuarios_fk
FOREIGN KEY (id_sexo)
REFERENCES public.sexo (id_sexo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.repeticion ADD CONSTRAINT solicitud_reserva_repeticion_fk
FOREIGN KEY (id_solicitud_reserva)
REFERENCES public.solicitud_reserva (id_solicitud_reserva)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cuentas_virtuales ADD CONSTRAINT plataforma_cuentas_virtuales_fk
FOREIGN KEY (id_plataforma)
REFERENCES public.plataforma (id_plataforma)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_aulas ADD CONSTRAINT tipo_reserva_reservas_aulas_fk
FOREIGN KEY (id_tipo_reserva)
REFERENCES public.tipo_reserva (id_tipo_reserva)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_virtuales ADD CONSTRAINT tipo_reserva_reservas_virtuales_fk
FOREIGN KEY (id_tipo_reserva)
REFERENCES public.tipo_reserva (id_tipo_reserva)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.detalles_clases ADD CONSTRAINT tipos_clases_detalles_clases_fk
FOREIGN KEY (id_tipo_clase)
REFERENCES public.tipos_clases (id_tipo_clase)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tribunales_evaluadores ADD CONSTRAINT tipo_roles_tribunales_evaluadores_fk
FOREIGN KEY (id_tipo_rol)
REFERENCES public.tipos_roles (id_tipo_rol)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_ocasionales ADD CONSTRAINT tipo_ocasional_reservas_ocasionales_fk
FOREIGN KEY (id_tipo_ocasional)
REFERENCES public.tipo_ocasional (id_tipo_ocasional)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_de_materia_comun ADD CONSTRAINT materias_comunes_materias_de_materia_comun_fk
FOREIGN KEY (id_materias_comunes)
REFERENCES public.materias_comunes (id_materias_comunes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.docente_materia_comun ADD CONSTRAINT materias_comunes_docente_materia_comun_fk
FOREIGN KEY (id_materias_comunes)
REFERENCES public.materias_comunes (id_materias_comunes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_materias_comunes ADD CONSTRAINT materias_comunes_reservas_materias_comunes_fk
FOREIGN KEY (id_materias_comunes)
REFERENCES public.materias_comunes (id_materias_comunes)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.comisiones ADD CONSTRAINT tipo_comision_comisiones_fk
FOREIGN KEY (id_tipo_comision)
REFERENCES public.tipo_comision (id_tipo_comision)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materiales_apoyo ADD CONSTRAINT tipo_material_apoyo_materiales_apoyo_fk
FOREIGN KEY (id_tipo_material_apoyo)
REFERENCES public.tipo_material_apoyo (id_tipo_material_apoyo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.equipamiento ADD CONSTRAINT tipo_equipamiento_equipamiento_fk
FOREIGN KEY (id_tipo_equipamiento)
REFERENCES public.tipo_equipamiento (id_tipo_equipamiento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.equipamiento_aula ADD CONSTRAINT equipamiento_equipamiento_aula_fk
FOREIGN KEY (id_equipamiento)
REFERENCES public.equipamiento (id_equipamiento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.aulas ADD CONSTRAINT tipos_aulas_aulas_fk
FOREIGN KEY (id_tipo_aula)
REFERENCES public.tipos_aulas (id_tipo_aula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_plan ADD CONSTRAINT periodo_cursado_materias_plan_fk
FOREIGN KEY (id_periodo_cursado)
REFERENCES public.periodo_cursado (id_periodo_cursado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.libros_temas ADD CONSTRAINT periodo_cursado_libros_temas_fk
FOREIGN KEY (id_periodo_cursado)
REFERENCES public.periodo_cursado (id_periodo_cursado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_plan ADD CONSTRAINT anio_cursado_materias_plan_fk
FOREIGN KEY (id_anio_cursado)
REFERENCES public.anio_cursado (id_anio_cursado)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.carreras ADD CONSTRAINT tipo_carrera_carreras_fk
FOREIGN KEY (id_tipo_carrera)
REFERENCES public.tipo_carrera (id_tipo_carrera)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_docente ADD CONSTRAINT rol_docente_materias_docente_fk
FOREIGN KEY (id_rol_docente)
REFERENCES public.rol_docente (id_rol_docente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.personas ADD CONSTRAINT tipos_usuarios_usuarios_fk
FOREIGN KEY (id_tipo_usuario)
REFERENCES public.tipos_usuarios (id_tipo_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.telefonos ADD CONSTRAINT tipos_telefonos_telefonos_fk
FOREIGN KEY (id_tipo_telefono)
REFERENCES public.tipos_telefonos (id_tipo_telefono)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.provincias ADD CONSTRAINT paises_provincias_fk
FOREIGN KEY (id_pais)
REFERENCES public.paises (id_pais)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.localidades ADD CONSTRAINT provincias_localidades_fk
FOREIGN KEY (id_provincia)
REFERENCES public.provincias (id_provincia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.universidad ADD CONSTRAINT localidades_universidad_fk
FOREIGN KEY (id_localidad)
REFERENCES public.localidades (id_localidad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.facultades ADD CONSTRAINT localidades_facultades_fk
FOREIGN KEY (id_localidad)
REFERENCES public.localidades (id_localidad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sedes ADD CONSTRAINT localidades_sedes_fk
FOREIGN KEY (id_localidad)
REFERENCES public.localidades (id_localidad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.personas ADD CONSTRAINT localidades_usuarios_fk
FOREIGN KEY (id_localidad)
REFERENCES public.localidades (id_localidad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.facultades ADD CONSTRAINT universidad_facultades_fk
FOREIGN KEY (id_universidad)
REFERENCES public.universidad (id_universidad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.sedes ADD CONSTRAINT facultades_sedes_fk
FOREIGN KEY (id_facultad)
REFERENCES public.facultades (id_facultad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.calendario_academico ADD CONSTRAINT facultades_calendario_academico_fk
FOREIGN KEY (id_facultad)
REFERENCES public.facultades (id_facultad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.personas ADD CONSTRAINT facultades_usuarios_fk
FOREIGN KEY (id_facultad)
REFERENCES public.facultades (id_facultad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.carreras ADD CONSTRAINT facultades_carreras_fk
FOREIGN KEY (id_facultad)
REFERENCES public.facultades (id_facultad)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias ADD CONSTRAINT carreras_materias_fk
FOREIGN KEY (id_carrera)
REFERENCES public.carreras (id_carrera)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.plan_estudio ADD CONSTRAINT carreras_plan_estudio_fk
FOREIGN KEY (id_carrera)
REFERENCES public.carreras (id_carrera)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_plan ADD CONSTRAINT plan_estudio_materias_plan_fk
FOREIGN KEY (id_plan)
REFERENCES public.plan_estudio (id_plan)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_docente ADD CONSTRAINT materias_materias_docente_fk
FOREIGN KEY (id_materia)
REFERENCES public.materias (id_materia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_plan ADD CONSTRAINT materias_materias_plan_fk
FOREIGN KEY (id_materia)
REFERENCES public.materias (id_materia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.comisiones ADD CONSTRAINT materias_comisiones_fk
FOREIGN KEY (id_materia)
REFERENCES public.materias (id_materia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_de_materia_comun ADD CONSTRAINT materias_materias_de_materia_comun_fk
FOREIGN KEY (id_materia)
REFERENCES public.materias (id_materia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_examenes ADD CONSTRAINT materias_reservas_examenes_fk
FOREIGN KEY (id_materia)
REFERENCES public.materias (id_materia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.libros_temas ADD CONSTRAINT materias_libros_temas_fk
FOREIGN KEY (id_materia)
REFERENCES public.materias (id_materia)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materias_docente ADD CONSTRAINT usuarios_materias_docente_fk
FOREIGN KEY (id_persona)
REFERENCES public.personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_materiales_apoyo ADD CONSTRAINT usuarios_reservas_materiales_apoyo_fk
FOREIGN KEY (id_persona)
REFERENCES public.personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_aulas ADD CONSTRAINT usuarios_reservas_aulas_fk
FOREIGN KEY (id_persona)
REFERENCES public.personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tribunales_evaluadores ADD CONSTRAINT usuarios_tribunales_evaluadores_fk
FOREIGN KEY (id_persona)
REFERENCES public.personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.detalles_clases ADD CONSTRAINT usuarios_detalles_clases_fk
FOREIGN KEY (id_persona)
REFERENCES public.personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_virtuales ADD CONSTRAINT usuarios_reservas_virtuales_fk
FOREIGN KEY (id_persona)
REFERENCES public.personas (id_persona)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.docente_comision ADD CONSTRAINT materias_docente_docente_comision_fk
FOREIGN KEY (id_materias_docente)
REFERENCES public.materias_docente (id_materias_docente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.docente_materia_comun ADD CONSTRAINT materias_docente_docente_materia_comun_fk
FOREIGN KEY (id_materias_docente)
REFERENCES public.materias_docente (id_materias_docente)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.feriados ADD CONSTRAINT calendario_academico_feriados_fk
FOREIGN KEY (anio)
REFERENCES public.calendario_academico (anio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.turnos_examen ADD CONSTRAINT calendario_academico_turnos_examen_fk
FOREIGN KEY (anio)
REFERENCES public.calendario_academico (anio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.libros_temas ADD CONSTRAINT calendario_academico_libros_temas_fk
FOREIGN KEY (anio)
REFERENCES public.calendario_academico (anio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.comisiones ADD CONSTRAINT calendario_academico_comisiones_fk
FOREIGN KEY (anio)
REFERENCES public.calendario_academico (anio)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.docente_comision ADD CONSTRAINT comisiones_docente_comision_fk
FOREIGN KEY (id_comision)
REFERENCES public.comisiones (id_comision)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_comisiones ADD CONSTRAINT comisiones_reservas_comisiones_fk
FOREIGN KEY (id_comision)
REFERENCES public.comisiones (id_comision)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.detalles_clases ADD CONSTRAINT libros_temas_detalles_clases_fk
FOREIGN KEY (id_libro_tema)
REFERENCES public.libros_temas (id_libro_tema)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_examenes ADD CONSTRAINT turnos_examen_reservas_examenes_fk
FOREIGN KEY (id_turno)
REFERENCES public.turnos_examen (id_turno)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.telefonos ADD CONSTRAINT sedes_telefonos_fk
FOREIGN KEY (id_sede)
REFERENCES public.sedes (id_sede)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.aulas ADD CONSTRAINT sedes_aulas_fk
FOREIGN KEY (id_sede)
REFERENCES public.sedes (id_sede)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.materiales_apoyo ADD CONSTRAINT sedes_materiales_apoyo_fk
FOREIGN KEY (id_sede)
REFERENCES public.sedes (id_sede)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.cuentas_virtuales ADD CONSTRAINT sedes_cuentas_virtuales_fk
FOREIGN KEY (id_sede)
REFERENCES public.sedes (id_sede)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_virtuales ADD CONSTRAINT cuentas_virtuales_reservas_virtuales_fk
FOREIGN KEY (id_cuenta_virtual)
REFERENCES public.cuentas_virtuales (id_cuenta_virtual)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_ocasionales ADD CONSTRAINT reservas_virtuales_reservas_ocasionales_fk
FOREIGN KEY (id_reserva_virtual)
REFERENCES public.reservas_virtuales (id_reserva_virtual)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_examenes ADD CONSTRAINT reservas_virtuales_reservas_examenes_fk
FOREIGN KEY (id_reserva_virtual)
REFERENCES public.reservas_virtuales (id_reserva_virtual)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_materias_comunes ADD CONSTRAINT reservas_virtuales_reservas_materias_comunes_fk
FOREIGN KEY (id_reserva_virtual)
REFERENCES public.reservas_virtuales (id_reserva_virtual)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_comisiones ADD CONSTRAINT reservas_virtuales_reservas_comisiones_fk
FOREIGN KEY (id_reserva_virtual)
REFERENCES public.reservas_virtuales (id_reserva_virtual)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_materiales_apoyo ADD CONSTRAINT materiales_apoyo_reservas_materiales_apoyo_fk
FOREIGN KEY (id_material_apoyo)
REFERENCES public.materiales_apoyo (id_material_apoyo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.equipamiento_aula ADD CONSTRAINT aulas_equipamiento_aula_fk
FOREIGN KEY (id_aula)
REFERENCES public.aulas (id_aula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_aulas ADD CONSTRAINT aulas_reservas_aulas_fk
FOREIGN KEY (id_aula)
REFERENCES public.aulas (id_aula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_ocasionales ADD CONSTRAINT reservas_aulas_reservas_ocasionales_fk
FOREIGN KEY (id_reserva_aula)
REFERENCES public.reservas_aulas (id_reserva_aula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_materias_comunes ADD CONSTRAINT reservas_aulas_reservas_materias_comunes_fk
FOREIGN KEY (id_reserva_aula)
REFERENCES public.reservas_aulas (id_reserva_aula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_comisiones ADD CONSTRAINT reservas_aulas_reservas_comisiones_fk
FOREIGN KEY (id_reserva_aula)
REFERENCES public.reservas_aulas (id_reserva_aula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.reservas_examenes ADD CONSTRAINT reservas_aulas_reservas_examenes_fk
FOREIGN KEY (id_reserva_aula)
REFERENCES public.reservas_aulas (id_reserva_aula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.tribunales_evaluadores ADD CONSTRAINT reservas_examenes_tribunales_evaluadores_fk
FOREIGN KEY (id_reserva_examen)
REFERENCES public.reservas_examenes (id_reserva_examen)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.estudiantes_examen ADD CONSTRAINT reservas_examenes_estudiantes_examen_fk
FOREIGN KEY (id_reserva_examen)
REFERENCES public.reservas_examenes (id_reserva_examen)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
