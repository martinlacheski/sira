PGDMP     .    /            	    x            sira     12.4 (Ubuntu 12.4-1.pgdg20.04+1)     12.4 (Ubuntu 12.4-1.pgdg20.04+1) �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    22798    sira    DATABASE     v   CREATE DATABASE sira WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_AR.UTF-8' LC_CTYPE = 'es_AR.UTF-8';
    DROP DATABASE sira;
                postgres    false            �            1259    23524    carreras    TABLE       CREATE TABLE public.carreras (
    id integer NOT NULL,
    nombre_corto character varying(30) NOT NULL,
    nombre text NOT NULL,
    duracion integer NOT NULL,
    facultad_id integer NOT NULL,
    tipo_id integer NOT NULL,
    plan character varying(20)
);
    DROP TABLE public.carreras;
       public         heap    postgres    false            �            1259    23522    Carreras_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Carreras_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Carreras_id_seq";
       public          postgres    false    240            	           0    0    Carreras_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Carreras_id_seq" OWNED BY public.carreras.id;
          public          postgres    false    239            �            1259    22830 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    22828    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            
           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    22840    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    22838    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211                       0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    22822    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    22820    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207                       0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    23610    carreras_anios_cursado    TABLE     e   CREATE TABLE public.carreras_anios_cursado (
    id integer NOT NULL,
    nombre integer NOT NULL
);
 *   DROP TABLE public.carreras_anios_cursado;
       public         heap    postgres    false            �            1259    23608    carreras_anios_cursado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.carreras_anios_cursado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.carreras_anios_cursado_id_seq;
       public          postgres    false    242                       0    0    carreras_anios_cursado_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.carreras_anios_cursado_id_seq OWNED BY public.carreras_anios_cursado.id;
          public          postgres    false    241            �            1259    23620    carreras_periodos_cursado    TABLE     e   CREATE TABLE public.carreras_periodos_cursado (
    id integer NOT NULL,
    nombre text NOT NULL
);
 -   DROP TABLE public.carreras_periodos_cursado;
       public         heap    postgres    false            �            1259    23618     carreras_periodos_cursado_id_seq    SEQUENCE     �   CREATE SEQUENCE public.carreras_periodos_cursado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.carreras_periodos_cursado_id_seq;
       public          postgres    false    244                       0    0     carreras_periodos_cursado_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.carreras_periodos_cursado_id_seq OWNED BY public.carreras_periodos_cursado.id;
          public          postgres    false    243            �            1259    23511    carreras_tipos    TABLE     Z   CREATE TABLE public.carreras_tipos (
    id integer NOT NULL,
    nombre text NOT NULL
);
 "   DROP TABLE public.carreras_tipos;
       public         heap    postgres    false            �            1259    23509    carreras_tipos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.carreras_tipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.carreras_tipos_id_seq;
       public          postgres    false    238                       0    0    carreras_tipos_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.carreras_tipos_id_seq OWNED BY public.carreras_tipos.id;
          public          postgres    false    237            �            1259    22932    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    22930    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219                       0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218            �            1259    22812    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    22810    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205                       0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    22801    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    22799    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203                       0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    23262    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    23403    facultad    TABLE     �   CREATE TABLE public.facultad (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    web text,
    universidad_id integer NOT NULL,
    localidad_id integer NOT NULL
);
    DROP TABLE public.facultad;
       public         heap    postgres    false            �            1259    23401    facultad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.facultad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.facultad_id_seq;
       public          postgres    false    232                       0    0    facultad_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.facultad_id_seq OWNED BY public.facultad.id;
          public          postgres    false    231            �            1259    23326    localidades    TABLE     �   CREATE TABLE public.localidades (
    id integer NOT NULL,
    nombre text NOT NULL,
    codigo_postal text,
    provincia_id integer NOT NULL,
    pais_id integer NOT NULL
);
    DROP TABLE public.localidades;
       public         heap    postgres    false            �            1259    23324    localidades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.localidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.localidades_id_seq;
       public          postgres    false    230                       0    0    localidades_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.localidades_id_seq OWNED BY public.localidades.id;
          public          postgres    false    229            �            1259    23302    paises    TABLE     R   CREATE TABLE public.paises (
    id integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.paises;
       public         heap    postgres    false            �            1259    23300    paises_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.paises_id_seq;
       public          postgres    false    226                       0    0    paises_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.paises_id_seq OWNED BY public.paises.id;
          public          postgres    false    225            �            1259    23315 
   provincias    TABLE     t   CREATE TABLE public.provincias (
    id integer NOT NULL,
    nombre text NOT NULL,
    pais_id integer NOT NULL
);
    DROP TABLE public.provincias;
       public         heap    postgres    false            �            1259    23313    provincias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provincias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.provincias_id_seq;
       public          postgres    false    228                       0    0    provincias_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.provincias_id_seq OWNED BY public.provincias.id;
          public          postgres    false    227            �            1259    23429    sedes    TABLE     �   CREATE TABLE public.sedes (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    facultad_id integer NOT NULL,
    localidad_id integer NOT NULL
);
    DROP TABLE public.sedes;
       public         heap    postgres    false            �            1259    23427    sedes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sedes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sedes_id_seq;
       public          postgres    false    236                       0    0    sedes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sedes_id_seq OWNED BY public.sedes.id;
          public          postgres    false    235            �            1259    23274    solicitudes_motivos    TABLE     _   CREATE TABLE public.solicitudes_motivos (
    id integer NOT NULL,
    nombre text NOT NULL
);
 '   DROP TABLE public.solicitudes_motivos;
       public         heap    postgres    false            �            1259    23272    solicitudes_motivos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.solicitudes_motivos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.solicitudes_motivos_id_seq;
       public          postgres    false    222                       0    0    solicitudes_motivos_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.solicitudes_motivos_id_seq OWNED BY public.solicitudes_motivos.id;
          public          postgres    false    221            �            1259    23287    solicitudes_tipos    TABLE     ]   CREATE TABLE public.solicitudes_tipos (
    id integer NOT NULL,
    nombre text NOT NULL
);
 %   DROP TABLE public.solicitudes_tipos;
       public         heap    postgres    false            �            1259    23285    solicitudes_tipos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.solicitudes_tipos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.solicitudes_tipos_id_seq;
       public          postgres    false    224                       0    0    solicitudes_tipos_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.solicitudes_tipos_id_seq OWNED BY public.solicitudes_tipos.id;
          public          postgres    false    223            �            1259    23416    universidad    TABLE     �   CREATE TABLE public.universidad (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    web text,
    localidad_id integer NOT NULL
);
    DROP TABLE public.universidad;
       public         heap    postgres    false            �            1259    23414    universidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.universidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.universidad_id_seq;
       public          postgres    false    234                       0    0    universidad_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.universidad_id_seq OWNED BY public.universidad.id;
          public          postgres    false    233            �            1259    22874    usuarios_usuarios    TABLE     :  CREATE TABLE public.usuarios_usuarios (
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
    dni character varying(8),
    telefono text
);
 %   DROP TABLE public.usuarios_usuarios;
       public         heap    postgres    false            �            1259    22887    usuarios_usuarios_groups    TABLE     �   CREATE TABLE public.usuarios_usuarios_groups (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    group_id integer NOT NULL
);
 ,   DROP TABLE public.usuarios_usuarios_groups;
       public         heap    postgres    false            �            1259    22885    usuarios_usuarios_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_usuarios_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.usuarios_usuarios_groups_id_seq;
       public          postgres    false    215                       0    0    usuarios_usuarios_groups_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.usuarios_usuarios_groups_id_seq OWNED BY public.usuarios_usuarios_groups.id;
          public          postgres    false    214            �            1259    22872    usuarios_usuarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.usuarios_usuarios_id_seq;
       public          postgres    false    213                       0    0    usuarios_usuarios_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.usuarios_usuarios_id_seq OWNED BY public.usuarios_usuarios.id;
          public          postgres    false    212            �            1259    22895 "   usuarios_usuarios_user_permissions    TABLE     �   CREATE TABLE public.usuarios_usuarios_user_permissions (
    id integer NOT NULL,
    usuarios_id integer NOT NULL,
    permission_id integer NOT NULL
);
 6   DROP TABLE public.usuarios_usuarios_user_permissions;
       public         heap    postgres    false            �            1259    22893 )   usuarios_usuarios_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_usuarios_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.usuarios_usuarios_user_permissions_id_seq;
       public          postgres    false    217                       0    0 )   usuarios_usuarios_user_permissions_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.usuarios_usuarios_user_permissions_id_seq OWNED BY public.usuarios_usuarios_user_permissions.id;
          public          postgres    false    216            �           2604    23641    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �           2604    23642    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            �           2604    23643    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �           2604    23644    carreras id    DEFAULT     l   ALTER TABLE ONLY public.carreras ALTER COLUMN id SET DEFAULT nextval('public."Carreras_id_seq"'::regclass);
 :   ALTER TABLE public.carreras ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239    240            �           2604    23645    carreras_anios_cursado id    DEFAULT     �   ALTER TABLE ONLY public.carreras_anios_cursado ALTER COLUMN id SET DEFAULT nextval('public.carreras_anios_cursado_id_seq'::regclass);
 H   ALTER TABLE public.carreras_anios_cursado ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    23646    carreras_periodos_cursado id    DEFAULT     �   ALTER TABLE ONLY public.carreras_periodos_cursado ALTER COLUMN id SET DEFAULT nextval('public.carreras_periodos_cursado_id_seq'::regclass);
 K   ALTER TABLE public.carreras_periodos_cursado ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244            �           2604    23648    carreras_tipos id    DEFAULT     v   ALTER TABLE ONLY public.carreras_tipos ALTER COLUMN id SET DEFAULT nextval('public.carreras_tipos_id_seq'::regclass);
 @   ALTER TABLE public.carreras_tipos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237    238            �           2604    23649    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    23650    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �           2604    23651    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    23652    facultad id    DEFAULT     j   ALTER TABLE ONLY public.facultad ALTER COLUMN id SET DEFAULT nextval('public.facultad_id_seq'::regclass);
 :   ALTER TABLE public.facultad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    23653    localidades id    DEFAULT     p   ALTER TABLE ONLY public.localidades ALTER COLUMN id SET DEFAULT nextval('public.localidades_id_seq'::regclass);
 =   ALTER TABLE public.localidades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    23655 	   paises id    DEFAULT     f   ALTER TABLE ONLY public.paises ALTER COLUMN id SET DEFAULT nextval('public.paises_id_seq'::regclass);
 8   ALTER TABLE public.paises ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    23656    provincias id    DEFAULT     n   ALTER TABLE ONLY public.provincias ALTER COLUMN id SET DEFAULT nextval('public.provincias_id_seq'::regclass);
 <   ALTER TABLE public.provincias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    23657    sedes id    DEFAULT     d   ALTER TABLE ONLY public.sedes ALTER COLUMN id SET DEFAULT nextval('public.sedes_id_seq'::regclass);
 7   ALTER TABLE public.sedes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    235    236            �           2604    23658    solicitudes_motivos id    DEFAULT     �   ALTER TABLE ONLY public.solicitudes_motivos ALTER COLUMN id SET DEFAULT nextval('public.solicitudes_motivos_id_seq'::regclass);
 E   ALTER TABLE public.solicitudes_motivos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    23659    solicitudes_tipos id    DEFAULT     |   ALTER TABLE ONLY public.solicitudes_tipos ALTER COLUMN id SET DEFAULT nextval('public.solicitudes_tipos_id_seq'::regclass);
 C   ALTER TABLE public.solicitudes_tipos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    23660    universidad id    DEFAULT     p   ALTER TABLE ONLY public.universidad ALTER COLUMN id SET DEFAULT nextval('public.universidad_id_seq'::regclass);
 =   ALTER TABLE public.universidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    233    234            �           2604    23661    usuarios_usuarios id    DEFAULT     |   ALTER TABLE ONLY public.usuarios_usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_usuarios_id_seq'::regclass);
 C   ALTER TABLE public.usuarios_usuarios ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    23662    usuarios_usuarios_groups id    DEFAULT     �   ALTER TABLE ONLY public.usuarios_usuarios_groups ALTER COLUMN id SET DEFAULT nextval('public.usuarios_usuarios_groups_id_seq'::regclass);
 J   ALTER TABLE public.usuarios_usuarios_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    23663 %   usuarios_usuarios_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.usuarios_usuarios_user_permissions_id_seq'::regclass);
 T   ALTER TABLE public.usuarios_usuarios_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �          0    22830 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   <      �          0    22840    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   o      �          0    22822    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207         �          0    23524    carreras 
   TABLE DATA           b   COPY public.carreras (id, nombre_corto, nombre, duracion, facultad_id, tipo_id, plan) FROM stdin;
    public          postgres    false    240   �"                 0    23610    carreras_anios_cursado 
   TABLE DATA           <   COPY public.carreras_anios_cursado (id, nombre) FROM stdin;
    public          postgres    false    242   �#                0    23620    carreras_periodos_cursado 
   TABLE DATA           ?   COPY public.carreras_periodos_cursado (id, nombre) FROM stdin;
    public          postgres    false    244   �#      �          0    23511    carreras_tipos 
   TABLE DATA           4   COPY public.carreras_tipos (id, nombre) FROM stdin;
    public          postgres    false    238   $      �          0    22932    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   I$      �          0    22812    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   �$      �          0    22801    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   �%      �          0    23262    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    220   �*      �          0    23403    facultad 
   TABLE DATA           g   COPY public.facultad (id, nombre, direccion, telefonos, web, universidad_id, localidad_id) FROM stdin;
    public          postgres    false    232   �+      �          0    23326    localidades 
   TABLE DATA           W   COPY public.localidades (id, nombre, codigo_postal, provincia_id, pais_id) FROM stdin;
    public          postgres    false    230   Z,      �          0    23302    paises 
   TABLE DATA           ,   COPY public.paises (id, nombre) FROM stdin;
    public          postgres    false    226   �,      �          0    23315 
   provincias 
   TABLE DATA           9   COPY public.provincias (id, nombre, pais_id) FROM stdin;
    public          postgres    false    228   2-      �          0    23429    sedes 
   TABLE DATA           \   COPY public.sedes (id, nombre, direccion, telefonos, facultad_id, localidad_id) FROM stdin;
    public          postgres    false    236   �-      �          0    23274    solicitudes_motivos 
   TABLE DATA           9   COPY public.solicitudes_motivos (id, nombre) FROM stdin;
    public          postgres    false    222   �.      �          0    23287    solicitudes_tipos 
   TABLE DATA           7   COPY public.solicitudes_tipos (id, nombre) FROM stdin;
    public          postgres    false    224   /      �          0    23416    universidad 
   TABLE DATA           Z   COPY public.universidad (id, nombre, direccion, telefonos, web, localidad_id) FROM stdin;
    public          postgres    false    234   b/      �          0    22874    usuarios_usuarios 
   TABLE DATA           �   COPY public.usuarios_usuarios (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, legajo, dni, telefono) FROM stdin;
    public          postgres    false    213   �/      �          0    22887    usuarios_usuarios_groups 
   TABLE DATA           M   COPY public.usuarios_usuarios_groups (id, usuarios_id, group_id) FROM stdin;
    public          postgres    false    215   �1      �          0    22895 "   usuarios_usuarios_user_permissions 
   TABLE DATA           \   COPY public.usuarios_usuarios_user_permissions (id, usuarios_id, permission_id) FROM stdin;
    public          postgres    false    217   �1                 0    0    Carreras_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Carreras_id_seq"', 5, true);
          public          postgres    false    239                       0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 2, true);
          public          postgres    false    208                        0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 38, true);
          public          postgres    false    210            !           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);
          public          postgres    false    206            "           0    0    carreras_anios_cursado_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.carreras_anios_cursado_id_seq', 7, true);
          public          postgres    false    241            #           0    0     carreras_periodos_cursado_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.carreras_periodos_cursado_id_seq', 5, true);
          public          postgres    false    243            $           0    0    carreras_tipos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.carreras_tipos_id_seq', 5, true);
          public          postgres    false    237            %           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3, true);
          public          postgres    false    218            &           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);
          public          postgres    false    204            '           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 69, true);
          public          postgres    false    202            (           0    0    facultad_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.facultad_id_seq', 1, true);
          public          postgres    false    231            )           0    0    localidades_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.localidades_id_seq', 9, true);
          public          postgres    false    229            *           0    0    paises_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.paises_id_seq', 4, true);
          public          postgres    false    225            +           0    0    provincias_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provincias_id_seq', 4, true);
          public          postgres    false    227            ,           0    0    sedes_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sedes_id_seq', 7, true);
          public          postgres    false    235            -           0    0    solicitudes_motivos_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.solicitudes_motivos_id_seq', 3, true);
          public          postgres    false    221            .           0    0    solicitudes_tipos_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.solicitudes_tipos_id_seq', 3, true);
          public          postgres    false    223            /           0    0    universidad_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.universidad_id_seq', 1, true);
          public          postgres    false    233            0           0    0    usuarios_usuarios_groups_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.usuarios_usuarios_groups_id_seq', 2, true);
          public          postgres    false    214            1           0    0    usuarios_usuarios_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.usuarios_usuarios_id_seq', 3, true);
          public          postgres    false    212            2           0    0 )   usuarios_usuarios_user_permissions_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.usuarios_usuarios_user_permissions_id_seq', 1, false);
          public          postgres    false    216            :           2606    23536 "   carreras Carreras_nombre_corto_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT "Carreras_nombre_corto_key" UNIQUE (nombre_corto);
 N   ALTER TABLE ONLY public.carreras DROP CONSTRAINT "Carreras_nombre_corto_key";
       public            postgres    false    240            <           2606    23532    carreras Carreras_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT "Carreras_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.carreras DROP CONSTRAINT "Carreras_pkey";
       public            postgres    false    240            �           2606    22870    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            �           2606    22856 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            �           2606    22845 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            �           2606    22835    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            �           2606    22847 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            �           2606    22827 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            ?           2606    23617 @   carreras_anios_cursado carreras_anios_cursado_anio_e84186b3_uniq 
   CONSTRAINT     }   ALTER TABLE ONLY public.carreras_anios_cursado
    ADD CONSTRAINT carreras_anios_cursado_anio_e84186b3_uniq UNIQUE (nombre);
 j   ALTER TABLE ONLY public.carreras_anios_cursado DROP CONSTRAINT carreras_anios_cursado_anio_e84186b3_uniq;
       public            postgres    false    242            A           2606    23615 2   carreras_anios_cursado carreras_anios_cursado_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.carreras_anios_cursado
    ADD CONSTRAINT carreras_anios_cursado_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.carreras_anios_cursado DROP CONSTRAINT carreras_anios_cursado_pkey;
       public            postgres    false    242            D           2606    23630 ?   carreras_periodos_cursado carreras_periodos_cursado_periodo_key 
   CONSTRAINT     |   ALTER TABLE ONLY public.carreras_periodos_cursado
    ADD CONSTRAINT carreras_periodos_cursado_periodo_key UNIQUE (nombre);
 i   ALTER TABLE ONLY public.carreras_periodos_cursado DROP CONSTRAINT carreras_periodos_cursado_periodo_key;
       public            postgres    false    244            F           2606    23628 8   carreras_periodos_cursado carreras_periodos_cursado_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.carreras_periodos_cursado
    ADD CONSTRAINT carreras_periodos_cursado_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.carreras_periodos_cursado DROP CONSTRAINT carreras_periodos_cursado_pkey;
       public            postgres    false    244            4           2606    23521 (   carreras_tipos carreras_tipos_nombre_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.carreras_tipos
    ADD CONSTRAINT carreras_tipos_nombre_key UNIQUE (nombre);
 R   ALTER TABLE ONLY public.carreras_tipos DROP CONSTRAINT carreras_tipos_nombre_key;
       public            postgres    false    238            6           2606    23519 "   carreras_tipos carreras_tipos_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.carreras_tipos
    ADD CONSTRAINT carreras_tipos_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.carreras_tipos DROP CONSTRAINT carreras_tipos_pkey;
       public            postgres    false    238                       2606    22941 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            �           2606    22819 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            �           2606    22817 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            �           2606    22809 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203                       2606    23269 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    220            !           2606    23413    facultad facultad_nombre_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_nombre_key UNIQUE (nombre);
 F   ALTER TABLE ONLY public.facultad DROP CONSTRAINT facultad_nombre_key;
       public            postgres    false    232            #           2606    23411    facultad facultad_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.facultad DROP CONSTRAINT facultad_pkey;
       public            postgres    false    232                       2606    23334    localidades localidades_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.localidades DROP CONSTRAINT localidades_pkey;
       public            postgres    false    230                       2606    23312    paises paises_nombre_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_nombre_key UNIQUE (nombre);
 B   ALTER TABLE ONLY public.paises DROP CONSTRAINT paises_nombre_key;
       public            postgres    false    226                       2606    23310    paises paises_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.paises DROP CONSTRAINT paises_pkey;
       public            postgres    false    226                       2606    23323    provincias provincias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.provincias DROP CONSTRAINT provincias_pkey;
       public            postgres    false    228            /           2606    23439    sedes sedes_nombre_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_nombre_key UNIQUE (nombre);
 @   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_nombre_key;
       public            postgres    false    236            1           2606    23437    sedes sedes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_pkey;
       public            postgres    false    236            
           2606    23284 2   solicitudes_motivos solicitudes_motivos_nombre_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.solicitudes_motivos
    ADD CONSTRAINT solicitudes_motivos_nombre_key UNIQUE (nombre);
 \   ALTER TABLE ONLY public.solicitudes_motivos DROP CONSTRAINT solicitudes_motivos_nombre_key;
       public            postgres    false    222                       2606    23282 ,   solicitudes_motivos solicitudes_motivos_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.solicitudes_motivos
    ADD CONSTRAINT solicitudes_motivos_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.solicitudes_motivos DROP CONSTRAINT solicitudes_motivos_pkey;
       public            postgres    false    222                       2606    23297 .   solicitudes_tipos solicitudes_tipos_nombre_key 
   CONSTRAINT     k   ALTER TABLE ONLY public.solicitudes_tipos
    ADD CONSTRAINT solicitudes_tipos_nombre_key UNIQUE (nombre);
 X   ALTER TABLE ONLY public.solicitudes_tipos DROP CONSTRAINT solicitudes_tipos_nombre_key;
       public            postgres    false    224                       2606    23295 (   solicitudes_tipos solicitudes_tipos_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.solicitudes_tipos
    ADD CONSTRAINT solicitudes_tipos_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.solicitudes_tipos DROP CONSTRAINT solicitudes_tipos_pkey;
       public            postgres    false    224            (           2606    23426 "   universidad universidad_nombre_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_nombre_key UNIQUE (nombre);
 L   ALTER TABLE ONLY public.universidad DROP CONSTRAINT universidad_nombre_key;
       public            postgres    false    234            *           2606    23424    universidad universidad_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.universidad DROP CONSTRAINT universidad_pkey;
       public            postgres    false    234            �           2606    22892 6   usuarios_usuarios_groups usuarios_usuarios_groups_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.usuarios_usuarios_groups
    ADD CONSTRAINT usuarios_usuarios_groups_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.usuarios_usuarios_groups DROP CONSTRAINT usuarios_usuarios_groups_pkey;
       public            postgres    false    215            �           2606    22903 T   usuarios_usuarios_groups usuarios_usuarios_groups_usuarios_id_group_id_31056d4d_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_usuarios_groups
    ADD CONSTRAINT usuarios_usuarios_groups_usuarios_id_group_id_31056d4d_uniq UNIQUE (usuarios_id, group_id);
 ~   ALTER TABLE ONLY public.usuarios_usuarios_groups DROP CONSTRAINT usuarios_usuarios_groups_usuarios_id_group_id_31056d4d_uniq;
       public            postgres    false    215    215            �           2606    22882 (   usuarios_usuarios usuarios_usuarios_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.usuarios_usuarios
    ADD CONSTRAINT usuarios_usuarios_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.usuarios_usuarios DROP CONSTRAINT usuarios_usuarios_pkey;
       public            postgres    false    213            �           2606    22917 b   usuarios_usuarios_user_permissions usuarios_usuarios_user_p_usuarios_id_permission_i_1fb72da5_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions
    ADD CONSTRAINT usuarios_usuarios_user_p_usuarios_id_permission_i_1fb72da5_uniq UNIQUE (usuarios_id, permission_id);
 �   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions DROP CONSTRAINT usuarios_usuarios_user_p_usuarios_id_permission_i_1fb72da5_uniq;
       public            postgres    false    217    217            �           2606    22900 J   usuarios_usuarios_user_permissions usuarios_usuarios_user_permissions_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions
    ADD CONSTRAINT usuarios_usuarios_user_permissions_pkey PRIMARY KEY (id);
 t   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions DROP CONSTRAINT usuarios_usuarios_user_permissions_pkey;
       public            postgres    false    217            �           2606    22884 0   usuarios_usuarios usuarios_usuarios_username_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.usuarios_usuarios
    ADD CONSTRAINT usuarios_usuarios_username_key UNIQUE (username);
 Z   ALTER TABLE ONLY public.usuarios_usuarios DROP CONSTRAINT usuarios_usuarios_username_key;
       public            postgres    false    213            7           1259    23550    Carreras_facultad_id_3b0e721e    INDEX     [   CREATE INDEX "Carreras_facultad_id_3b0e721e" ON public.carreras USING btree (facultad_id);
 3   DROP INDEX public."Carreras_facultad_id_3b0e721e";
       public            postgres    false    240            8           1259    23549 #   Carreras_nombre_corto_f8983924_like    INDEX     v   CREATE INDEX "Carreras_nombre_corto_f8983924_like" ON public.carreras USING btree (nombre_corto varchar_pattern_ops);
 9   DROP INDEX public."Carreras_nombre_corto_f8983924_like";
       public            postgres    false    240            =           1259    23551    Carreras_tipo_id_5930e629    INDEX     S   CREATE INDEX "Carreras_tipo_id_5930e629" ON public.carreras USING btree (tipo_id);
 /   DROP INDEX public."Carreras_tipo_id_5930e629";
       public            postgres    false    240            �           1259    22871    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            �           1259    22867 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            �           1259    22868 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            �           1259    22853 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            B           1259    23631 /   carreras_periodos_cursado_periodo_ae2880c8_like    INDEX     �   CREATE INDEX carreras_periodos_cursado_periodo_ae2880c8_like ON public.carreras_periodos_cursado USING btree (nombre text_pattern_ops);
 C   DROP INDEX public.carreras_periodos_cursado_periodo_ae2880c8_like;
       public            postgres    false    244            2           1259    23537 #   carreras_tipos_nombre_1bd80e8f_like    INDEX     q   CREATE INDEX carreras_tipos_nombre_1bd80e8f_like ON public.carreras_tipos USING btree (nombre text_pattern_ops);
 7   DROP INDEX public.carreras_tipos_nombre_1bd80e8f_like;
       public            postgres    false    238                        1259    22952 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219                       1259    22953 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219                       1259    23271 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    220                       1259    23270 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    220                       1259    23491    facultad_localidad_id_b851c0c5    INDEX     [   CREATE INDEX facultad_localidad_id_b851c0c5 ON public.facultad USING btree (localidad_id);
 2   DROP INDEX public.facultad_localidad_id_b851c0c5;
       public            postgres    false    232                       1259    23450    facultad_nombre_2634b012_like    INDEX     e   CREATE INDEX facultad_nombre_2634b012_like ON public.facultad USING btree (nombre text_pattern_ops);
 1   DROP INDEX public.facultad_nombre_2634b012_like;
       public            postgres    false    232            $           1259    23472     facultad_universidad_id_c5bf0de9    INDEX     _   CREATE INDEX facultad_universidad_id_c5bf0de9 ON public.facultad USING btree (universidad_id);
 4   DROP INDEX public.facultad_universidad_id_c5bf0de9;
       public            postgres    false    232                       1259    23399    localidades_pais_id_d3b2f5f9    INDEX     W   CREATE INDEX localidades_pais_id_d3b2f5f9 ON public.localidades USING btree (pais_id);
 0   DROP INDEX public.localidades_pais_id_d3b2f5f9;
       public            postgres    false    230                       1259    23347 !   localidades_provincia_id_0bb33e1a    INDEX     a   CREATE INDEX localidades_provincia_id_0bb33e1a ON public.localidades USING btree (provincia_id);
 5   DROP INDEX public.localidades_provincia_id_0bb33e1a;
       public            postgres    false    230                       1259    23335    paises_nombre_07bcedcc_like    INDEX     a   CREATE INDEX paises_nombre_07bcedcc_like ON public.paises USING btree (nombre text_pattern_ops);
 /   DROP INDEX public.paises_nombre_07bcedcc_like;
       public            postgres    false    226                       1259    23341    provincias_pais_id_03cbdd0b    INDEX     U   CREATE INDEX provincias_pais_id_03cbdd0b ON public.provincias USING btree (pais_id);
 /   DROP INDEX public.provincias_pais_id_03cbdd0b;
       public            postgres    false    228            +           1259    23470    sedes_facultad_id_1d390f56    INDEX     S   CREATE INDEX sedes_facultad_id_1d390f56 ON public.sedes USING btree (facultad_id);
 .   DROP INDEX public.sedes_facultad_id_1d390f56;
       public            postgres    false    236            ,           1259    23492    sedes_localidad_id_7161dd22    INDEX     U   CREATE INDEX sedes_localidad_id_7161dd22 ON public.sedes USING btree (localidad_id);
 /   DROP INDEX public.sedes_localidad_id_7161dd22;
       public            postgres    false    236            -           1259    23469    sedes_nombre_07272f94_like    INDEX     _   CREATE INDEX sedes_nombre_07272f94_like ON public.sedes USING btree (nombre text_pattern_ops);
 .   DROP INDEX public.sedes_nombre_07272f94_like;
       public            postgres    false    236                       1259    23298 (   solicitudes_motivos_nombre_cdb0fee4_like    INDEX     {   CREATE INDEX solicitudes_motivos_nombre_cdb0fee4_like ON public.solicitudes_motivos USING btree (nombre text_pattern_ops);
 <   DROP INDEX public.solicitudes_motivos_nombre_cdb0fee4_like;
       public            postgres    false    222                       1259    23299 &   solicitudes_tipos_nombre_bda24089_like    INDEX     w   CREATE INDEX solicitudes_tipos_nombre_bda24089_like ON public.solicitudes_tipos USING btree (nombre text_pattern_ops);
 :   DROP INDEX public.solicitudes_tipos_nombre_bda24089_like;
       public            postgres    false    224            %           1259    23493 !   universidad_localidad_id_10840aea    INDEX     a   CREATE INDEX universidad_localidad_id_10840aea ON public.universidad USING btree (localidad_id);
 5   DROP INDEX public.universidad_localidad_id_10840aea;
       public            postgres    false    234            &           1259    23457     universidad_nombre_794834d7_like    INDEX     k   CREATE INDEX universidad_nombre_794834d7_like ON public.universidad USING btree (nombre text_pattern_ops);
 4   DROP INDEX public.universidad_nombre_794834d7_like;
       public            postgres    false    234            �           1259    22915 *   usuarios_usuarios_groups_group_id_1e265f46    INDEX     s   CREATE INDEX usuarios_usuarios_groups_group_id_1e265f46 ON public.usuarios_usuarios_groups USING btree (group_id);
 >   DROP INDEX public.usuarios_usuarios_groups_group_id_1e265f46;
       public            postgres    false    215            �           1259    22914 -   usuarios_usuarios_groups_usuarios_id_65c166be    INDEX     y   CREATE INDEX usuarios_usuarios_groups_usuarios_id_65c166be ON public.usuarios_usuarios_groups USING btree (usuarios_id);
 A   DROP INDEX public.usuarios_usuarios_groups_usuarios_id_65c166be;
       public            postgres    false    215            �           1259    22929 9   usuarios_usuarios_user_permissions_permission_id_394f07a6    INDEX     �   CREATE INDEX usuarios_usuarios_user_permissions_permission_id_394f07a6 ON public.usuarios_usuarios_user_permissions USING btree (permission_id);
 M   DROP INDEX public.usuarios_usuarios_user_permissions_permission_id_394f07a6;
       public            postgres    false    217            �           1259    22928 7   usuarios_usuarios_user_permissions_usuarios_id_d860a7b5    INDEX     �   CREATE INDEX usuarios_usuarios_user_permissions_usuarios_id_d860a7b5 ON public.usuarios_usuarios_user_permissions USING btree (usuarios_id);
 K   DROP INDEX public.usuarios_usuarios_user_permissions_usuarios_id_d860a7b5;
       public            postgres    false    217            �           1259    22901 (   usuarios_usuarios_username_94c55da1_like    INDEX     ~   CREATE INDEX usuarios_usuarios_username_94c55da1_like ON public.usuarios_usuarios USING btree (username varchar_pattern_ops);
 <   DROP INDEX public.usuarios_usuarios_username_94c55da1_like;
       public            postgres    false    213            X           2606    23538 5   carreras Carreras_facultad_id_3b0e721e_fk_facultad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT "Carreras_facultad_id_3b0e721e_fk_facultad_id" FOREIGN KEY (facultad_id) REFERENCES public.facultad(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.carreras DROP CONSTRAINT "Carreras_facultad_id_3b0e721e_fk_facultad_id";
       public          postgres    false    240    232    3107            Y           2606    23543 7   carreras Carreras_tipo_id_5930e629_fk_carreras_tipos_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT "Carreras_tipo_id_5930e629_fk_carreras_tipos_id" FOREIGN KEY (tipo_id) REFERENCES public.carreras_tipos(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.carreras DROP CONSTRAINT "Carreras_tipo_id_5930e629_fk_carreras_tipos_id";
       public          postgres    false    240    3126    238            I           2606    22862 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    207    211    3043            H           2606    22857 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3048    209    211            G           2606    22848 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3038    205    207            N           2606    22942 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3038    205    219            O           2606    22947 J   django_admin_log django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id FOREIGN KEY (user_id) REFERENCES public.usuarios_usuarios(id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_usuarios_usuarios_id;
       public          postgres    false    219    213    3056            T           2606    23494 9   facultad facultad_localidad_id_b851c0c5_fk_localidades_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_localidad_id_b851c0c5_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.facultad DROP CONSTRAINT facultad_localidad_id_b851c0c5_fk_localidades_id;
       public          postgres    false    230    3100    232            S           2606    23440 ;   facultad facultad_universidad_id_c5bf0de9_fk_universidad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_universidad_id_c5bf0de9_fk_universidad_id FOREIGN KEY (universidad_id) REFERENCES public.universidad(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.facultad DROP CONSTRAINT facultad_universidad_id_c5bf0de9_fk_universidad_id;
       public          postgres    false    3114    234    232            R           2606    23394 5   localidades localidades_pais_id_d3b2f5f9_fk_paises_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_pais_id_d3b2f5f9_fk_paises_id FOREIGN KEY (pais_id) REFERENCES public.paises(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.localidades DROP CONSTRAINT localidades_pais_id_d3b2f5f9_fk_paises_id;
       public          postgres    false    3094    226    230            Q           2606    23342 >   localidades localidades_provincia_id_0bb33e1a_fk_provincias_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_provincia_id_0bb33e1a_fk_provincias_id FOREIGN KEY (provincia_id) REFERENCES public.provincias(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.localidades DROP CONSTRAINT localidades_provincia_id_0bb33e1a_fk_provincias_id;
       public          postgres    false    3097    230    228            P           2606    23336 3   provincias provincias_pais_id_03cbdd0b_fk_paises_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pais_id_03cbdd0b_fk_paises_id FOREIGN KEY (pais_id) REFERENCES public.paises(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.provincias DROP CONSTRAINT provincias_pais_id_03cbdd0b_fk_paises_id;
       public          postgres    false    226    3094    228            V           2606    23459 /   sedes sedes_facultad_id_1d390f56_fk_facultad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_facultad_id_1d390f56_fk_facultad_id FOREIGN KEY (facultad_id) REFERENCES public.facultad(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_facultad_id_1d390f56_fk_facultad_id;
       public          postgres    false    232    3107    236            W           2606    23499 3   sedes sedes_localidad_id_7161dd22_fk_localidades_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_localidad_id_7161dd22_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_localidad_id_7161dd22_fk_localidades_id;
       public          postgres    false    236    3100    230            U           2606    23504 ?   universidad universidad_localidad_id_10840aea_fk_localidades_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_localidad_id_10840aea_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.universidad DROP CONSTRAINT universidad_localidad_id_10840aea_fk_localidades_id;
       public          postgres    false    234    3100    230            J           2606    22904 O   usuarios_usuarios_groups usuarios_usuarios_gr_usuarios_id_65c166be_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_usuarios_groups
    ADD CONSTRAINT usuarios_usuarios_gr_usuarios_id_65c166be_fk_usuarios_ FOREIGN KEY (usuarios_id) REFERENCES public.usuarios_usuarios(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.usuarios_usuarios_groups DROP CONSTRAINT usuarios_usuarios_gr_usuarios_id_65c166be_fk_usuarios_;
       public          postgres    false    3056    213    215            K           2606    22909 T   usuarios_usuarios_groups usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_usuarios_groups
    ADD CONSTRAINT usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 ~   ALTER TABLE ONLY public.usuarios_usuarios_groups DROP CONSTRAINT usuarios_usuarios_groups_group_id_1e265f46_fk_auth_group_id;
       public          postgres    false    209    215    3048            M           2606    22923 [   usuarios_usuarios_user_permissions usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions
    ADD CONSTRAINT usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions DROP CONSTRAINT usuarios_usuarios_us_permission_id_394f07a6_fk_auth_perm;
       public          postgres    false    207    3043    217            L           2606    22918 Y   usuarios_usuarios_user_permissions usuarios_usuarios_us_usuarios_id_d860a7b5_fk_usuarios_    FK CONSTRAINT     �   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions
    ADD CONSTRAINT usuarios_usuarios_us_usuarios_id_d860a7b5_fk_usuarios_ FOREIGN KEY (usuarios_id) REFERENCES public.usuarios_usuarios(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.usuarios_usuarios_user_permissions DROP CONSTRAINT usuarios_usuarios_us_usuarios_id_d860a7b5_fk_usuarios_;
       public          postgres    false    3056    217    213            �   #   x�3�LO-.�/�2�,�,.M�ɬJLrc���� �7�      �   �   x���1������s����.�(�D�!�x*��n�V���K�^�K������"�<�|\�(�yC�^�6k)^��Kqa+�ʀ�_%>gI|J|���.��(���9f���7K�Ϲߔ
��p|�������C���O��2)&      �   �  x�}�K��0���)r�b�G�,�i�j���
��Nx���s����"�");��������M����`�ez�t��?��/U��w3<A�-v�7��������m��*&����γ�,��hCy8B:ƞx>�B@��Q�>#��1��4�����g�x8<�\�h�	�HNQ�)จ	�qXܳ;,���>l�v�.y��T��x�����?RЄ�y{��g�m��J隇%rF��3��(A>UDtL��fʎ>�:��d�Y��  A� � 
A���A��j윝Bͻ�����s,u@D��+o Ba�1U��4^���&�C\Ϫ��A��XQ��`�e�ɐ�qT��Ƕ�m�t�z�ݗ)D�s2�/���p�af�Q�c�j�2.�:f�5�r���D�	#&��0ȆXɪ� �*"T���ŝ���������.k�JQ��A���(�JPV��l	�X�s�A��@����'"��:&�{&�"U����.v\���]t���ڳA��;:�rχ�����B�[#*2��`�f���J[�j$06`�G{1�L��m��dͧ�]��ƅA���(���%R8�I�I$S�s> Qd�WәL�`���Q��q�zD��H��a�  S����RSWi�i2�+��ö�Ԣ���]�]��<�*5�*��%�a/�ad"a�E��p����(�L��?Eb3�Y��,�aH��C� 
�D� �5���Q!�������qv-ڎY���m�.���@(�s���2���e��˘;�>�\B�����aa�4��u��nT��).@a�U���|8�y���9��w�����8��k����!��|Χ���#P2�Y��7�`�C�Aԙ%�)�¶�� _m�&�ķo_x�&�ҷo���?�)��z�%]      �   �   x�e�A
�0�ur�� �M=��u�fHSh3���ʕG��lkQ�f�?y̔lm�C@+�S!EcĆ����L~N� ǧe��ӫ���ۡ�_�ֶ2v��ap�4@�[�(EKq��`|p�~��N\Y��,utY�3ZM��h��Z)��i�|glOJ�q8�y�sl�,x�����fN          %   x�3�4�2�4�2�4�2�4�2�4�2�4����� 5Q�         B   x�3�(��M-Rp.M,��K�R��8�S�K�R�Q��9�Js�L8]�rR��Eŉ)�\1z\\\ �_�      �   #   x�3�t/JL��2��/N39�R!�=... �$	�      �   �   x�u�A� �5��a�*���"X�Ԛ����ݥ1nH��O�dA6��h�&e �4C��3L�;�K�bLQ�fYמ�����H�[*�FR~���u=w��h���� �!�K��/#�c�b.g'�D����s�X�7K      �   �   x�]�M�� ���aF���.���X"8���/I��͎�=��� �#G2���-P�0�4�*K��E�$e�#8�������S�	ԯ�~��J,�=���!ѝ��D\k��Œ����q���6��v�K�0J�f�3O�i4vI{�4�K�a渒�1'ਹ��z(�g�t�ќw�\	yq.;G��vG)�D����[s6h��}Z����)P���z���6�"�+I���GKM��Y�f�>��	�u��      �   �  x����n�<�ӫ�4��x|ȵ|RA���M�j{���NҜhA�
�c�y�ñ��խ�?�Uw  ,�[����@���w9؜(#����Mm��h�k�*�ExR��k���`|Dѡ|��>\+6�BO
U���j�{�^뮫�[<�����Ku;˷vQ�,؀�	E���[u-�ˏ�R�b&��S�[�Ns�}�w�& ��9�Rv}qiε���;��	8@�1�?�����T�=a8��?1�p���>�}�vEy:U�6mq���<W�f1���0�ܮg~p1�G��8���A/����R#
a@���qC�>F��E,w�PU�����,����JQ�)�Qͭ�U����)����Q�u�B�q@.�$uO�����h��F���j?��{��'��@'���� !��c
�ץ<��M}|�e4�T�|8�m[�e��/4��\"�@�;�\��!�<ǖ�fAP[�Bp�b��]hCаC�L"E��[Yq�����U]���S���s�9P��ʈ�"`�b�9@���%��;|{�k愙S�c]\��������r1����T8�$����4���`e]s���x��16(�TM4Z�ùj�U�pEoE+?
f)^�EC��u�3:&�|a�V���$ɑ�8����1�d������<F��.��Q��s�~r.�+ZL4��F�OĖi�X�b��}�'�$�Q��b'}kO�J���ȌZ�պ}-���a<��e�RҘQ�.��S��V^1�i�.����B�^��h�S�5�4��x�o]/5t���:��(4�J����V[��>��v1��Fi�bh���1�!nc�-Fo1j�Q�$yc�3e����9G��d���E/�,�J��[ L�.tQ�b:w1G��g#@�A�+�9�uZ(�b��^�oɬ	&�1M@����w�Dp��ˁ���$qچy1IB۸����v�YI�d�g� �^L�y�Ξ���n�V�c�jApa��ӓ�5��Nu�`L�ߜ�~E`�)�wi>HG��@X<,-�s��4F������U�9,��F�Hz�5��͆0ρH9�{Ki`��vE��9!ld�p��+©�T}�feǭ�n%G!�̣̒F�\��S�"�o�Y.a~�M:.BÇ�ă>3��\T����zm�d�֙,���<�/{{{�����      �   	  x��Kr�0  е���IB��@2j,"��n�@�⇀��}�0�/hq��'�J��[���%j�^������Ƿ{��X%D��gc��G����n�3�2&�+���Vf�[$�1̄�y���+B����:��p�������Pץ@���,��<�~S"�<B��si\�����cVƕxL<rq�zl�q�-��=�1%���Q�
��Ɋ�j����_q0�w���2NEn�1����T���������s h�*Д���(ˌ]�      �   �   x�3�tKL.�)ILQHIUp�L�K�L,Vp�HL.I,�Q,=�673(T���XRZ���Z��vxeNfH�cUbQ��ߡ���F�ڦ&�
��f
�&+���XZrf��[�뗗��%�V���%�ꥦ��%�srr��qqq �.'      �   �   x�M�?
�0���N�H�����������l�%�]���s���Y�����1e8ùZ���E{/S~�1��ÆEX��|M������R�m�Y"��2Ex�5*8�q�)�9����Q�R.��_p�.�$վ�#�5�WD�Ύ'�      �   -   x�3�t,JO�+��K�2�t*J,���2�H,JL/M������ ��
�      �   E   x�3���,���K-�4�2�t�/*�L�+s�9�r�2�o.���,�4�2��,I,8�+�Ә+F��� ��      �   3  x�m�=N�0��9�7���ر�3�(����8�R'�h'��	*!u��	�
8)C���?���8��̤�Hԭ�%J��R�C.`�����3F����฾�@�˜0Da�����]��W	��$�%Ku���JfM6�\K^+H��d�g�d��Q��s���G��w$Q|����麖��[�eך�<��
��i�I�'{
�x޸��8�����2����Z�r�J���`�!�9� ���&�DɇO��B�J�~�k~�o�bWJk��K���Ƣ���ab�Q'���ƶ,�����      �   A   x�3��M-NTHIUp�H�M��2�t.-*�W�ON,���K��2�t�L.IL��r�I,N����� )��      �   7   x�3�N�IT�,*)M��2�t,�I�2��M,I-�L�QHIUp,ȯ������ Wf�      �      x�5�;
1�:Y�����Lk)N!��<L����ܚ�+S�S��)<|.���D�0'��yC������������Z����/h�CĀ'�4l��X[X�SF)v�u)���w�E�]�%��"8��L(�      �   �  x�u��n�@���O�w��ٓ�F�Tʩ1��
��HՂ�m��6��}��&=\Pi��ь���([���|+��p�I� �~�����;?Ϫf��d�-��ӽ��m6u�l%�ow�x���`�O�;�����:F[�u��M�N�I�*E���D�� �Q�P"L&�vZ\��[�a�zU�� ����0�����E7#^~9Eˣ����`��R,�� ����s�[|\<>�u��Z�nQlQ� W�-�R�0	5z�-�5��AX��~��J�Mz��R��J�U�%@mp*lf
0�������9Z�U�yZ����B{Н|}�*
}Q��V�*�����ӵ?=z�t�[���KJt�y�4���w�hk��	��f��'�?��oHpM
5a����k3�D1���&�L\��W�0�����      �      x�3�4�4�2�4�4����� 6      �      x������ � �     