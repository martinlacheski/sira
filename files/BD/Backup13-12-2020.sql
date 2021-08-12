--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

-- Started on 2020-12-13 20:39:46 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 25223)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 25221)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 25233)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 25231)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 207 (class 1259 OID 25215)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25213)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 252 (class 1259 OID 25802)
-- Name: calendario_academico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendario_academico (
    id integer NOT NULL,
    nombre character varying(4) NOT NULL,
    fecha_desde date NOT NULL,
    fecha_hasta date NOT NULL,
    primer_cuat_inicio date NOT NULL,
    primer_cuat_fin date NOT NULL,
    segundo_cuat_inicio date NOT NULL,
    segundo_cuat_fin date NOT NULL
);


ALTER TABLE public.calendario_academico OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 25800)
-- Name: calendario_academico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calendario_academico_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendario_academico_id_seq OWNER TO postgres;

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 251
-- Name: calendario_academico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calendario_academico_id_seq OWNED BY public.calendario_academico.id;


--
-- TOC entry 254 (class 1259 OID 25821)
-- Name: calendario_turnos_examen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendario_turnos_examen (
    id integer NOT NULL,
    nombre character varying(20) NOT NULL,
    inicio date NOT NULL,
    fin date NOT NULL,
    anio_id integer NOT NULL
);


ALTER TABLE public.calendario_turnos_examen OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 25819)
-- Name: calendario_turnos_examen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calendario_turnos_examen_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calendario_turnos_examen_id_seq OWNER TO postgres;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 253
-- Name: calendario_turnos_examen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calendario_turnos_examen_id_seq OWNED BY public.calendario_turnos_examen.id;


--
-- TOC entry 223 (class 1259 OID 25359)
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    id integer NOT NULL,
    nombre_corto character varying(30) NOT NULL,
    nombre text NOT NULL,
    plan character varying(20),
    duracion integer NOT NULL,
    tipo_id integer NOT NULL
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25349)
-- Name: carreras_anios_cursado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras_anios_cursado (
    id integer NOT NULL,
    nombre integer NOT NULL
);


ALTER TABLE public.carreras_anios_cursado OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25347)
-- Name: carreras_anios_cursado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_anios_cursado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carreras_anios_cursado_id_seq OWNER TO postgres;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 220
-- Name: carreras_anios_cursado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_anios_cursado_id_seq OWNED BY public.carreras_anios_cursado.id;


--
-- TOC entry 222 (class 1259 OID 25357)
-- Name: carreras_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carreras_id_seq OWNER TO postgres;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 222
-- Name: carreras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_id_seq OWNED BY public.carreras.id;


--
-- TOC entry 225 (class 1259 OID 25372)
-- Name: carreras_periodos_cursado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras_periodos_cursado (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.carreras_periodos_cursado OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25370)
-- Name: carreras_periodos_cursado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_periodos_cursado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carreras_periodos_cursado_id_seq OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 224
-- Name: carreras_periodos_cursado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_periodos_cursado_id_seq OWNED BY public.carreras_periodos_cursado.id;


--
-- TOC entry 227 (class 1259 OID 25385)
-- Name: carreras_tipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras_tipos (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.carreras_tipos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25383)
-- Name: carreras_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_tipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carreras_tipos_id_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 226
-- Name: carreras_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_tipos_id_seq OWNED BY public.carreras_tipos.id;


--
-- TOC entry 258 (class 1259 OID 25845)
-- Name: cuentas_salas_virtuales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas_salas_virtuales (
    id integer NOT NULL,
    nombre text NOT NULL,
    email character varying(254) NOT NULL,
    password text NOT NULL,
    estado character varying(1) NOT NULL,
    plataforma_id integer NOT NULL,
    sede_id integer NOT NULL,
    access_token character varying(200),
    refresh_token character varying(200)
);


ALTER TABLE public.cuentas_salas_virtuales OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25325)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25323)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 205 (class 1259 OID 25205)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25203)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 203 (class 1259 OID 25194)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 25192)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 242 (class 1259 OID 25566)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25496)
-- Name: facultad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultad (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    web text,
    localidad_id integer NOT NULL,
    universidad_id integer NOT NULL
);


ALTER TABLE public.facultad OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25494)
-- Name: facultad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facultad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facultad_id_seq OWNER TO postgres;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 236
-- Name: facultad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facultad_id_seq OWNED BY public.facultad.id;


--
-- TOC entry 235 (class 1259 OID 25466)
-- Name: localidades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localidades (
    id integer NOT NULL,
    nombre text NOT NULL,
    codigo_postal text,
    pais_id integer NOT NULL,
    provincia_id integer NOT NULL
);


ALTER TABLE public.localidades OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25464)
-- Name: localidades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.localidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.localidades_id_seq OWNER TO postgres;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 234
-- Name: localidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.localidades_id_seq OWNED BY public.localidades.id;


--
-- TOC entry 229 (class 1259 OID 25398)
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias (
    id integer NOT NULL,
    nombre text NOT NULL,
    nombre_corto character varying(30) NOT NULL,
    anio_id integer NOT NULL,
    carrera_id integer NOT NULL,
    periodo_id integer NOT NULL
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25396)
-- Name: materias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materias_id_seq OWNER TO postgres;

--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 228
-- Name: materias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materias_id_seq OWNED BY public.materias.id;


--
-- TOC entry 248 (class 1259 OID 25641)
-- Name: materias_tipos_comisiones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias_tipos_comisiones (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.materias_tipos_comisiones OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 25639)
-- Name: materias_tipos_comisiones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.materias_tipos_comisiones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.materias_tipos_comisiones_id_seq OWNER TO postgres;

--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 247
-- Name: materias_tipos_comisiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.materias_tipos_comisiones_id_seq OWNED BY public.materias_tipos_comisiones.id;


--
-- TOC entry 231 (class 1259 OID 25442)
-- Name: paises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paises (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.paises OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25440)
-- Name: paises_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paises_id_seq OWNER TO postgres;

--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 230
-- Name: paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paises_id_seq OWNED BY public.paises.id;


--
-- TOC entry 256 (class 1259 OID 25835)
-- Name: plataformas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plataformas (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE public.plataformas OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 25833)
-- Name: plataformas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plataformas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plataformas_id_seq OWNER TO postgres;

--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 255
-- Name: plataformas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plataformas_id_seq OWNED BY public.plataformas.id;


--
-- TOC entry 257 (class 1259 OID 25843)
-- Name: plataformas_salas_virtuales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plataformas_salas_virtuales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plataformas_salas_virtuales_id_seq OWNER TO postgres;

--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 257
-- Name: plataformas_salas_virtuales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plataformas_salas_virtuales_id_seq OWNED BY public.cuentas_salas_virtuales.id;


--
-- TOC entry 233 (class 1259 OID 25455)
-- Name: provincias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincias (
    id integer NOT NULL,
    nombre text NOT NULL,
    pais_id integer NOT NULL
);


ALTER TABLE public.provincias OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25453)
-- Name: provincias_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provincias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provincias_id_seq OWNER TO postgres;

--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 232
-- Name: provincias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provincias_id_seq OWNED BY public.provincias.id;


--
-- TOC entry 250 (class 1259 OID 25665)
-- Name: reservas_salas_virtuales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas_salas_virtuales (
    id integer NOT NULL,
    fecha_solicitud timestamp with time zone NOT NULL,
    apellido text NOT NULL,
    carrera_id integer NOT NULL,
    dni integer NOT NULL,
    email character varying(254) NOT NULL,
    fecha_reserva date NOT NULL,
    fin_hs time without time zone NOT NULL,
    inicio_hs time without time zone NOT NULL,
    materia_id integer NOT NULL,
    motivo_id integer NOT NULL,
    nombres text NOT NULL,
    sede_id integer NOT NULL,
    comision_id integer NOT NULL,
    observaciones text,
    estado text NOT NULL,
    cuenta_asociada_id integer,
    link_reunion text,
    nombre_reunion text,
    password_reunion text,
    CONSTRAINT solicitudes_dni_check CHECK ((dni >= 0))
);


ALTER TABLE public.reservas_salas_virtuales OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 25522)
-- Name: sedes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sedes (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    facultad_id integer NOT NULL,
    localidad_id integer NOT NULL
);


ALTER TABLE public.sedes OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25520)
-- Name: sedes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sedes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sedes_id_seq OWNER TO postgres;

--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 240
-- Name: sedes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sedes_id_seq OWNED BY public.sedes.id;


--
-- TOC entry 249 (class 1259 OID 25663)
-- Name: solicitudes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solicitudes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitudes_id_seq OWNER TO postgres;

--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 249
-- Name: solicitudes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitudes_id_seq OWNED BY public.reservas_salas_virtuales.id;


--
-- TOC entry 244 (class 1259 OID 25578)
-- Name: solicitudes_motivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitudes_motivos (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.solicitudes_motivos OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 25576)
-- Name: solicitudes_motivos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solicitudes_motivos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitudes_motivos_id_seq OWNER TO postgres;

--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 243
-- Name: solicitudes_motivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitudes_motivos_id_seq OWNED BY public.solicitudes_motivos.id;


--
-- TOC entry 246 (class 1259 OID 25591)
-- Name: solicitudes_tipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.solicitudes_tipos (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.solicitudes_tipos OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 25589)
-- Name: solicitudes_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.solicitudes_tipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solicitudes_tipos_id_seq OWNER TO postgres;

--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 245
-- Name: solicitudes_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.solicitudes_tipos_id_seq OWNED BY public.solicitudes_tipos.id;


