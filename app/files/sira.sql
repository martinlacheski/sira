

CREATE TABLE public.paises (
                id_pais SERIAL NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_pais PRIMARY KEY (id_pais)
);


CREATE TABLE public.provincias (
                id_provincia SERIAL,
                id_pais INTEGER NOT NULL,
                nombre VARCHAR NOT NULL,
                CONSTRAINT id_provincia PRIMARY KEY (id_provincia, id_pais)
);


CREATE TABLE public.localidades (
                id_localidad SERIAL,
                id_provincia INTEGER NOT NULL,
                id_pais INTEGER NOT NULL,
                nombre VARCHAR NOT NULL,
                codigo_postal INTEGER NOT NULL,
                CONSTRAINT id_localidad PRIMARY KEY (id_localidad, id_provincia, id_pais)
);
