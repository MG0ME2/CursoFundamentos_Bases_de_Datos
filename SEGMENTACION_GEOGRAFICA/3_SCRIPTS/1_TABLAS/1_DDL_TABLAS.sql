/**********************************************************************************************************************
 * 
 * Script		: DDL - TABLAS
 * Autor		: MIGUEL GOMEZ - <gomezcasas.miguelangel@gmail.com>
 * Fecha		: 10/10/2022
 * Descripcion	: DDL PARA LA CREACION DE LAS TABLAS DEL MODELO.
 *
***********************************************************************************************************************/

--CREACION DE LA TABLA CM_CP_ANM 
CREATE TABLE CM_CP_ANM (
  ID                   number(10) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 1000 NOORDER  NOCYCLE  NOT NULL ENABLE, 
  CODIGO               varchar2(10) NOT NULL, 
  NOMBRE               varchar2(100) NOT NULL, 
  TIPO                 varchar2(20) NOT NULL, 
  MUNICIPIO_ID         number(10) NOT NULL, 
  ACTIVO               number(1) NOT NULL, 
  USUARIO_CREACION     varchar2(50) NOT NULL, 
  FECHA_CREACION       date NOT NULL, 
  USUARIO_MODIFICACION varchar2(50) NOT NULL, 
  FECHA_MODIFICACION   date NOT NULL, 
  PRIMARY KEY (ID));
--CREACION COMENTARIOS PARA LA TABLA CM_CP_ANM
COMMENT ON TABLE CM_CP_ANM IS 'TABLA DE REGISTROS DE AM,CP, ANM';
COMMENT ON COLUMN CM_CP_ANM.ID IS 'Identificador unico de cada registro';
COMMENT ON COLUMN CM_CP_ANM.CODIGO IS 'codigo unico asignado a cada cm, cp o anm';
COMMENT ON COLUMN CM_CP_ANM.NOMBRE IS 'nombre del cm, cp o anm';
COMMENT ON COLUMN CM_CP_ANM.TIPO IS 'Tipo de categorizacion: CM (Cabecera municipal), CP (Centro poblado), ANM (�rea no municipalizada).';
COMMENT ON COLUMN CM_CP_ANM.MUNICIPIO_ID IS 'clave foranea de la tabla municipios';
COMMENT ON COLUMN CM_CP_ANM.ACTIVO IS 'estado del registro activo o inactivo';
COMMENT ON COLUMN CM_CP_ANM.USUARIO_CREACION IS 'usuario que Creo el registro';
COMMENT ON COLUMN CM_CP_ANM.FECHA_CREACION IS 'fecha en la que se Creo el registro';
COMMENT ON COLUMN CM_CP_ANM.USUARIO_MODIFICACION IS 'usuario que Actualizo el registro';
COMMENT ON COLUMN CM_CP_ANM.FECHA_MODIFICACION IS 'fecha en la que se Actualizo el registro';

--CREACION DE LA TABLA DEPARTAMENTOS
CREATE TABLE DEPARTAMENTOS (
  DEPARTAMENTO_ID      number(10) GENERATED AS IDENTITY, 
  CODIGO               varchar2(10) NOT NULL, 
  NOMBRE               varchar2(100) NOT NULL, 
  ACTIVO               number(1) NOT NULL, 
  USUARIO_CREACION     varchar2(50) NOT NULL, 
  FECHA_CREACION       date NOT NULL, 
  USUARIO_MODIFICACION varchar2(50) NOT NULL, 
  FECHA_MODIFICACION   date NOT NULL,
  PRIMARY KEY (DEPARTAMENTO_ID));
--CREACION COMENTARIOS PARA LA TABLA DEPARTAMENTOS
COMMENT ON TABLE DEPARTAMENTOS IS 'TABLA DE REGISTROS DE DEPARTAMENTOS';
COMMENT ON COLUMN DEPARTAMENTOS.DEPARTAMENTO_ID IS 'Identificador unico de cada registro';
COMMENT ON COLUMN DEPARTAMENTOS.CODIGO IS 'codigo unico asignado a cada deparrtamento';
COMMENT ON COLUMN DEPARTAMENTOS.NOMBRE IS 'nombre del departamento';
COMMENT ON COLUMN DEPARTAMENTOS.ACTIVO IS 'estado del registro activo o inactivo';
COMMENT ON COLUMN DEPARTAMENTOS.USUARIO_CREACION IS 'usuario que Creo el registro';
COMMENT ON COLUMN DEPARTAMENTOS.FECHA_CREACION IS 'fecha en la que se Creo el registro';
COMMENT ON COLUMN DEPARTAMENTOS.USUARIO_MODIFICACION IS 'usuario que Actualizo el registro';
COMMENT ON COLUMN DEPARTAMENTOS.FECHA_MODIFICACION IS 'fecha en la que se Actualizo el registro';

--CREACION DE LA TABLA MUNICIPIOS
CREATE TABLE MUNICIPIOS (
  MUNICIPIO_ID         number(10) GENERATED AS IDENTITY, 
  CODIGO               varchar2(10) NOT NULL, 
  NOMBRE               varchar2(100) NOT NULL, 
  TIPO                 varchar2(30) NOT NULL, 
  DEPARTAMENTO_ID      number(10) NOT NULL, 
  ACTIVO               number(1) NOT NULL, 
  USUARIO_CREACION     varchar2(50) NOT NULL, 
  FECHA_CREACION       date NOT NULL, 
  USUARIO_MODIFICACION varchar2(50) NOT NULL, 
  FECHA_MODIFICACION   date NOT NULL,
  PRIMARY KEY (MUNICIPIO_ID));
--CREACION COMENTARIOS PARA LA TABLA MUNICIPIOS
COMMENT ON TABLE MUNICIPIOS IS 'TABLA DE REGISTROS DE MUNICIPIOS';
COMMENT ON COLUMN MUNICIPIOS.MUNICIPIO_ID IS 'Identificador unico de cada registro';
COMMENT ON COLUMN MUNICIPIOS.CODIGO IS 'codigo unico asignado a cada municipio';
COMMENT ON COLUMN MUNICIPIOS.NOMBRE IS 'nombre del municipio';
COMMENT ON COLUMN MUNICIPIOS.TIPO IS 'Tipo de categorizacion: Municipio, Isla, �rea no municipalizada';
COMMENT ON COLUMN MUNICIPIOS.DEPARTAMENTO_ID IS 'clave foranea de la tabla departamentos';
COMMENT ON COLUMN MUNICIPIOS.ACTIVO IS 'estado del registro activo o inactivo';
COMMENT ON COLUMN MUNICIPIOS.USUARIO_CREACION IS 'usuario que Creo el registro';
COMMENT ON COLUMN MUNICIPIOS.FECHA_CREACION IS 'fecha en la que se Creo el registro';
COMMENT ON COLUMN MUNICIPIOS.USUARIO_MODIFICACION IS 'usuario que Actualizo el registro';
COMMENT ON COLUMN MUNICIPIOS.FECHA_MODIFICACION IS 'fecha en la que se Actualizo el registro';

--ALTERACION DE LAS TABLAS PARA AGREGAR LOS CONSTRAINT
ALTER TABLE MUNICIPIOS ADD CONSTRAINT FKMUNICIPIOS933285 FOREIGN KEY (DEPARTAMENTO_ID) REFERENCES DEPARTAMENTOS (DEPARTAMENTO_ID);
ALTER TABLE CM_CP_ANM ADD CONSTRAINT FKCM_CP_ANM968143 FOREIGN KEY (MUNICIPIO_ID) REFERENCES MUNICIPIOS (MUNICIPIO_ID);
