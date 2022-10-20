/**********************************************************************************************************************
 * 
 * Script		: DDL_DROP PARA BORRADO DE LAS TABLAS
 * Autor		: MIGUEL GOMEZ - <gomezcasas.miguelangel@gmail.com>
 * Fecha		: 10/10/2022
 * Descripcion	: DDL PARA LA ELIMINACION DE LAS TABLAS DEL MODELO.
 *
***********************************************************************************************************************/

--BORRADO DE LA TABLA CM_CP_ANM
DROP TABLE CM_CP_ANM CASCADE CONSTRAINTS;

--BORRADO DE LA TABLA DEPARTAMENTOS
DROP TABLE DEPARTAMENTOS CASCADE CONSTRAINTS;

--BORRADO DE LA TABLA MUNICIPIOS
DROP TABLE MUNICIPIOS CASCADE CONSTRAINTS;