--
-- TOC entry 239 (class 1259 OID 25509)
-- Name: universidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.universidad (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    web text,
    localidad_id integer NOT NULL
);


ALTER TABLE public.universidad OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25507)
-- Name: universidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.universidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universidad_id_seq OWNER TO postgres;

--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 238
-- Name: universidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.universidad_id_seq OWNED BY public.universidad.id;


--
-- TOC entry 260 (class 1259 OID 25940)
-- Name: usuarios_tipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_tipos (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.usuarios_tipos OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 25938)
-- Name: usuarios_tipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_tipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_tipos_id_seq OWNER TO postgres;

--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 259
-- Name: usuarios_tipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_tipos_id_seq OWNED BY public.usuarios_tipos.id;


--
-- TOC entry 213 (class 1259 OID 25267)
-- Name: usuarios_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_usuarios (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    legajo character varying(10),
    dni integer,
    telefono text,
    sede_id integer,
    tipo_id integer NOT NULL,
    CONSTRAINT usuarios_usuarios_dni_a026c704_check CHECK ((dni >= 0))
);


ALTER TABLE public.usuarios_usuarios OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 25280)
-- Name: usuarios_usuarios_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_usuarios_groups (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.usuarios_usuarios_groups OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 25278)
-- Name: usuarios_usuarios_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_usuarios_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usuarios_groups_id_seq OWNER TO postgres;

--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuarios_usuarios_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_usuarios_groups_id_seq OWNED BY public.usuarios_usuarios_groups.id;


--
-- TOC entry 212 (class 1259 OID 25265)
-- Name: usuarios_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 212
-- Name: usuarios_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_usuarios_id_seq OWNED BY public.usuarios_usuarios.id;


--
-- TOC entry 217 (class 1259 OID 25288)
-- Name: usuarios_usuarios_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_usuarios_user_permissions (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.usuarios_usuarios_user_permissions OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 25286)
-- Name: usuarios_usuarios_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_usuarios_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usuarios_user_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuarios_usuarios_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_usuarios_user_permissions_id_seq OWNED BY public.usuarios_usuarios_user_permissions.id;


--
-- TOC entry 3067 (class 2604 OID 25226)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3068 (class 2604 OID 25236)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3066 (class 2604 OID 25218)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3091 (class 2604 OID 25805)
-- Name: calendario_academico id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendario_academico ALTER COLUMN id SET DEFAULT nextval('public.calendario_academico_id_seq'::regclass);


--
-- TOC entry 3092 (class 2604 OID 25824)
-- Name: calendario_turnos_examen id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendario_turnos_examen ALTER COLUMN id SET DEFAULT nextval('public.calendario_turnos_examen_id_seq'::regclass);


--
-- TOC entry 3076 (class 2604 OID 25362)
-- Name: carreras id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN id SET DEFAULT nextval('public.carreras_id_seq'::regclass);


--
-- TOC entry 3075 (class 2604 OID 25352)
-- Name: carreras_anios_cursado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_anios_cursado ALTER COLUMN id SET DEFAULT nextval('public.carreras_anios_cursado_id_seq'::regclass);


--
-- TOC entry 3077 (class 2604 OID 25375)
-- Name: carreras_periodos_cursado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_periodos_cursado ALTER COLUMN id SET DEFAULT nextval('public.carreras_periodos_cursado_id_seq'::regclass);


--
-- TOC entry 3078 (class 2604 OID 25388)
-- Name: carreras_tipos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_tipos ALTER COLUMN id SET DEFAULT nextval('public.carreras_tipos_id_seq'::regclass);


--
-- TOC entry 3094 (class 2604 OID 25848)
-- Name: cuentas_salas_virtuales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_salas_virtuales ALTER COLUMN id SET DEFAULT nextval('public.plataformas_salas_virtuales_id_seq'::regclass);


--
-- TOC entry 3073 (class 2604 OID 25328)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3065 (class 2604 OID 25208)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3064 (class 2604 OID 25197)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3083 (class 2604 OID 25499)
-- Name: facultad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad ALTER COLUMN id SET DEFAULT nextval('public.facultad_id_seq'::regclass);


--
-- TOC entry 3082 (class 2604 OID 25469)
-- Name: localidades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidades ALTER COLUMN id SET DEFAULT nextval('public.localidades_id_seq'::regclass);


--
-- TOC entry 3079 (class 2604 OID 25401)
-- Name: materias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias ALTER COLUMN id SET DEFAULT nextval('public.materias_id_seq'::regclass);


--
-- TOC entry 3088 (class 2604 OID 25644)
-- Name: materias_tipos_comisiones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_tipos_comisiones ALTER COLUMN id SET DEFAULT nextval('public.materias_tipos_comisiones_id_seq'::regclass);


--
-- TOC entry 3080 (class 2604 OID 25445)
-- Name: paises id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises ALTER COLUMN id SET DEFAULT nextval('public.paises_id_seq'::regclass);


--
-- TOC entry 3093 (class 2604 OID 25838)
-- Name: plataformas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plataformas ALTER COLUMN id SET DEFAULT nextval('public.plataformas_id_seq'::regclass);


--
-- TOC entry 3081 (class 2604 OID 25458)
-- Name: provincias id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincias ALTER COLUMN id SET DEFAULT nextval('public.provincias_id_seq'::regclass);


--
-- TOC entry 3089 (class 2604 OID 25668)
-- Name: reservas_salas_virtuales id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_salas_virtuales ALTER COLUMN id SET DEFAULT nextval('public.solicitudes_id_seq'::regclass);


--
-- TOC entry 3085 (class 2604 OID 25525)
-- Name: sedes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sedes ALTER COLUMN id SET DEFAULT nextval('public.sedes_id_seq'::regclass);


--
-- TOC entry 3086 (class 2604 OID 25581)
-- Name: solicitudes_motivos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes_motivos ALTER COLUMN id SET DEFAULT nextval('public.solicitudes_motivos_id_seq'::regclass);


--
-- TOC entry 3087 (class 2604 OID 25594)
-- Name: solicitudes_tipos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes_tipos ALTER COLUMN id SET DEFAULT nextval('public.solicitudes_tipos_id_seq'::regclass);


--
-- TOC entry 3084 (class 2604 OID 25512)
-- Name: universidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universidad ALTER COLUMN id SET DEFAULT nextval('public.universidad_id_seq'::regclass);


--
-- TOC entry 3095 (class 2604 OID 25943)
-- Name: usuarios_tipos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_tipos ALTER COLUMN id SET DEFAULT nextval('public.usuarios_tipos_id_seq'::regclass);


--
-- TOC entry 3069 (class 2604 OID 25270)
-- Name: usuarios_usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_usuarios_id_seq'::regclass);


--
-- TOC entry 3071 (class 2604 OID 25283)
-- Name: usuarios_usuarios_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_groups ALTER COLUMN id SET DEFAULT nextval('public.usuarios_usuarios_groups_id_seq'::regclass);


--
-- TOC entry 3072 (class 2604 OID 25291)
-- Name: usuarios_usuarios_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.usuarios_usuarios_user_permissions_id_seq'::regclass);


--
-- TOC entry 3417 (class 0 OID 25223)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
3	visualizador
1	administrador
2	gestor
4	Docente
\.


--
-- TOC entry 3419 (class 0 OID 25233)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	5
2	1	6
3	1	8
4	1	9
5	1	10
6	1	12
7	1	21
8	1	22
9	1	23
10	1	24
11	1	25
12	1	26
13	1	27
14	1	28
15	1	29
16	1	30
17	1	31
18	1	32
19	1	33
20	1	34
21	1	35
22	1	36
23	1	37
24	1	38
25	1	39
26	1	40
27	1	41
28	1	42
29	1	43
30	1	44
31	1	45
32	1	46
33	1	47
34	1	48
35	1	49
36	1	50
37	1	51
38	1	52
39	1	53
40	1	54
41	1	55
42	1	56
43	1	57
44	1	58
45	1	59
46	1	60
47	1	61
48	1	62
49	1	63
50	1	64
51	1	65
52	1	66
53	1	67
54	1	68
55	1	69
56	1	70
57	1	71
58	1	72
59	1	73
60	1	74
61	1	75
62	1	76
63	2	25
64	2	26
65	2	28
66	2	29
67	2	30
68	2	32
69	2	33
70	2	34
71	2	36
72	2	37
73	2	38
74	2	40
75	2	41
76	2	42
77	2	44
78	2	45
79	2	46
80	2	48
81	2	49
82	2	50
83	2	52
84	2	53
85	2	54
86	2	56
87	2	57
88	2	58
89	2	60
90	2	61
91	2	62
92	2	64
93	2	65
94	2	66
95	2	68
96	2	69
97	2	70
98	2	72
99	2	73
100	2	74
101	2	76
102	3	28
103	1	119
104	1	85
105	1	117
106	1	118
107	1	120
108	1	86
109	1	87
110	1	88
111	2	71
112	2	88
113	2	75
114	2	117
115	2	118
116	2	119
117	2	120
118	2	85
119	2	86
120	2	87
121	4	88
122	4	85
\.


