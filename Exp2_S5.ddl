-- Generated by Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   at:        2024-09-09 21:21:48 CLST
--   site:      Oracle Database 21c
--   type:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cliente (
    rut       VARCHAR2(9 CHAR) NOT NULL,
    nombres   VARCHAR2(100 CHAR) NOT NULL,
    apellidos VARCHAR2(100 CHAR) NOT NULL,
    domicilio VARCHAR2(200 CHAR) NOT NULL,
    telefono  VARCHAR2(20 CHAR) NOT NULL,
    email     VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut );

CREATE TABLE estado (
    idestado            INTEGER NOT NULL,
    descripcion         VARCHAR2(100 CHAR) NOT NULL,
    servicio_idservicio INTEGER NOT NULL
);

CREATE UNIQUE INDEX estado__idx ON
    estado (
        servicio_idservicio
    ASC );

ALTER TABLE estado ADD CONSTRAINT estado_pk PRIMARY KEY ( idestado );

CREATE TABLE orden_atencion (
    idorden          INTEGER NOT NULL,
    fecha_ingreso    DATE NOT NULL,
    cliente_rut      VARCHAR2(9 CHAR) NOT NULL,
    vehiculo_patente VARCHAR2(6 CHAR) NOT NULL
);

ALTER TABLE orden_atencion ADD CONSTRAINT orden_atencion_pk PRIMARY KEY ( idorden );

CREATE TABLE repuestos (
    idrepuesto          INTEGER NOT NULL,
    descripcion         VARCHAR2(100 CHAR) NOT NULL,
    cantidad            INTEGER NOT NULL,
    costo_unitario      INTEGER NOT NULL,
    servicio_idservicio INTEGER NOT NULL
);

ALTER TABLE repuestos ADD CONSTRAINT repuestos_pk PRIMARY KEY ( idrepuesto );

CREATE TABLE servicio (
    idservicio             INTEGER NOT NULL,
    descripcion            VARCHAR2(1000) NOT NULL,
    costo_mano_obra        INTEGER NOT NULL,
    estado_idestado        INTEGER NOT NULL,
    orden_atencion_idorden INTEGER NOT NULL
);

CREATE UNIQUE INDEX servicio__idx ON
    servicio (
        estado_idestado
    ASC );

ALTER TABLE servicio ADD CONSTRAINT servicio_pk PRIMARY KEY ( idservicio );

CREATE TABLE vehiculo (
    patente     VARCHAR2(6 CHAR) NOT NULL,
    marca       VARCHAR2(50 CHAR) NOT NULL,
    modelo      VARCHAR2(50 CHAR) NOT NULL,
    anno        INTEGER NOT NULL,
    color       VARCHAR2(50 CHAR) NOT NULL,
    cliente_rut VARCHAR2(9 CHAR) NOT NULL
);

ALTER TABLE vehiculo ADD CONSTRAINT vehiculo_pk PRIMARY KEY ( patente );

ALTER TABLE estado
    ADD CONSTRAINT estado_servicio_fk FOREIGN KEY ( servicio_idservicio )
        REFERENCES servicio ( idservicio );

ALTER TABLE orden_atencion
    ADD CONSTRAINT orden_atencion_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );

ALTER TABLE orden_atencion
    ADD CONSTRAINT orden_atencion_vehiculo_fk FOREIGN KEY ( vehiculo_patente )
        REFERENCES vehiculo ( patente );

ALTER TABLE repuestos
    ADD CONSTRAINT repuestos_servicio_fk FOREIGN KEY ( servicio_idservicio )
        REFERENCES servicio ( idservicio );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_estado_fk FOREIGN KEY ( estado_idestado )
        REFERENCES estado ( idestado );

ALTER TABLE servicio
    ADD CONSTRAINT servicio_orden_atencion_fk FOREIGN KEY ( orden_atencion_idorden )
        REFERENCES orden_atencion ( idorden );

ALTER TABLE vehiculo
    ADD CONSTRAINT vehiculo_cliente_fk FOREIGN KEY ( cliente_rut )
        REFERENCES cliente ( rut );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             2
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
