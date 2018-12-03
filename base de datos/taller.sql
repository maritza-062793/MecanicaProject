
CREATE SEQUENCE public.vehiculo_id_seq;

CREATE TABLE public.vehiculo (
                id INTEGER NOT NULL DEFAULT nextval('public.vehiculo_id_seq'),
                vehiculo_code VARCHAR(100) NOT NULL,
                patente VARCHAR(40) NOT NULL,
                marca VARCHAR(255) NOT NULL,
                modelo VARCHAR(30) NOT NULL,
                nro_chasis VARCHAR(30) NOT NULL,
                nro_motor VARCHAR(30) NOT NULL,
                vto_vtv DATE NOT NULL,
                idseguro INTEGER NOT NULL,
                color VARCHAR(30) NOT NULL,
                estado SMALLINT NOT NULL,
                imagen VARCHAR(255) NOT NULL,
                fecha_carga TIMESTAMP NOT NULL,
                CONSTRAINT vehiculo_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.vehiculo_id_seq OWNED BY public.vehiculo.id;

CREATE SEQUENCE public.tarjeta_id_seq;

CREATE TABLE public.tarjeta (
                id INTEGER NOT NULL DEFAULT nextval('public.tarjeta_id_seq'),
                numero VARCHAR(255) NOT NULL,
                vencimiento DATE NOT NULL,
                idvehiculo INTEGER NOT NULL,
                fecha_carga TIMESTAMP NOT NULL,
                CONSTRAINT tarjeta_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.tarjeta_id_seq OWNED BY public.tarjeta.id;

CREATE SEQUENCE public.taller_id_seq;

CREATE TABLE public.taller (
                id INTEGER NOT NULL DEFAULT nextval('public.taller_id_seq'),
                nombre VARCHAR(255) NOT NULL,
                cuit VARCHAR(255) NOT NULL,
                direccion VARCHAR(255) NOT NULL,
                localidad VARCHAR(255) NOT NULL,
                telefono VARCHAR(50) NOT NULL,
                celular VARCHAR(50) NOT NULL,
                estado SMALLINT NOT NULL,
                fecha_carga TIMESTAMP NOT NULL,
                CONSTRAINT taller_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.taller_id_seq OWNED BY public.taller.id;

CREATE SEQUENCE public.seguro_id_seq;

CREATE TABLE public.seguro (
                id INTEGER NOT NULL DEFAULT nextval('public.seguro_id_seq'),
                nombre VARCHAR(255) NOT NULL,
                poliza VARCHAR(25) NOT NULL,
                vencimiento DATE NOT NULL,
                fecha_carga TIMESTAMP NOT NULL,
                CONSTRAINT seguro_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.seguro_id_seq OWNED BY public.seguro.id;

CREATE SEQUENCE public.sector_id_seq;

CREATE TABLE public.sector (
                id INTEGER NOT NULL DEFAULT nextval('public.sector_id_seq'),
                nombre VARCHAR(255) NOT NULL,
                idempresa INTEGER NOT NULL,
                fecha_carga TIMESTAMP NOT NULL,
                CONSTRAINT sector_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.sector_id_seq OWNED BY public.sector.id;

CREATE SEQUENCE public.reparaciones_id_seq;

CREATE TABLE public.reparaciones (
                id INTEGER NOT NULL DEFAULT nextval('public.reparaciones_id_seq'),
                fecha_repa DATE NOT NULL,
                descripcion VARCHAR(255) NOT NULL,
                idvehiculo INTEGER NOT NULL,
                idtaller INTEGER NOT NULL,
                fecha_carga TIMESTAMP NOT NULL,
                CONSTRAINT reparaciones_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.reparaciones_id_seq OWNED BY public.reparaciones.id;

CREATE SEQUENCE public.permisos_id_seq;

CREATE TABLE public.permisos (
                id INTEGER NOT NULL DEFAULT nextval('public.permisos_id_seq'),
                nombre VARCHAR(30) NOT NULL,
                CONSTRAINT permisos_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.permisos_id_seq OWNED BY public.permisos.id;

CREATE SEQUENCE public.kind_id_seq;

CREATE TABLE public.kind (
                id INTEGER NOT NULL DEFAULT nextval('public.kind_id_seq'),
                name VARCHAR(50) NOT NULL,
                CONSTRAINT kind_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.kind_id_seq OWNED BY public.kind.id;

CREATE SEQUENCE public.empresa_id_seq;

CREATE TABLE public.empresa (
                id INTEGER NOT NULL DEFAULT nextval('public.empresa_id_seq'),
                nombre VARCHAR(255) NOT NULL,
                cuit VARCHAR(30) NOT NULL,
                estado SMALLINT NOT NULL,
                fecha_carga TIMESTAMP NOT NULL,
                CONSTRAINT empresa_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.empresa_id_seq OWNED BY public.empresa.id;

CREATE SEQUENCE public.empleado_id_seq;

CREATE TABLE public.empleado (
                id INTEGER NOT NULL DEFAULT nextval('public.empleado_id_seq'),
                dni VARCHAR(10),
                imagen VARCHAR(255) NOT NULL,
                nombre VARCHAR(50) NOT NULL,
                apellido VARCHAR(50) NOT NULL,
                username VARCHAR(50),
                email VARCHAR(255) NOT NULL,
                password VARCHAR(60) NOT NULL,
                domicilio VARCHAR(100) NOT NULL,
                localidad VARCHAR(100) NOT NULL,
                telefono VARCHAR(20),
                celular VARCHAR(20),
                registro VARCHAR(20),
                status BIT DEFAULT 0 NOT NULL,
                kind BIT DEFAULT 0 NOT NULL,
                created_at TIMESTAMP NOT NULL,
                CONSTRAINT empleado_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.empleado_id_seq OWNED BY public.empleado.id;

CREATE SEQUENCE public.empleado_permisos_idempleado_permiso_seq;

CREATE TABLE public.empleado_permisos (
                idempleado_permiso INTEGER NOT NULL DEFAULT nextval('public.empleado_permisos_idempleado_permiso_seq'),
                idempleado INTEGER NOT NULL,
                idpermiso INTEGER NOT NULL,
                CONSTRAINT empleado_permisos_pk PRIMARY KEY (idempleado_permiso)
);


ALTER SEQUENCE public.empleado_permisos_idempleado_permiso_seq OWNED BY public.empleado_permisos.idempleado_permiso;

CREATE INDEX idempleado
 ON public.empleado_permisos USING BTREE
 ( idempleado ASC );

CREATE INDEX idpermiso
 ON public.empleado_permisos USING BTREE
 ( idpermiso ASC );

CREATE SEQUENCE public.configuracion_id_seq;

CREATE TABLE public.configuracion (
                id INTEGER NOT NULL DEFAULT nextval('public.configuracion_id_seq'),
                nombre VARCHAR(80) NOT NULL,
                dni VARCHAR(80),
                actividad_economica VARCHAR(255),
                email VARCHAR(200),
                telefono VARCHAR(50),
                imagen VARCHAR(255),
                CONSTRAINT configuracion_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.configuracion_id_seq OWNED BY public.configuracion.id;

CREATE SEQUENCE public.choque_id_seq;

CREATE TABLE public.choque (
                id INTEGER NOT NULL DEFAULT nextval('public.choque_id_seq'),
                choque_code VARCHAR(100) NOT NULL,
                fecha_choque DATE NOT NULL,
                idvehiculo INTEGER NOT NULL,
                idempleado INTEGER NOT NULL,
                descripcion TEXT NOT NULL,
                nombre_ter VARCHAR(255) NOT NULL,
                dni_ter VARCHAR(20) NOT NULL,
                registro_ter DATE NOT NULL,
                domicilio_ter VARCHAR(255) NOT NULL,
                localidad_ter VARCHAR(255) NOT NULL,
                patente_ter VARCHAR(30) NOT NULL,
                marca_modelo_ter VARCHAR(255) NOT NULL,
                color_ter VARCHAR(255) NOT NULL,
                seguro_ter VARCHAR(255) NOT NULL,
                poliza_ter VARCHAR(50) NOT NULL,
                telefono_ter VARCHAR(50) NOT NULL,
                celular_ter VARCHAR(50) NOT NULL,
                fecha_carga TIMESTAMP NOT NULL,
                foto1 VARCHAR(255) NOT NULL,
                foto2 VARCHAR(255) NOT NULL,
                foto3 VARCHAR(255) NOT NULL,
                foto4 VARCHAR(255) NOT NULL,
                CONSTRAINT choque_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.choque_id_seq OWNED BY public.choque.id;

ALTER TABLE public.empleado_permisos ADD CONSTRAINT empleado_permisos_ibfk_2
FOREIGN KEY (idpermiso)
REFERENCES public.permisos (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.empleado_permisos ADD CONSTRAINT empleado_permisos_ibfk_1
FOREIGN KEY (idempleado)
REFERENCES public.empleado (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