--
-- TOC entry 3415 (class 0 OID 25215)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_usuarios
22	Can change user	6	change_usuarios
23	Can delete user	6	delete_usuarios
24	Can view user	6	view_usuarios
25	Can add Año	7	add_aniocursado
26	Can change Año	7	change_aniocursado
27	Can delete Año	7	delete_aniocursado
28	Can view Año	7	view_aniocursado
29	Can add Carrera	8	add_carreras
30	Can change Carrera	8	change_carreras
31	Can delete Carrera	8	delete_carreras
32	Can view Carrera	8	view_carreras
33	Can add Periodo	9	add_periodocursado
34	Can change Periodo	9	change_periodocursado
35	Can delete Periodo	9	delete_periodocursado
36	Can view Periodo	9	view_periodocursado
37	Can add Tipo	10	add_tiposcarreras
38	Can change Tipo	10	change_tiposcarreras
39	Can delete Tipo	10	delete_tiposcarreras
40	Can view Tipo	10	view_tiposcarreras
41	Can add Materia	11	add_materias
42	Can change Materia	11	change_materias
43	Can delete Materia	11	delete_materias
44	Can view Materia	11	view_materias
45	Can add Facultad	12	add_facultad
46	Can change Facultad	12	change_facultad
47	Can delete Facultad	12	delete_facultad
48	Can view Facultad	12	view_facultad
49	Can add Universidad	13	add_universidad
50	Can change Universidad	13	change_universidad
51	Can delete Universidad	13	delete_universidad
52	Can view Universidad	13	view_universidad
53	Can add Sede	14	add_sedes
54	Can change Sede	14	change_sedes
55	Can delete Sede	14	delete_sedes
56	Can view Sede	14	view_sedes
57	Can add Pais	15	add_paises
58	Can change Pais	15	change_paises
59	Can delete Pais	15	delete_paises
60	Can view Pais	15	view_paises
61	Can add Provincia	16	add_provincias
62	Can change Provincia	16	change_provincias
63	Can delete Provincia	16	delete_provincias
64	Can view Provincia	16	view_provincias
65	Can add Localidad	17	add_localidades
66	Can change Localidad	17	change_localidades
67	Can delete Localidad	17	delete_localidades
68	Can view Localidad	17	view_localidades
69	Can add Motivo	18	add_motivos
70	Can change Motivo	18	change_motivos
71	Can delete Motivo	18	delete_motivos
72	Can view Motivo	18	view_motivos
73	Can add Tipo	19	add_tiposolicitud
74	Can change Tipo	19	change_tiposolicitud
75	Can delete Tipo	19	delete_tiposolicitud
76	Can view Tipo	19	view_tiposolicitud
77	Can add Docente	20	add_docentes
78	Can change Docente	20	change_docentes
79	Can delete Docente	20	delete_docentes
80	Can view Docente	20	view_docentes
81	Can add Tipo	21	add_tiposcomisiones
82	Can change Tipo	21	change_tiposcomisiones
83	Can delete Tipo	21	delete_tiposcomisiones
84	Can view Tipo	21	view_tiposcomisiones
85	Can add Solicitud	22	add_solicitudes
86	Can change Solicitud	22	change_solicitudes
87	Can delete Solicitud	22	delete_solicitudes
88	Can view Solicitud	22	view_solicitudes
89	Can add Calendario Académico	23	add_calendario_academico
90	Can change Calendario Académico	23	change_calendario_academico
91	Can delete Calendario Académico	23	delete_calendario_academico
92	Can view Calendario Académico	23	view_calendario_academico
93	Can add Calendario Académico	24	add_calendarioacademico
94	Can change Calendario Académico	24	change_calendarioacademico
95	Can delete Calendario Académico	24	delete_calendarioacademico
96	Can view Calendario Académico	24	view_calendarioacademico
97	Can add Turno de Examen	25	add_turnoexamen
98	Can change Turno de Examen	25	change_turnoexamen
99	Can delete Turno de Examen	25	delete_turnoexamen
100	Can view Turno de Examen	25	view_turnoexamen
101	Can add Turno de Examen	26	add_calendarioturnoexamen
102	Can change Turno de Examen	26	change_calendarioturnoexamen
103	Can delete Turno de Examen	26	delete_calendarioturnoexamen
104	Can view Turno de Examen	26	view_calendarioturnoexamen
105	Can add Turno de Examen	27	add_turnosexamen
106	Can change Turno de Examen	27	change_turnosexamen
107	Can delete Turno de Examen	27	delete_turnosexamen
108	Can view Turno de Examen	27	view_turnosexamen
109	Can add Nombre	28	add_plataformas
110	Can change Nombre	28	change_plataformas
111	Can delete Nombre	28	delete_plataformas
112	Can view Nombre	28	view_plataformas
113	Can add Sala Virtual	29	add_salasvirtuales
114	Can change Sala Virtual	29	change_salasvirtuales
115	Can delete Sala Virtual	29	delete_salasvirtuales
116	Can view Sala Virtual	29	view_salasvirtuales
117	Can add reserva virtual	30	add_reservasvirtuales
118	Can change reserva virtual	30	change_reservasvirtuales
119	Can delete reserva virtual	30	delete_reservasvirtuales
120	Can view reserva virtual	30	view_reservasvirtuales
121	Can add Tipo	31	add_tiposusuarios
122	Can change Tipo	31	change_tiposusuarios
123	Can delete Tipo	31	delete_tiposusuarios
124	Can view Tipo	31	view_tiposusuarios
\.


--
-- TOC entry 3460 (class 0 OID 25802)
-- Dependencies: 252
-- Data for Name: calendario_academico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calendario_academico (id, nombre, fecha_desde, fecha_hasta, primer_cuat_inicio, primer_cuat_fin, segundo_cuat_inicio, segundo_cuat_fin) FROM stdin;
1	2020	2020-02-10	2021-03-31	2020-04-20	2020-08-21	2020-09-07	2020-12-18
\.


--
-- TOC entry 3462 (class 0 OID 25821)
-- Dependencies: 254
-- Data for Name: calendario_turnos_examen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calendario_turnos_examen (id, nombre, inicio, fin, anio_id) FROM stdin;
3	PRIMER TURNO	2020-02-03	2020-02-07	1
\.


--
-- TOC entry 3431 (class 0 OID 25359)
-- Dependencies: 223
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (id, nombre_corto, nombre, plan, duracion, tipo_id) FROM stdin;
1	Analista en Sistemas de Comp.	Analista en Sistemas de Computación	2010	3	1
2	Lic. en Sist. de Información	Licenciatura en Sistemas de Información	2013	5	2
3	Maestria en Tec. de la Inform.	Maestria en Tecnologias de la Información	2014	2	3
4	CURSO	CURSO	\N	1	4
\.


--
-- TOC entry 3429 (class 0 OID 25349)
-- Dependencies: 221
-- Data for Name: carreras_anios_cursado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras_anios_cursado (id, nombre) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	0
\.


--
-- TOC entry 3433 (class 0 OID 25372)
-- Dependencies: 225
-- Data for Name: carreras_periodos_cursado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras_periodos_cursado (id, nombre) FROM stdin;
3	Anual
4	Doble Cursado
1	1er Cuatrimestre
2	2do Cuatrimestre
5	Curso
\.


--
-- TOC entry 3435 (class 0 OID 25385)
-- Dependencies: 227
-- Data for Name: carreras_tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras_tipos (id, nombre) FROM stdin;
1	Pregrado
2	Grado
3	Posgrado
4	Curso
\.


--
-- TOC entry 3466 (class 0 OID 25845)
-- Dependencies: 258
-- Data for Name: cuentas_salas_virtuales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas_salas_virtuales (id, nombre, email, password, estado, plataforma_id, sede_id, access_token, refresh_token) FROM stdin;
3	Sala 3 Webex	fceqynsala3@mail.unam.edu.ar	Sala3.fceqyn	A	1	1	M2U2NWNmZWYtN2M1MC00ZWIyLWEwNzEtYzk5MzBjNjczMDM1NGRiMDdlN2EtYjAy_P0A1_bbbd8451-22ce-44ba-a050-4b19c5cf4ecb	-
4	Sala 4 Webex	fceqynsala4@mail.unam.edu.ar	Sala4.fceqyn	A	1	1	MzI3ZDJiM2QtZGU2Ni00MGMyLWE4NzItYTQyOWY1ZjZjZGU4MmExNmNjZGMtOWJm_P0A1_bbbd8451-22ce-44ba-a050-4b19c5cf4ecb	-
32	Sala 32 Webex	fceqynsala32@mail.unam.edu.ar	Exactas.32	A	1	1	NTg0ZGFkZTEtYjcxZi00OWEzLWFiN2MtZjk0ODhmZGE2NmM2Nzk2YWQwNWUtYmNh_P0A1_bbbd8451-22ce-44ba-a050-4b19c5cf4ecb	-
7	ZOOM sala 1	zoom1@fceqyn.unam.edu.ar	1234	A	3	1	\N	\N
\.


--
-- TOC entry 3427 (class 0 OID 25325)
-- Dependencies: 219
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-10-05 16:46:47.970457-03	1	administrador	1	[{"added": {}}]	3	1
2	2020-10-05 16:47:51.471977-03	2	gestor	1	[{"added": {}}]	3	1
3	2020-10-05 16:48:35.913328-03	3	visualizador	1	[{"added": {}}]	3	1
4	2020-12-11 10:16:28.482944-03	1	administrador	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
5	2020-12-11 10:17:27.251928-03	2	gestor	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
6	2020-12-11 17:58:43.18076-03	4	Docente	1	[{"added": {}}]	3	1
\.


--
-- TOC entry 3413 (class 0 OID 25205)
-- Dependencies: 205
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	usuarios	usuarios
7	carreras	aniocursado
8	carreras	carreras
9	carreras	periodocursado
10	carreras	tiposcarreras
11	carreras	materias
12	institucional	facultad
13	institucional	universidad
14	institucional	sedes
15	geografico	paises
16	geografico	provincias
17	geografico	localidades
18	solicitudes	motivos
19	solicitudes	tiposolicitud
20	usuarios	docentes
21	carreras	tiposcomisiones
22	solicitudes	solicitudes
23	calendario_academico	calendario_academico
24	calendario_academico	calendarioacademico
25	calendario_academico	turnoexamen
26	calendario_academico	calendarioturnoexamen
27	calendario_academico	turnosexamen
28	plataformas	plataformas
29	plataformas	salasvirtuales
30	solicitudes	reservasvirtuales
31	usuarios	tiposusuarios
\.


