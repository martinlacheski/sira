PGDMP                         x            sira     12.4 (Ubuntu 12.4-1.pgdg20.04+1)     12.4 (Ubuntu 12.4-1.pgdg20.04+1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    22060    sira    DATABASE     v   CREATE DATABASE sira WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_AR.UTF-8' LC_CTYPE = 'es_AR.UTF-8';
    DROP DATABASE sira;
                postgres    false            �            1259    22092 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    22090    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    209            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    208            �            1259    22102    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    22100    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    211            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    210            �            1259    22084    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    22082    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    207            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    206            �            1259    22110 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    22120    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    22118    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    215            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    214            �            1259    22108    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    213            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    212            �            1259    22128    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    22126 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    217            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    216            �            1259    22188    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         heap    postgres    false            �            1259    22186    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    219            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    218            �            1259    22074    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    22072    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    205            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    204            �            1259    22063    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    22061    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    203            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    202            �            1259    22219    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    22336    facultad    TABLE     �   CREATE TABLE public.facultad (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    web text,
    localidad_id integer NOT NULL,
    universidad_id integer NOT NULL
);
    DROP TABLE public.facultad;
       public         heap    postgres    false            �            1259    22334    facultad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.facultad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.facultad_id_seq;
       public          postgres    false    228            �           0    0    facultad_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.facultad_id_seq OWNED BY public.facultad.id;
          public          postgres    false    227            �            1259    22255    localidades    TABLE     �   CREATE TABLE public.localidades (
    id integer NOT NULL,
    nombre text NOT NULL,
    codigo_postal text,
    provincia_id integer NOT NULL,
    pais_id integer NOT NULL
);
    DROP TABLE public.localidades;
       public         heap    postgres    false            �            1259    22253    localidades_id_seq    SEQUENCE     �   CREATE SEQUENCE public.localidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.localidades_id_seq;
       public          postgres    false    226            �           0    0    localidades_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.localidades_id_seq OWNED BY public.localidades.id;
          public          postgres    false    225            �            1259    22231    paises    TABLE     R   CREATE TABLE public.paises (
    id integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.paises;
       public         heap    postgres    false            �            1259    22229    paises_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.paises_id_seq;
       public          postgres    false    222            �           0    0    paises_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.paises_id_seq OWNED BY public.paises.id;
          public          postgres    false    221            �            1259    22244 
   provincias    TABLE     t   CREATE TABLE public.provincias (
    id integer NOT NULL,
    nombre text NOT NULL,
    pais_id integer NOT NULL
);
    DROP TABLE public.provincias;
       public         heap    postgres    false            �            1259    22242    provincias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.provincias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.provincias_id_seq;
       public          postgres    false    224            �           0    0    provincias_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.provincias_id_seq OWNED BY public.provincias.id;
          public          postgres    false    223            �            1259    22362    sedes    TABLE     �   CREATE TABLE public.sedes (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    facultad_id integer NOT NULL,
    localidad_id integer NOT NULL
);
    DROP TABLE public.sedes;
       public         heap    postgres    false            �            1259    22360    sedes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sedes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.sedes_id_seq;
       public          postgres    false    232            �           0    0    sedes_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.sedes_id_seq OWNED BY public.sedes.id;
          public          postgres    false    231            �            1259    22349    universidad    TABLE     �   CREATE TABLE public.universidad (
    id integer NOT NULL,
    nombre text NOT NULL,
    direccion text,
    telefonos text,
    web text,
    localidad_id integer NOT NULL
);
    DROP TABLE public.universidad;
       public         heap    postgres    false            �            1259    22347    universidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.universidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.universidad_id_seq;
       public          postgres    false    230            �           0    0    universidad_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.universidad_id_seq OWNED BY public.universidad.id;
          public          postgres    false    229            �           2604    22095    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    209    209            �           2604    22105    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    22087    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �           2604    22113    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    212    213            �           2604    22123    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    22131    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    22191    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    22077    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �           2604    22066    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �           2604    22339    facultad id    DEFAULT     j   ALTER TABLE ONLY public.facultad ALTER COLUMN id SET DEFAULT nextval('public.facultad_id_seq'::regclass);
 :   ALTER TABLE public.facultad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    22258    localidades id    DEFAULT     p   ALTER TABLE ONLY public.localidades ALTER COLUMN id SET DEFAULT nextval('public.localidades_id_seq'::regclass);
 =   ALTER TABLE public.localidades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    22234 	   paises id    DEFAULT     f   ALTER TABLE ONLY public.paises ALTER COLUMN id SET DEFAULT nextval('public.paises_id_seq'::regclass);
 8   ALTER TABLE public.paises ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    22247    provincias id    DEFAULT     n   ALTER TABLE ONLY public.provincias ALTER COLUMN id SET DEFAULT nextval('public.provincias_id_seq'::regclass);
 <   ALTER TABLE public.provincias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    22365    sedes id    DEFAULT     d   ALTER TABLE ONLY public.sedes ALTER COLUMN id SET DEFAULT nextval('public.sedes_id_seq'::regclass);
 7   ALTER TABLE public.sedes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    22352    universidad id    DEFAULT     p   ALTER TABLE ONLY public.universidad ALTER COLUMN id SET DEFAULT nextval('public.universidad_id_seq'::regclass);
 =   ALTER TABLE public.universidad ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �          0    22092 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    209   )�       �          0    22102    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    211   F�       �          0    22084    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    207   c�       �          0    22110 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    213   \�       �          0    22120    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    215   �       �          0    22128    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    217   5�       �          0    22188    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    219   R�       �          0    22074    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    205   o�       �          0    22063    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    203   �       �          0    22219    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    220   ��       �          0    22336    facultad 
   TABLE DATA           g   COPY public.facultad (id, nombre, direccion, telefonos, web, localidad_id, universidad_id) FROM stdin;
    public          postgres    false    228   ��       �          0    22255    localidades 
   TABLE DATA           W   COPY public.localidades (id, nombre, codigo_postal, provincia_id, pais_id) FROM stdin;
    public          postgres    false    226   ��       �          0    22231    paises 
   TABLE DATA           ,   COPY public.paises (id, nombre) FROM stdin;
    public          postgres    false    222   F�       �          0    22244 
   provincias 
   TABLE DATA           9   COPY public.provincias (id, nombre, pais_id) FROM stdin;
    public          postgres    false    224   ��       �          0    22362    sedes 
   TABLE DATA           \   COPY public.sedes (id, nombre, direccion, telefonos, facultad_id, localidad_id) FROM stdin;
    public          postgres    false    232   ��       �          0    22349    universidad 
   TABLE DATA           Z   COPY public.universidad (id, nombre, direccion, telefonos, web, localidad_id) FROM stdin;
    public          postgres    false    230   �       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    208            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);
          public          postgres    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);
          public          postgres    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    216            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    218            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);
          public          postgres    false    204            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 33, true);
          public          postgres    false    202            �           0    0    facultad_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.facultad_id_seq', 1, true);
          public          postgres    false    227            �           0    0    localidades_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.localidades_id_seq', 12, true);
          public          postgres    false    225            �           0    0    paises_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.paises_id_seq', 4, true);
          public          postgres    false    221            �           0    0    provincias_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.provincias_id_seq', 6, true);
          public          postgres    false    223            �           0    0    sedes_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.sedes_id_seq', 6, true);
          public          postgres    false    231            �           0    0    universidad_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.universidad_id_seq', 1, true);
          public          postgres    false    229            �           2606    22217    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    209            �           2606    22144 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    211    211            �           2606    22107 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    211            �           2606    22097    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    209            �           2606    22135 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    207    207            �           2606    22089 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    207            �           2606    22125 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    215            �           2606    22159 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    215    215            �           2606    22115    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    213            �           2606    22133 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    217            �           2606    22173 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    217    217            �           2606    22211     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    213            �           2606    22197 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    219            �           2606    22081 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    205    205            �           2606    22079 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    205            �           2606    22071 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    203            �           2606    22226 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    220            �           2606    22346    facultad facultad_nombre_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_nombre_key UNIQUE (nombre);
 F   ALTER TABLE ONLY public.facultad DROP CONSTRAINT facultad_nombre_key;
       public            postgres    false    228            �           2606    22344    facultad facultad_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.facultad DROP CONSTRAINT facultad_pkey;
       public            postgres    false    228            �           2606    22263    localidades localidades_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.localidades DROP CONSTRAINT localidades_pkey;
       public            postgres    false    226            �           2606    22241    paises paises_nombre_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_nombre_key UNIQUE (nombre);
 B   ALTER TABLE ONLY public.paises DROP CONSTRAINT paises_nombre_key;
       public            postgres    false    222            �           2606    22239    paises paises_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.paises DROP CONSTRAINT paises_pkey;
       public            postgres    false    222            �           2606    22252    provincias provincias_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.provincias DROP CONSTRAINT provincias_pkey;
       public            postgres    false    224            �           2606    22372    sedes sedes_nombre_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_nombre_key UNIQUE (nombre);
 @   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_nombre_key;
       public            postgres    false    232            �           2606    22370    sedes sedes_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_pkey;
       public            postgres    false    232            �           2606    22359 "   universidad universidad_nombre_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_nombre_key UNIQUE (nombre);
 L   ALTER TABLE ONLY public.universidad DROP CONSTRAINT universidad_nombre_key;
       public            postgres    false    230            �           2606    22357    universidad universidad_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.universidad DROP CONSTRAINT universidad_pkey;
       public            postgres    false    230            �           1259    22218    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    209            �           1259    22155 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    211            �           1259    22156 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    211            �           1259    22141 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    207            �           1259    22171 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    215            �           1259    22170 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    215            �           1259    22185 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    217            �           1259    22184 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    217            �           1259    22212     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    213            �           1259    22208 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    219            �           1259    22209 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    219            �           1259    22228 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    220            �           1259    22227 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    220            �           1259    22384    facultad_localidad_id_b851c0c5    INDEX     [   CREATE INDEX facultad_localidad_id_b851c0c5 ON public.facultad USING btree (localidad_id);
 2   DROP INDEX public.facultad_localidad_id_b851c0c5;
       public            postgres    false    228            �           1259    22383    facultad_nombre_2634b012_like    INDEX     e   CREATE INDEX facultad_nombre_2634b012_like ON public.facultad USING btree (nombre text_pattern_ops);
 1   DROP INDEX public.facultad_nombre_2634b012_like;
       public            postgres    false    228            �           1259    22405     facultad_universidad_id_c5bf0de9    INDEX     _   CREATE INDEX facultad_universidad_id_c5bf0de9 ON public.facultad USING btree (universidad_id);
 4   DROP INDEX public.facultad_universidad_id_c5bf0de9;
       public            postgres    false    228            �           1259    22333    localidades_pais_id_d3b2f5f9    INDEX     W   CREATE INDEX localidades_pais_id_d3b2f5f9 ON public.localidades USING btree (pais_id);
 0   DROP INDEX public.localidades_pais_id_d3b2f5f9;
       public            postgres    false    226            �           1259    22276 !   localidades_provincia_id_0bb33e1a    INDEX     a   CREATE INDEX localidades_provincia_id_0bb33e1a ON public.localidades USING btree (provincia_id);
 5   DROP INDEX public.localidades_provincia_id_0bb33e1a;
       public            postgres    false    226            �           1259    22264    paises_nombre_07bcedcc_like    INDEX     a   CREATE INDEX paises_nombre_07bcedcc_like ON public.paises USING btree (nombre text_pattern_ops);
 /   DROP INDEX public.paises_nombre_07bcedcc_like;
       public            postgres    false    222            �           1259    22270    provincias_pais_id_03cbdd0b    INDEX     U   CREATE INDEX provincias_pais_id_03cbdd0b ON public.provincias USING btree (pais_id);
 /   DROP INDEX public.provincias_pais_id_03cbdd0b;
       public            postgres    false    224            �           1259    22403    sedes_facultad_id_1d390f56    INDEX     S   CREATE INDEX sedes_facultad_id_1d390f56 ON public.sedes USING btree (facultad_id);
 .   DROP INDEX public.sedes_facultad_id_1d390f56;
       public            postgres    false    232            �           1259    22404    sedes_localidad_id_7161dd22    INDEX     U   CREATE INDEX sedes_localidad_id_7161dd22 ON public.sedes USING btree (localidad_id);
 /   DROP INDEX public.sedes_localidad_id_7161dd22;
       public            postgres    false    232            �           1259    22402    sedes_nombre_07272f94_like    INDEX     _   CREATE INDEX sedes_nombre_07272f94_like ON public.sedes USING btree (nombre text_pattern_ops);
 .   DROP INDEX public.sedes_nombre_07272f94_like;
       public            postgres    false    232            �           1259    22391 !   universidad_localidad_id_10840aea    INDEX     a   CREATE INDEX universidad_localidad_id_10840aea ON public.universidad USING btree (localidad_id);
 5   DROP INDEX public.universidad_localidad_id_10840aea;
       public            postgres    false    230            �           1259    22390     universidad_nombre_794834d7_like    INDEX     k   CREATE INDEX universidad_nombre_794834d7_like ON public.universidad USING btree (nombre text_pattern_ops);
 4   DROP INDEX public.universidad_nombre_794834d7_like;
       public            postgres    false    230            �           2606    22150 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    211    207    2996            �           2606    22145 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    3001    211    209            �           2606    22136 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    2991    205    207            �           2606    22165 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    215    209    3001            �           2606    22160 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    215    213    3009            �           2606    22179 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    2996    207    217            �           2606    22174 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    3009    213    217                        2606    22198 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    219    2991    205                       2606    22203 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    219    213    3009                       2606    22378 9   facultad facultad_localidad_id_b851c0c5_fk_localidades_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_localidad_id_b851c0c5_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.facultad DROP CONSTRAINT facultad_localidad_id_b851c0c5_fk_localidades_id;
       public          postgres    false    3043    228    226                       2606    22373 ;   facultad facultad_universidad_id_c5bf0de9_fk_universidad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.facultad
    ADD CONSTRAINT facultad_universidad_id_c5bf0de9_fk_universidad_id FOREIGN KEY (universidad_id) REFERENCES public.universidad(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.facultad DROP CONSTRAINT facultad_universidad_id_c5bf0de9_fk_universidad_id;
       public          postgres    false    228    3057    230                       2606    22328 5   localidades localidades_pais_id_d3b2f5f9_fk_paises_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_pais_id_d3b2f5f9_fk_paises_id FOREIGN KEY (pais_id) REFERENCES public.paises(id) DEFERRABLE INITIALLY DEFERRED;
 _   ALTER TABLE ONLY public.localidades DROP CONSTRAINT localidades_pais_id_d3b2f5f9_fk_paises_id;
       public          postgres    false    226    3037    222                       2606    22271 >   localidades localidades_provincia_id_0bb33e1a_fk_provincias_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.localidades
    ADD CONSTRAINT localidades_provincia_id_0bb33e1a_fk_provincias_id FOREIGN KEY (provincia_id) REFERENCES public.provincias(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.localidades DROP CONSTRAINT localidades_provincia_id_0bb33e1a_fk_provincias_id;
       public          postgres    false    3040    226    224                       2606    22265 3   provincias provincias_pais_id_03cbdd0b_fk_paises_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.provincias
    ADD CONSTRAINT provincias_pais_id_03cbdd0b_fk_paises_id FOREIGN KEY (pais_id) REFERENCES public.paises(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.provincias DROP CONSTRAINT provincias_pais_id_03cbdd0b_fk_paises_id;
       public          postgres    false    3037    222    224                       2606    22392 /   sedes sedes_facultad_id_1d390f56_fk_facultad_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_facultad_id_1d390f56_fk_facultad_id FOREIGN KEY (facultad_id) REFERENCES public.facultad(id) DEFERRABLE INITIALLY DEFERRED;
 Y   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_facultad_id_1d390f56_fk_facultad_id;
       public          postgres    false    228    3050    232            	           2606    22397 3   sedes sedes_localidad_id_7161dd22_fk_localidades_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.sedes
    ADD CONSTRAINT sedes_localidad_id_7161dd22_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;
 ]   ALTER TABLE ONLY public.sedes DROP CONSTRAINT sedes_localidad_id_7161dd22_fk_localidades_id;
       public          postgres    false    232    226    3043                       2606    22385 ?   universidad universidad_localidad_id_10840aea_fk_localidades_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.universidad
    ADD CONSTRAINT universidad_localidad_id_10840aea_fk_localidades_id FOREIGN KEY (localidad_id) REFERENCES public.localidades(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.universidad DROP CONSTRAINT universidad_localidad_id_10840aea_fk_localidades_id;
       public          postgres    false    3043    230    226            �      x������ � �      �      x������ � �      �   �  x�]��j�0E��W�Je;�u��.��B1��R;�����=i�x'i�$�WμT]V5Mv�/���a�Y�_˞�6'�����WT8� ��W?i0	Xxo�����v����v۾39�Ɂݣ����)��=��"��S���|3	�ںg��s�bġSDX��\T"@<.��<���$�.�+�~�����������<����n��nZ�Z6=n��Ȁ���(��YH�'����|�,��t����Wݓ0�l��.{&L�]0�Kd] �J�$����k�T�9py�G���#�z��:©� C��>(i?����2�Pɸm�b�`�$�*���JE@2T8iĹjGs
��r�	��ϣ#��DF�K3^�z�N�߹<��7�m�:���ڀ$K%�� GnBI�}�s����*�q��O�J~DR�	��G�3OcI�G���0R�\x�g9��
��O�*�>�l�C�7tx��|����h�      �   �   x�E��
�@@���S�p��3�c
AHQ*t� &�y������Y>����K�Ijr� jq��K0۬�u<�4(=q��v7����"�=.��/��U%A���Q����K��!��s����@=�������Qwe�Hk�Wz�ԟ��+L!��f�:c��_�u����2�      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�M�K
�0�z�)u��K7�VSAb���Mb
�i���I#�i�X˂q��R&5�q�f(�e\:4��+���%��nd���;p�A���󨁃��%��������I�Uz�oc� �0�bw�Ԣ�Rl��� ���FE      �   �  x����n�0����(���ʳ�dY	M�d�T����\��D�P|�3�gd���f��e�	!�WM5T��P�x��P�Un�S|K��p>�4��e�p��g��#"���=r�ݷ��S�Yz^���p�ְF�(��t�`̇�P������?�j�lJ9�D-����L||�p*7� ���b�Pe��ew��>�y
_�.�#��)���D)�H�$u��R�BU?U�M��-*�V%^R9�yض�����EC�jԡ��wv�����6`Q���K�-�&�}4��`��5�f*�3��!mק�/�������p�a�A+)D@���t��F�=���{��%)�ƥ� 5K����]{9�$�B�$��3[T�s�~}�$r��ў%̀�M�W݋]�qh����rZ��I�hP�! ���7B2�B�MZ�L�x��ׅ�A���uA��"�x\3L��\ò �SM;�2�8Ò�b�ry�\�CկQ[(��dR��fT��5�~]�:�Q�رc9��VkX1lr�RJPͬyd͚����C=�v��l��@ڊqe3���k�Ɩ�cG�Np�`�rk����3Ń����;�q� 'ĢL=�/X���5�"f�䤵@L
sƀ~A� �f��0Ej�0��~�aL�#rp�ʩ4�Dq?�����K%�〠������v����'�      �      x������ � �      �   �   x��=
�0 �99�7*j��D���w��$�@4?��F��S�O�u�0N�z�0�yD�0������&�`�{I;�{7���A(�%���K���n#e���!����y)�u�>'ϲǁY�N��(�_x*_      �   �   x�5ͻ�0����)���#2�%�.Gi	RS����l�}1���υC�g�p)�8�1H;��!�Y*@�C�rۼ�Q�IXH�^��Իm?#@xM�rWƽ��a.��*�hZ�W��%%�F��M�-G��'G*�RƇr���P�~\�������uxh�2>�B�˪<�      �   -   x�3�t,JO�+��K�2�t*J,���2�H,JL/M������ ��
�      �   S   x�3���,���K-�4�2�t�/*�L�+s�9�r�2�o.���,�4�2�t�KN,�KL�<�9�Ә˔�9#19�:F��� �?      �   &  x�mнN�0��y�AHm���`+U+!h�P�XN��,9qq�
:�<#C%�n����$8�T*��~���d�T�ʕ�����LݧV/��0ڠE�B0����.?�0Jb�y{�#f�����n�j��Mі�+�W�R�u�R�HF���*�̌����_4J9!S��L꼕;yRҖҺm�ݺ�Jn`a��u�E���XJ�����,����\�5�<Tj-m����}� �1x�(�����cR�����#~]Ɩ��.p'��OVU������i���?o��q�/!n~i      �      x�5�;
1�:Y�����Lk)N!��<L����ܚ�+S�S��)<|.���D�0'��yC������������Z����/h�CĀ'�4l��X[X�SF)v�u)���w�E�]�%��"8��L(�     