--
-- TOC entry 3411 (class 0 OID 25194)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-10-05 16:34:12.436108-03
2	contenttypes	0002_remove_content_type_name	2020-10-05 16:34:12.443078-03
3	auth	0001_initial	2020-10-05 16:34:12.465426-03
4	auth	0002_alter_permission_name_max_length	2020-10-05 16:34:12.490688-03
5	auth	0003_alter_user_email_max_length	2020-10-05 16:34:12.497298-03
6	auth	0004_alter_user_username_opts	2020-10-05 16:34:12.503728-03
7	auth	0005_alter_user_last_login_null	2020-10-05 16:34:12.510091-03
8	auth	0006_require_contenttypes_0002	2020-10-05 16:34:12.51247-03
9	auth	0007_alter_validators_add_error_messages	2020-10-05 16:34:12.521342-03
10	auth	0008_alter_user_username_max_length	2020-10-05 16:34:12.527693-03
11	auth	0009_alter_user_last_name_max_length	2020-10-05 16:34:12.53394-03
12	auth	0010_alter_group_name_max_length	2020-10-05 16:34:12.541639-03
13	auth	0011_update_proxy_permissions	2020-10-05 16:34:12.547958-03
14	auth	0012_alter_user_first_name_max_length	2020-10-05 16:34:12.554326-03
15	usuarios	0001_initial	2020-10-05 16:34:12.588985-03
16	admin	0001_initial	2020-10-05 16:34:12.640039-03
17	admin	0002_logentry_remove_auto_add	2020-10-05 16:34:12.663645-03
18	admin	0003_logentry_add_action_flag_choices	2020-10-05 16:34:12.686596-03
19	carreras	0001_initial	2020-10-05 16:34:12.800367-03
20	geografico	0001_initial	2020-10-05 16:34:12.901588-03
21	institucional	0001_initial	2020-10-05 16:34:12.980766-03
22	sessions	0001_initial	2020-10-05 16:34:13.018225-03
23	solicitudes	0001_initial	2020-10-05 16:34:13.060728-03
24	carreras	0002_auto_20201005_1933	2020-10-05 19:34:04.101538-03
25	usuarios	0002_docentes	2020-10-06 08:51:05.023389-03
26	usuarios	0003_auto_20201006_0937	2020-10-06 09:37:43.181191-03
27	usuarios	0004_auto_20201006_1009	2020-10-06 10:09:57.155809-03
28	carreras	0003_tiposcomisiones	2020-10-06 10:14:58.299697-03
29	usuarios	0005_auto_20201006_1014	2020-10-06 10:14:58.306887-03
30	usuarios	0006_auto_20201006_1049	2020-10-06 10:49:04.534604-03
31	solicitudes	0002_solicitudes	2020-10-06 15:22:56.008154-03
32	solicitudes	0003_auto_20201006_1522	2020-10-06 15:22:56.184054-03
33	usuarios	0007_usuarios_sedes	2020-10-06 15:22:56.249361-03
34	usuarios	0008_auto_20201006_1525	2020-10-06 15:25:36.796167-03
35	solicitudes	0004_auto_20201006_1821	2020-10-06 18:21:18.728693-03
36	usuarios	0009_remove_docentes_telefono	2020-10-06 18:21:18.732902-03
37	solicitudes	0005_auto_20201006_1848	2020-10-06 18:48:53.639489-03
38	solicitudes	0006_auto_20201008_1731	2020-10-08 17:31:55.155425-03
39	solicitudes	0007_auto_20201008_1739	2020-10-08 17:39:25.490709-03
40	solicitudes	0008_auto_20201008_1800	2020-10-08 18:02:55.156751-03
41	calendario_academico	0001_initial	2020-10-23 17:22:33.396168-03
42	calendario_academico	0002_remove_calendario_academico_facultad	2020-10-26 14:33:24.30684-03
43	calendario_academico	0002_auto_20201026_1642	2020-10-26 16:42:41.104679-03
44	plataformas	0001_initial	2020-10-26 17:11:29.818766-03
45	plataformas	0002_auto_20201026_1819	2020-10-26 18:19:49.332794-03
46	plataformas	0003_auto_20201119_1314	2020-12-07 16:41:12.180921-03
47	plataformas	0004_auto_20201119_1322	2020-12-07 16:47:36.138102-03
48	plataformas	0005_auto_20201207_1640	2020-12-07 16:47:36.15771-03
49	plataformas	0006_auto_20201207_1641	2020-12-07 16:47:36.169839-03
50	plataformas	0007_auto_20201207_1642	2020-12-07 16:47:36.205638-03
51	plataformas	0008_auto_20201207_1643	2020-12-07 16:47:36.22881-03
52	plataformas	0009_auto_20201207_1645	2020-12-07 16:47:36.250863-03
53	plataformas	0010_auto_20201207_1646	2020-12-07 16:47:36.285553-03
54	solicitudes	0009_reservasvirtuales	2020-12-07 16:47:36.31933-03
55	plataformas	0011_auto_20201207_1650	2020-12-07 16:51:00.802578-03
56	plataformas	0012_auto_20201207_1653	2020-12-07 16:53:55.48798-03
57	usuarios	0010_tiposusuarios	2020-12-09 16:46:49.864362-03
58	usuarios	0011_usuarios_tipo	2020-12-09 17:02:04.916858-03
59	solicitudes	0010_auto_20201209_1717	2020-12-09 17:17:45.241454-03
60	solicitudes	0011_auto_20201209_1918	2020-12-09 19:18:21.952106-03
61	solicitudes	0012_auto_20201211_1747	2020-12-11 17:47:26.552667-03
62	solicitudes	0013_auto_20201211_2017	2020-12-11 20:17:30.851782-03
63	solicitudes	0014_auto_20201212_0844	2020-12-12 08:44:28.663226-03
64	solicitudes	0015_auto_20201212_1736	2020-12-12 17:36:15.116074-03
65	solicitudes	0016_auto_20201212_1737	2020-12-12 17:37:56.735336-03
66	solicitudes	0017_remove_solicitudes_tipo	2020-12-12 17:43:40.485145-03
67	solicitudes	0018_auto_20201213_1226	2020-12-13 12:27:01.574412-03
68	usuarios	0012_delete_docentes	2020-12-13 12:27:01.586415-03
\.


--
-- TOC entry 3450 (class 0 OID 25566)
-- Dependencies: 242
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
zt5hs3k5pn7jzx2owlmg3t9pyxcp7f5p	.eJxVjE0OwiAYBe_C2hB-xIJL9z0DgfeBVA0kpV0Z725IutDtm5n3Zj7sW_F7T6tfiF2ZZKffLQY8Ux2AHqHeG0er27pEPhR-0M7nRul1O9y_gxJ6GXUGFOxkiBCsPIsMJ7U2xl2gksVEJEkKQ1JnigoOgBYxRwrCWiT2-QIMWDlF:1kcarc:NTyWpbmili9sl_te-p4h9u1hNC3Ofd6WP2tUTTmYBYg	2020-11-24 18:07:40.155599-03
i83e4hz9um8ffdykvnezlu0ewx1f4x2f	.eJxVjE0OwiAYBe_C2hB-xIJL9z0DgfeBVA0kpV0Z725IutDtm5n3Zj7sW_F7T6tfiF2ZZKffLQY8Ux2AHqHeG0er27pEPhR-0M7nRul1O9y_gxJ6GXUGFOxkiBCsPIsMJ7U2xl2gksVEJEkKQ1JnigoOgBYxRwrCWiT2-QIMWDlF:1kn61K:4XWdkQoyetKePcv5_Zm-TaBE0L_zOms6ClT6gTEYZhY	2020-12-23 17:25:06.097421-03
\.


--
-- TOC entry 3445 (class 0 OID 25496)
-- Dependencies: 237
-- Data for Name: facultad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facultad (id, nombre, direccion, telefonos, web, localidad_id, universidad_id) FROM stdin;
1	Facultad de Ciencias Exactas, Químicas y Naturales	Félix de Azara 1552	(+54) 0376–4435099	https://www.fceqyn.unam.edu.ar/	1	1
\.


--
-- TOC entry 3443 (class 0 OID 25466)
-- Dependencies: 235
-- Data for Name: localidades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.localidades (id, nombre, codigo_postal, pais_id, provincia_id) FROM stdin;
1	Posadas	3300	1	1
2	Apóstoles	3350	1	1
3	Encarnación	6000	3	4
\.


--
-- TOC entry 3437 (class 0 OID 25398)
-- Dependencies: 229
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materias (id, nombre, nombre_corto, anio_id, carrera_id, periodo_id) FROM stdin;
1	ALGORITMO Y ESTRUCTURA DE DATOS I (AS101)	ALGORITMO Y EST. DE DATOS I	1	1	3
2	INGLES TECNICO I (AS102)	INGLES TECNICO I	1	1	3
3	MATEMATICA I (AS103)	MATEMATICA I	1	1	1
4	INTRODUCCION A LA INFORMATICA (AS104)	INTRODUCCION A LA INFORMATICA	1	1	1
5	SISTEMAS ADMINISTRATIVOS I (AS105)	SISTEMAS ADMINISTRATIVOS I	1	1	1
6	ARQUITECTURA DE COMPUTADORAS (AS106)	ARQUITECTURA DE COMPUTADORAS	1	1	2
7	MATEMATICA II (AS107)	MATEMATICA II	1	1	2
9	CURSO	CURSO	6	4	5
10	MATEMATICA I (L1301)	MATEMATICA I (L1301)	1	2	1
11	ALGORITMOS Y ESTRUCTURAS DE DATOS I (L1302)	ALG Y ESTR DE DATOS I	1	2	1
12	SISTEMAS OPERATIVOS (AS210)	SISTEMAS OPERATIVOS (AS210)	2	1	2
13	TRABAJO FINAL (AS308)	TRABAJO FINAL (AS308)	3	1	2
14	PROYECTO DE SOFTWARE (L1326)	PROYECTO DE SOFTWARE (L1326)	3	2	2
\.


--
-- TOC entry 3456 (class 0 OID 25641)
-- Dependencies: 248
-- Data for Name: materias_tipos_comisiones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.materias_tipos_comisiones (id, nombre) FROM stdin;
1	Teoría
2	Práctica
3	Laboratorio
\.


--
-- TOC entry 3439 (class 0 OID 25442)
-- Dependencies: 231
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paises (id, nombre) FROM stdin;
1	Argentina
2	Brasil
3	Paraguay
\.


--
-- TOC entry 3464 (class 0 OID 25835)
-- Dependencies: 256
-- Data for Name: plataformas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plataformas (id, nombre) FROM stdin;
1	CISCO WEBEX MEETINGS
3	ZOOM
4	GOOGLE MEETS
5	JITSI MEET
6	SKYPE
\.


--
-- TOC entry 3441 (class 0 OID 25455)
-- Dependencies: 233
-- Data for Name: provincias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provincias (id, nombre, pais_id) FROM stdin;
1	Misiones	1
2	Corrientes	1
3	Florianópolis	2
4	Itapúa	3
\.


--
-- TOC entry 3458 (class 0 OID 25665)
-- Dependencies: 250
-- Data for Name: reservas_salas_virtuales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas_salas_virtuales (id, fecha_solicitud, apellido, carrera_id, dni, email, fecha_reserva, fin_hs, inicio_hs, materia_id, motivo_id, nombres, sede_id, comision_id, observaciones, estado, cuenta_asociada_id, link_reunion, nombre_reunion, password_reunion) FROM stdin;
2	2020-12-13 18:35:07-03	Lacheski	2	31572857	martinlacheski@gmail.com	2020-12-13	23:00:00	22:00:00	14	1	Martin	5	2		CONFIRMADO	3	https://unam1.webex.com/unam1-sp/j.php?MTID=mf5c4031bcd823ca7a6c97f6c6f9008e1	PROYECTO DE SOFTWARE (L1326) - Licenciatura en Sistemas de Información	202020
4	2020-12-13 18:35:07-03	Lacheski	1	31572857	martinlacheski@gmail.com	2020-12-13	23:00:00	22:00:00	13	1	Martin	5	1		CONFIRMADO	32	https://unam1.webex.com/unam1-sp/j.php?MTID=mc27784ce7ab17fba696f60633c0d4ed0	TRABAJO FINAL (AS308) - Analista en Sistemas de Computación	202020
6	2020-12-13 18:35:07-03	Lacheski	1	31572857	martinlacheski@gmail.com	2020-12-13	23:00:00	22:00:00	13	1	Martin	5	3		CONFIRMADO	4	https://unam1.webex.com/unam1-sp/j.php?MTID=m62f9d2f957483c4e5e37447bdc8256ea	TRABAJO FINAL (AS308) - Analista en Sistemas de Computación	202020
1	2020-12-13 18:35:07-03	Lacheski	2	31572857	martinlacheski@gmail.com	2020-12-13	23:00:00	22:00:00	14	1	Martin	5	1		CONFIRMADO	32	https://unam1.webex.com/unam1-sp/j.php?MTID=mbfcfbf938c78b1fc02ac57e63945ba99	PROYECTO DE SOFTWARE (L1326) - Licenciatura en Sistemas de Información	202020
3	2020-12-13 18:35:07-03	Lacheski	2	31572857	martinlacheski@gmail.com	2020-12-13	23:00:00	22:00:00	14	1	Martin	5	3		CONFIRMADO	3	https://unam1.webex.com/unam1-sp/j.php?MTID=m91435d8bd98467fe09aff6ca87c7575a	PROYECTO DE SOFTWARE (L1326) - Licenciatura en Sistemas de Información	202020
8	2020-12-13 20:23:37-03	Lacheski	1	31572857	martinlacheski@gmail.com	2020-12-13	23:00:00	22:00:00	1	1	Martin	1	1		CONFIRMADO	4	https://unam1.webex.com/unam1-sp/j.php?MTID=m70737ea309f9d45a1d9956df940a5f81	ALGORITMO Y ESTRUCTURA DE DATOS I (AS101) - Analista en Sistemas de Computación	202020
7	2020-12-13 18:35:07-03	Lacheski	4	31572857	martinlacheski@gmail.com	2020-12-13	23:00:00	22:00:00	9	1	Martin	5	3		CANCELADO	\N			
\.


--
-- TOC entry 3449 (class 0 OID 25522)
-- Dependencies: 241
-- Data for Name: sedes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sedes (id, nombre, direccion, telefonos, facultad_id, localidad_id) FROM stdin;
1	Edificio Central	Félix de Azara 1552	(+54) 0376 – 4435099	1	1
2	Módulo de Farmacia y Bioquímica	Av. Mariano Moreno N°1375	(+54) 0376–4435118	1	1
3	Escuela de Enfermería	Av. López Torres N°3415	(+54) 0376–4428177/4440961	1	1
4	﻿Módulo Campus FCEQyN	Campus Universitario Ruta Nac. Nº 12 Km 7 y 1/2	(+54) 0376–4482266	1	1
5	Módulo Informática - Sede Apóstoles	Pellegrini N°269	(+54) 03758–423232	1	2
\.


--
-- TOC entry 3452 (class 0 OID 25578)
-- Dependencies: 244
-- Data for Name: solicitudes_motivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solicitudes_motivos (id, nombre) FROM stdin;
1	Dictado de Clases
2	Dictado de Cursos
3	Mesa de Examen
\.


--
-- TOC entry 3454 (class 0 OID 25591)
-- Dependencies: 246
-- Data for Name: solicitudes_tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.solicitudes_tipos (id, nombre) FROM stdin;
1	Sala Virtual
2	Aula
3	Material de Apoyo
\.


--
-- TOC entry 3447 (class 0 OID 25509)
-- Dependencies: 239
-- Data for Name: universidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.universidad (id, nombre, direccion, telefonos, web, localidad_id) FROM stdin;
1	Universidad Nacional de Misiones	Campus Universitario  Ruta Nac. Nº 12 Km 7 y 1/2	+54 376 4480200	https://www.unam.edu.ar/	1
\.


--
-- TOC entry 3468 (class 0 OID 25940)
-- Dependencies: 260
-- Data for Name: usuarios_tipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_tipos (id, nombre) FROM stdin;
1	Administrativo
2	Docente
\.


--
-- TOC entry 3421 (class 0 OID 25267)
-- Dependencies: 213
-- Data for Name: usuarios_usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_usuarios (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, legajo, dni, telefono, sede_id, tipo_id) FROM stdin;
3	pbkdf2_sha256$216000$21mlwwXUELLS$KhPWfJ8U0rlFi2ifSH1O4kjBw6m2vX3QLI0iyjY2EB8=	\N	f	sira	Usuario	Visualizador	sira@fceqyn.unam.edu.ar	f	t	2020-10-05 16:50:29.830558-03	\N	11222333		\N	1
2	pbkdf2_sha256$216000$pVp9766bseIf$gHGBD8Oaa/VS7MWx33eJqfqUH5YRhFZsTtmHvCIIMU8=	\N	f	nani	Yanina Belen	Paredes	nanielen@gmail.com	f	t	2020-10-05 16:49:20.925068-03	1234	32036097		\N	1
8	pbkdf2_sha256$216000$kX1iCc0pKM0h$7Tg1by1D2d7skyReeShq3o5JNxdslAH0fPd1BUqlmFk=	2020-12-11 10:16:44.169373-03	f	rogelio	Rogelio	Lacheski	martin_lacheski@hotmail.com	f	t	2020-12-11 10:06:26.508314-03	123456	16986234	0376-154718021	5	1
9	pbkdf2_sha256$216000$pgGgStggLwPH$jNy/zMrMw+2LNM6gjPWhXOtTu/rqGVKRIyHqNiBhysw=	\N	f	leoquiroga	Leonardo	Quiroga	leoquiroga221@gmail.com	f	t	2020-12-11 17:59:37.807384-03	\N	12345678		5	2
1	pbkdf2_sha256$216000$K89bcAjF8iME$1ZBwP4ETAoIv+ShTbZPrYOJWLoyTmEWf0rxctk4JEw8=	2020-12-13 11:27:56.636791-03	t	martin	Martin	Lacheski	martinlacheski@gmail.com	t	t	2020-10-05 16:35:04.210033-03	4680	31572857	0376-154718021	\N	1
\.


--
-- TOC entry 3423 (class 0 OID 25280)
-- Dependencies: 215
-- Data for Name: usuarios_usuarios_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_usuarios_groups (id, usuarios_id, group_id) FROM stdin;
2	3	3
3	2	2
12	8	2
13	9	4
\.


--
-- TOC entry 3425 (class 0 OID 25288)
-- Dependencies: 217
-- Data for Name: usuarios_usuarios_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios_usuarios_user_permissions (id, usuarios_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 4, true);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 122, true);


--
-- TOC entry 3505 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 124, true);


--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 251
-- Name: calendario_academico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calendario_academico_id_seq', 2, true);


--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 253
-- Name: calendario_turnos_examen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calendario_turnos_examen_id_seq', 3, true);


--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 220
-- Name: carreras_anios_cursado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_anios_cursado_id_seq', 6, true);


--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 222
-- Name: carreras_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_id_seq', 4, true);


--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 224
-- Name: carreras_periodos_cursado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_periodos_cursado_id_seq', 5, true);


--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 226
-- Name: carreras_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_tipos_id_seq', 4, true);


--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 218
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 6, true);


--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 31, true);


--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 68, true);


--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 236
-- Name: facultad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facultad_id_seq', 1, true);


--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 234
-- Name: localidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.localidades_id_seq', 3, true);


--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 228
-- Name: materias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materias_id_seq', 14, true);


--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 247
-- Name: materias_tipos_comisiones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.materias_tipos_comisiones_id_seq', 4, true);


--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 230
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paises_id_seq', 3, true);


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 255
-- Name: plataformas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plataformas_id_seq', 6, true);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 257
-- Name: plataformas_salas_virtuales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plataformas_salas_virtuales_id_seq', 7, true);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 232
-- Name: provincias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provincias_id_seq', 4, true);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 240
-- Name: sedes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sedes_id_seq', 5, true);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 249
-- Name: solicitudes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitudes_id_seq', 8, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 243
-- Name: solicitudes_motivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitudes_motivos_id_seq', 3, true);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 245
-- Name: solicitudes_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.solicitudes_tipos_id_seq', 3, true);


--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 238
-- Name: universidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.universidad_id_seq', 1, true);


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 259
-- Name: usuarios_tipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_tipos_id_seq', 2, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 214
-- Name: usuarios_usuarios_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_usuarios_groups_id_seq', 13, true);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 212
-- Name: usuarios_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_usuarios_id_seq', 9, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 216
-- Name: usuarios_usuarios_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_usuarios_user_permissions_id_seq', 1, false);


--
-- TOC entry 3109 (class 2606 OID 25263)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3114 (class 2606 OID 25249)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3117 (class 2606 OID 25238)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3111 (class 2606 OID 25228)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3104 (class 2606 OID 25240)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3106 (class 2606 OID 25220)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 25809)
-- Name: calendario_academico calendario_academico_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendario_academico
    ADD CONSTRAINT calendario_academico_nombre_key UNIQUE (nombre);


--
-- TOC entry 3229 (class 2606 OID 25807)
-- Name: calendario_academico calendario_academico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendario_academico
    ADD CONSTRAINT calendario_academico_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 25826)
-- Name: calendario_turnos_examen calendario_turnos_examen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendario_turnos_examen
    ADD CONSTRAINT calendario_turnos_examen_pkey PRIMARY KEY (id);


--
-- TOC entry 3142 (class 2606 OID 25356)
-- Name: carreras_anios_cursado carreras_anios_cursado_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_anios_cursado
    ADD CONSTRAINT carreras_anios_cursado_nombre_key UNIQUE (nombre);


--
-- TOC entry 3144 (class 2606 OID 25354)
-- Name: carreras_anios_cursado carreras_anios_cursado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_anios_cursado
    ADD CONSTRAINT carreras_anios_cursado_pkey PRIMARY KEY (id);


--
-- TOC entry 3147 (class 2606 OID 25369)
-- Name: carreras carreras_nombre_corto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_nombre_corto_key UNIQUE (nombre_corto);


--
-- TOC entry 3153 (class 2606 OID 25382)
-- Name: carreras_periodos_cursado carreras_periodos_cursado_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_periodos_cursado
    ADD CONSTRAINT carreras_periodos_cursado_nombre_key UNIQUE (nombre);


--
-- TOC entry 3155 (class 2606 OID 25380)
-- Name: carreras_periodos_cursado carreras_periodos_cursado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_periodos_cursado
    ADD CONSTRAINT carreras_periodos_cursado_pkey PRIMARY KEY (id);


--
-- TOC entry 3149 (class 2606 OID 25367)
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (id);


--
-- TOC entry 3158 (class 2606 OID 25395)
-- Name: carreras_tipos carreras_tipos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_tipos
    ADD CONSTRAINT carreras_tipos_nombre_key UNIQUE (nombre);


--
-- TOC entry 3160 (class 2606 OID 25393)
-- Name: carreras_tipos carreras_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_tipos
    ADD CONSTRAINT carreras_tipos_pkey PRIMARY KEY (id);


--
-- TOC entry 3139 (class 2606 OID 25334)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3099 (class 2606 OID 25212)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3101 (class 2606 OID 25210)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3097 (class 2606 OID 25202)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 25573)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3181 (class 2606 OID 25506)
-- Name: facultad facultad_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_nombre_key UNIQUE (nombre);


--
-- TOC entry 3183 (class 2606 OID 25504)
-- Name: facultad facultad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_pkey PRIMARY KEY (id);


--
-- TOC entry 3176 (class 2606 OID 25474)
-- Name: localidades localidades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_pkey PRIMARY KEY (id);


--
-- TOC entry 3165 (class 2606 OID 25406)
-- Name: materias materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 25651)
-- Name: materias_tipos_comisiones materias_tipos_comisiones_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_tipos_comisiones
    ADD CONSTRAINT materias_tipos_comisiones_nombre_key UNIQUE (nombre);


--
-- TOC entry 3216 (class 2606 OID 25649)
-- Name: materias_tipos_comisiones materias_tipos_comisiones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias_tipos_comisiones
    ADD CONSTRAINT materias_tipos_comisiones_pkey PRIMARY KEY (id);


--
-- TOC entry 3168 (class 2606 OID 25452)
-- Name: paises paises_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_nombre_key UNIQUE (nombre);


--
-- TOC entry 3170 (class 2606 OID 25450)
-- Name: paises paises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 25842)
-- Name: plataformas plataformas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plataformas
    ADD CONSTRAINT plataformas_nombre_key UNIQUE (nombre);


--
-- TOC entry 3237 (class 2606 OID 25840)
-- Name: plataformas plataformas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plataformas
    ADD CONSTRAINT plataformas_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 25874)
-- Name: cuentas_salas_virtuales plataformas_salas_virtuales_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_salas_virtuales
    ADD CONSTRAINT plataformas_salas_virtuales_email_key UNIQUE (email);


--
-- TOC entry 3242 (class 2606 OID 25855)
-- Name: cuentas_salas_virtuales plataformas_salas_virtuales_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_salas_virtuales
    ADD CONSTRAINT plataformas_salas_virtuales_nombre_key UNIQUE (nombre);


--
-- TOC entry 3244 (class 2606 OID 25853)
-- Name: cuentas_salas_virtuales plataformas_salas_virtuales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_salas_virtuales
    ADD CONSTRAINT plataformas_salas_virtuales_pkey PRIMARY KEY (id);


--
-- TOC entry 3173 (class 2606 OID 25463)
-- Name: provincias provincias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 25532)
-- Name: sedes sedes_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_nombre_key UNIQUE (nombre);


--
-- TOC entry 3197 (class 2606 OID 25530)
-- Name: sedes sedes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_pkey PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 25588)
-- Name: solicitudes_motivos solicitudes_motivos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes_motivos
    ADD CONSTRAINT solicitudes_motivos_nombre_key UNIQUE (nombre);


--
-- TOC entry 3206 (class 2606 OID 25586)
-- Name: solicitudes_motivos solicitudes_motivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes_motivos
    ADD CONSTRAINT solicitudes_motivos_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 25673)
-- Name: reservas_salas_virtuales solicitudes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_salas_virtuales
    ADD CONSTRAINT solicitudes_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 25601)
-- Name: solicitudes_tipos solicitudes_tipos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes_tipos
    ADD CONSTRAINT solicitudes_tipos_nombre_key UNIQUE (nombre);


--
-- TOC entry 3211 (class 2606 OID 25599)
-- Name: solicitudes_tipos solicitudes_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.solicitudes_tipos
    ADD CONSTRAINT solicitudes_tipos_pkey PRIMARY KEY (id);


--
-- TOC entry 3188 (class 2606 OID 25519)
-- Name: universidad universidad_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_nombre_key UNIQUE (nombre);


--
-- TOC entry 3190 (class 2606 OID 25517)
-- Name: universidad universidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 25950)
-- Name: usuarios_tipos usuarios_tipos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_tipos
    ADD CONSTRAINT usuarios_tipos_nombre_key UNIQUE (nombre);


--
-- TOC entry 3251 (class 2606 OID 25948)
-- Name: usuarios_tipos usuarios_tipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_tipos
    ADD CONSTRAINT usuarios_tipos_pkey PRIMARY KEY (id);


--
-- TOC entry 3127 (class 2606 OID 25285)
-- Name: usuarios_usuarios_groups usuarios_usuarios_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_groups
    ADD CONSTRAINT usuarios_usuarios_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3130 (class 2606 OID 25296)
-- Name: usuarios_usuarios_groups usuarios_usuarios_groups_usuarios_id_group_id_31056d4d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_groups
    ADD CONSTRAINT usuarios_usuarios_groups_usuarios_id_group_id_31056d4d_uniq UNIQUE (usuarios_id, group_id);


--
-- TOC entry 3119 (class 2606 OID 25275)
-- Name: usuarios_usuarios usuarios_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios
    ADD CONSTRAINT usuarios_usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3132 (class 2606 OID 25310)
-- Name: usuarios_usuarios_user_permissions usuarios_usuarios_user_p_usuarios_id_permission_i_1fb72da5_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_user_permissions
    ADD CONSTRAINT usuarios_usuarios_user_p_usuarios_id_permission_i_1fb72da5_uniq UNIQUE (usuarios_id, permission_id);


--
-- TOC entry 3135 (class 2606 OID 25293)
-- Name: usuarios_usuarios_user_permissions usuarios_usuarios_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_user_permissions
    ADD CONSTRAINT usuarios_usuarios_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3124 (class 2606 OID 25277)
-- Name: usuarios_usuarios usuarios_usuarios_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios
    ADD CONSTRAINT usuarios_usuarios_username_key UNIQUE (username);


--
-- TOC entry 3107 (class 1259 OID 25264)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3112 (class 1259 OID 25260)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3115 (class 1259 OID 25261)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3102 (class 1259 OID 25246)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3225 (class 1259 OID 25815)
-- Name: calendario_academico_nombre_d0c9b89e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendario_academico_nombre_d0c9b89e_like ON public.calendario_academico USING btree (nombre varchar_pattern_ops);


--
-- TOC entry 3230 (class 1259 OID 25832)
-- Name: calendario_turnos_examen_anio_id_b0b7bc08; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendario_turnos_examen_anio_id_b0b7bc08 ON public.calendario_turnos_examen USING btree (anio_id);


--
-- TOC entry 3145 (class 1259 OID 25416)
-- Name: carreras_nombre_corto_49d82646_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carreras_nombre_corto_49d82646_like ON public.carreras USING btree (nombre_corto varchar_pattern_ops);


--
-- TOC entry 3151 (class 1259 OID 25417)
-- Name: carreras_periodos_cursado_nombre_61a4da87_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carreras_periodos_cursado_nombre_61a4da87_like ON public.carreras_periodos_cursado USING btree (nombre text_pattern_ops);


--
-- TOC entry 3150 (class 1259 OID 25439)
-- Name: carreras_tipo_id_1d9aa14d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carreras_tipo_id_1d9aa14d ON public.carreras USING btree (tipo_id);


--
-- TOC entry 3156 (class 1259 OID 25418)
-- Name: carreras_tipos_nombre_1bd80e8f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carreras_tipos_nombre_1bd80e8f_like ON public.carreras_tipos USING btree (nombre text_pattern_ops);


--
-- TOC entry 3137 (class 1259 OID 25345)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3140 (class 1259 OID 25346)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3198 (class 1259 OID 25575)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3201 (class 1259 OID 25574)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3178 (class 1259 OID 25544)
-- Name: facultad_localidad_id_b851c0c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX facultad_localidad_id_b851c0c5 ON public.facultad USING btree (localidad_id);


--
-- TOC entry 3179 (class 1259 OID 25543)
-- Name: facultad_nombre_2634b012_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX facultad_nombre_2634b012_like ON public.facultad USING btree (nombre text_pattern_ops);


--
-- TOC entry 3184 (class 1259 OID 25565)
-- Name: facultad_universidad_id_c5bf0de9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX facultad_universidad_id_c5bf0de9 ON public.facultad USING btree (universidad_id);


--
-- TOC entry 3174 (class 1259 OID 25492)
-- Name: localidades_pais_id_d3b2f5f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX localidades_pais_id_d3b2f5f9 ON public.localidades USING btree (pais_id);


--
-- TOC entry 3177 (class 1259 OID 25493)
-- Name: localidades_provincia_id_0bb33e1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX localidades_provincia_id_0bb33e1a ON public.localidades USING btree (provincia_id);


--
-- TOC entry 3161 (class 1259 OID 25436)
-- Name: materias_anio_id_b0b09271; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materias_anio_id_b0b09271 ON public.materias USING btree (anio_id);


--
-- TOC entry 3162 (class 1259 OID 25437)
-- Name: materias_carrera_id_d0bce174; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materias_carrera_id_d0bce174 ON public.materias USING btree (carrera_id);


--
-- TOC entry 3163 (class 1259 OID 25438)
-- Name: materias_periodo_id_819cdf77; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materias_periodo_id_819cdf77 ON public.materias USING btree (periodo_id);


--
-- TOC entry 3212 (class 1259 OID 25652)
-- Name: materias_tipos_comisiones_nombre_ec896dcd_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX materias_tipos_comisiones_nombre_ec896dcd_like ON public.materias_tipos_comisiones USING btree (nombre text_pattern_ops);


--
-- TOC entry 3166 (class 1259 OID 25475)
-- Name: paises_nombre_07bcedcc_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX paises_nombre_07bcedcc_like ON public.paises USING btree (nombre text_pattern_ops);


--
-- TOC entry 3233 (class 1259 OID 25858)
-- Name: plataformas_nombre_4ac8b448_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plataformas_nombre_4ac8b448_like ON public.plataformas USING btree (nombre varchar_pattern_ops);


--
-- TOC entry 3240 (class 1259 OID 25869)
-- Name: plataformas_salas_virtuales_nombre_1ce75ad8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plataformas_salas_virtuales_nombre_1ce75ad8_like ON public.cuentas_salas_virtuales USING btree (nombre text_pattern_ops);


--
-- TOC entry 3245 (class 1259 OID 25871)
-- Name: plataformas_salas_virtuales_plataforma_id_8211ce30; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plataformas_salas_virtuales_plataforma_id_8211ce30 ON public.cuentas_salas_virtuales USING btree (plataforma_id);


--
-- TOC entry 3246 (class 1259 OID 25872)
-- Name: plataformas_salas_virtuales_sede_id_25b9a825; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX plataformas_salas_virtuales_sede_id_25b9a825 ON public.cuentas_salas_virtuales USING btree (sede_id);


--
-- TOC entry 3171 (class 1259 OID 25481)
-- Name: provincias_pais_id_03cbdd0b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX provincias_pais_id_03cbdd0b ON public.provincias USING btree (pais_id);


--
-- TOC entry 3191 (class 1259 OID 25563)
-- Name: sedes_facultad_id_1d390f56; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sedes_facultad_id_1d390f56 ON public.sedes USING btree (facultad_id);


--
-- TOC entry 3192 (class 1259 OID 25564)
-- Name: sedes_localidad_id_7161dd22; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sedes_localidad_id_7161dd22 ON public.sedes USING btree (localidad_id);


--
-- TOC entry 3193 (class 1259 OID 25562)
-- Name: sedes_nombre_07272f94_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sedes_nombre_07272f94_like ON public.sedes USING btree (nombre text_pattern_ops);


--
-- TOC entry 3217 (class 1259 OID 25724)
-- Name: solicitudes_carrera_id_5d7bae19; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitudes_carrera_id_5d7bae19 ON public.reservas_salas_virtuales USING btree (carrera_id);


--
-- TOC entry 3218 (class 1259 OID 25746)
-- Name: solicitudes_comision_id_4780d90b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitudes_comision_id_4780d90b ON public.reservas_salas_virtuales USING btree (comision_id);


--
-- TOC entry 3219 (class 1259 OID 25725)
-- Name: solicitudes_materia_id_b0d11baa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitudes_materia_id_b0d11baa ON public.reservas_salas_virtuales USING btree (materia_id);


--
-- TOC entry 3220 (class 1259 OID 25726)
-- Name: solicitudes_motivo_id_5b0fef2a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitudes_motivo_id_5b0fef2a ON public.reservas_salas_virtuales USING btree (motivo_id);


--
-- TOC entry 3202 (class 1259 OID 25602)
-- Name: solicitudes_motivos_nombre_cdb0fee4_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitudes_motivos_nombre_cdb0fee4_like ON public.solicitudes_motivos USING btree (nombre text_pattern_ops);


--
-- TOC entry 3223 (class 1259 OID 26005)
-- Name: solicitudes_salas_virtuales_cuenta_asociada_id_a2b010f4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitudes_salas_virtuales_cuenta_asociada_id_a2b010f4 ON public.reservas_salas_virtuales USING btree (cuenta_asociada_id);


--
-- TOC entry 3224 (class 1259 OID 25727)
-- Name: solicitudes_sede_id_e8ed7336; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitudes_sede_id_e8ed7336 ON public.reservas_salas_virtuales USING btree (sede_id);


--
-- TOC entry 3207 (class 1259 OID 25603)
-- Name: solicitudes_tipos_nombre_bda24089_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX solicitudes_tipos_nombre_bda24089_like ON public.solicitudes_tipos USING btree (nombre text_pattern_ops);


--
-- TOC entry 3185 (class 1259 OID 25551)
-- Name: universidad_localidad_id_10840aea; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX universidad_localidad_id_10840aea ON public.universidad USING btree (localidad_id);


--
-- TOC entry 3186 (class 1259 OID 25550)
-- Name: universidad_nombre_794834d7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX universidad_nombre_794834d7_like ON public.universidad USING btree (nombre text_pattern_ops);


--
-- TOC entry 3247 (class 1259 OID 25951)
-- Name: usuarios_tipos_nombre_aa169b43_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuarios_tipos_nombre_aa169b43_like ON public.usuarios_tipos USING btree (nombre text_pattern_ops);


--
-- TOC entry 3125 (class 1259 OID 25308)
-- Name: usuarios_usuarios_groups_group_id_1e265f46; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuarios_usuarios_groups_group_id_1e265f46 ON public.usuarios_usuarios_groups USING btree (group_id);


--
-- TOC entry 3128 (class 1259 OID 25307)
-- Name: usuarios_usuarios_groups_usuarios_id_65c166be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuarios_usuarios_groups_usuarios_id_65c166be ON public.usuarios_usuarios_groups USING btree (usuarios_id);


--
-- TOC entry 3120 (class 1259 OID 25734)
-- Name: usuarios_usuarios_sedes_id_79f5e365; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuarios_usuarios_sedes_id_79f5e365 ON public.usuarios_usuarios USING btree (sede_id);


--
-- TOC entry 3121 (class 1259 OID 25958)
-- Name: usuarios_usuarios_tipo_id_df652c50; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuarios_usuarios_tipo_id_df652c50 ON public.usuarios_usuarios USING btree (tipo_id);


--
-- TOC entry 3133 (class 1259 OID 25322)
-- Name: usuarios_usuarios_user_permissions_permission_id_394f07a6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuarios_usuarios_user_permissions_permission_id_394f07a6 ON public.usuarios_usuarios_user_permissions USING btree (permission_id);


--
-- TOC entry 3136 (class 1259 OID 25321)
-- Name: usuarios_usuarios_user_permissions_usuarios_id_d860a7b5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuarios_usuarios_user_permissions_usuarios_id_d860a7b5 ON public.usuarios_usuarios_user_permissions USING btree (usuarios_id);


--
-- TOC entry 3122 (class 1259 OID 25294)
-- Name: usuarios_usuarios_username_94c55da1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX usuarios_usuarios_username_94c55da1_like ON public.usuarios_usuarios USING btree (username varchar_pattern_ops);


--
-- TOC entry 3254 (class 2606 OID 25255)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3253 (class 2606 OID 25250)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3252 (class 2606 OID 25241)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3281 (class 2606 OID 25827)
-- Name: calendario_turnos_examen calendario_turnos_ex_anio_id_b0b7bc08_fk_calendari; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendario_turnos_examen
    ADD CONSTRAINT calendario_turnos_ex_anio_id_b0b7bc08_fk_calendari FOREIGN KEY (anio_id) REFERENCES public.calendario_academico(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3263 (class 2606 OID 25411)
-- Name: carreras carreras_tipo_id_1d9aa14d_fk_carreras_tipos_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_tipo_id_1d9aa14d_fk_carreras_tipos_id FOREIGN KEY (tipo_id) REFERENCES public.carreras_tipos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3261 (class 2606 OID 25335)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3262 (class 2606 OID 25340)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id FOREIGN KEY (user_id) REFERENCES public.usuarios_usuarios(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3271 (class 2606 OID 25538)
-- Name: facultad facultad_localidad_id_b851c0c5_fk_localidades_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_localidad_id_b851c0c5_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3270 (class 2606 OID 25533)
-- Name: facultad facultad_universidad_id_c5bf0de9_fk_universidad_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_universidad_id_c5bf0de9_fk_universidad_id FOREIGN KEY (universidad_id) REFERENCES public.universidad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3268 (class 2606 OID 25482)
-- Name: localidades localidades_pais_id_d3b2f5f9_fk_paises_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_pais_id_d3b2f5f9_fk_paises_id FOREIGN KEY (pais_id) REFERENCES public.paises(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3269 (class 2606 OID 25487)
-- Name: localidades localidades_provincia_id_0bb33e1a_fk_provincias_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_provincia_id_0bb33e1a_fk_provincias_id FOREIGN KEY (provincia_id) REFERENCES public.provincias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3264 (class 2606 OID 25419)
-- Name: materias materias_anio_id_b0b09271_fk_carreras_anios_cursado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_anio_id_b0b09271_fk_carreras_anios_cursado_id FOREIGN KEY (anio_id) REFERENCES public.carreras_anios_cursado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3265 (class 2606 OID 25424)
-- Name: materias materias_carrera_id_d0bce174_fk_carreras_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_carrera_id_d0bce174_fk_carreras_id FOREIGN KEY (carrera_id) REFERENCES public.carreras(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3266 (class 2606 OID 25429)
-- Name: materias materias_periodo_id_819cdf77_fk_carreras_periodos_cursado_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_periodo_id_819cdf77_fk_carreras_periodos_cursado_id FOREIGN KEY (periodo_id) REFERENCES public.carreras_periodos_cursado(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3282 (class 2606 OID 25859)
-- Name: cuentas_salas_virtuales plataformas_salas_vi_plataforma_id_8211ce30_fk_plataform; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_salas_virtuales
    ADD CONSTRAINT plataformas_salas_vi_plataforma_id_8211ce30_fk_plataform FOREIGN KEY (plataforma_id) REFERENCES public.plataformas(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3283 (class 2606 OID 25864)
-- Name: cuentas_salas_virtuales plataformas_salas_virtuales_sede_id_25b9a825_fk_sedes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas_salas_virtuales
    ADD CONSTRAINT plataformas_salas_virtuales_sede_id_25b9a825_fk_sedes_id FOREIGN KEY (sede_id) REFERENCES public.sedes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3267 (class 2606 OID 25476)
-- Name: provincias provincias_pais_id_03cbdd0b_fk_paises_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pais_id_03cbdd0b_fk_paises_id FOREIGN KEY (pais_id) REFERENCES public.paises(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3273 (class 2606 OID 25552)
-- Name: sedes sedes_facultad_id_1d390f56_fk_facultad_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_facultad_id_1d390f56_fk_facultad_id FOREIGN KEY (facultad_id) REFERENCES public.facultad(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3274 (class 2606 OID 25557)
-- Name: sedes sedes_localidad_id_7161dd22_fk_localidades_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_localidad_id_7161dd22_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3277 (class 2606 OID 25783)
-- Name: reservas_salas_virtuales solicitudes_carrera_id_5d7bae19_fk_carreras_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_salas_virtuales
    ADD CONSTRAINT solicitudes_carrera_id_5d7bae19_fk_carreras_id FOREIGN KEY (carrera_id) REFERENCES public.carreras(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3278 (class 2606 OID 25789)
-- Name: reservas_salas_virtuales solicitudes_comision_id_4780d90b_fk_materias_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_salas_virtuales
    ADD CONSTRAINT solicitudes_comision_id_4780d90b_fk_materias_ FOREIGN KEY (comision_id) REFERENCES public.materias_tipos_comisiones(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3279 (class 2606 OID 25795)
-- Name: reservas_salas_virtuales solicitudes_materia_id_b0d11baa_fk_materias_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_salas_virtuales
    ADD CONSTRAINT solicitudes_materia_id_b0d11baa_fk_materias_id FOREIGN KEY (materia_id) REFERENCES public.materias(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3275 (class 2606 OID 25698)
-- Name: reservas_salas_virtuales solicitudes_motivo_id_5b0fef2a_fk_solicitudes_motivos_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_salas_virtuales
    ADD CONSTRAINT solicitudes_motivo_id_5b0fef2a_fk_solicitudes_motivos_id FOREIGN KEY (motivo_id) REFERENCES public.solicitudes_motivos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3280 (class 2606 OID 26006)
-- Name: reservas_salas_virtuales solicitudes_salas_vi_cuenta_asociada_id_a2b010f4_fk_cuentas_s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_salas_virtuales
    ADD CONSTRAINT solicitudes_salas_vi_cuenta_asociada_id_a2b010f4_fk_cuentas_s FOREIGN KEY (cuenta_asociada_id) REFERENCES public.cuentas_salas_virtuales(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3276 (class 2606 OID 25706)
-- Name: reservas_salas_virtuales solicitudes_sede_id_e8ed7336_fk_sedes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas_salas_virtuales
    ADD CONSTRAINT solicitudes_sede_id_e8ed7336_fk_sedes_id FOREIGN KEY (sede_id) REFERENCES public.sedes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3272 (class 2606 OID 25545)
-- Name: universidad universidad_localidad_id_10840aea_fk_localidades_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_localidad_id_10840aea_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3257 (class 2606 OID 25297)
-- Name: usuarios_usuarios_groups usuarios_usuarios_gr_usuarios_id_65c166be_fk_usuarios_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_groups
    ADD CONSTRAINT usuarios_usuarios_gr_usuarios_id_65c166be_fk_usuarios_ FOREIGN KEY (usuarios_id) REFERENCES public.usuarios_usuarios(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3258 (class 2606 OID 25302)
-- Name: usuarios_usuarios_groups usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_groups
    ADD CONSTRAINT usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3255 (class 2606 OID 25735)
-- Name: usuarios_usuarios usuarios_usuarios_sede_id_f08e8ecd_fk_sedes_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios
    ADD CONSTRAINT usuarios_usuarios_sede_id_f08e8ecd_fk_sedes_id FOREIGN KEY (sede_id) REFERENCES public.sedes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3256 (class 2606 OID 25953)
-- Name: usuarios_usuarios usuarios_usuarios_tipo_id_df652c50_fk_usuarios_tipos_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios
    ADD CONSTRAINT usuarios_usuarios_tipo_id_df652c50_fk_usuarios_tipos_id FOREIGN KEY (tipo_id) REFERENCES public.usuarios_tipos(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3260 (class 2606 OID 25316)
-- Name: usuarios_usuarios_user_permissions usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_user_permissions
    ADD CONSTRAINT usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3259 (class 2606 OID 25311)
-- Name: usuarios_usuarios_user_permissions usuarios_usuarios_us_usuarios_id_d860a7b5_fk_usuarios_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_usuarios_user_permissions
    ADD CONSTRAINT usuarios_usuarios_us_usuarios_id_d860a7b5_fk_usuarios_ FOREIGN KEY (usuarios_id) REFERENCES public.usuarios_usuarios(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-12-13 20:39:46 -03

--
-- PostgreSQL database dump complete
--

