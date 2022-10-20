/**********************************************************************************************************************
  * 
 * Script		: DDL_INDEX - TABLAS
 * Autor		: MIGUEL GOMEZ - <gomezcasas.miguelangel@gmail.com>
 * Fecha		: 10/10/2022
 * Descripcion	: DDL PARA LA CREACION DE LOS INDEX EN LAS COLUMNAS NECESARIAS DE CADA TABLA DEL MODELO.
 *
***********************************************************************************************************************/

CREATE UNIQUE INDEX CODIGO_CM_CP_ANM ON CM_CP_ANM (UPPER(CODIGO));

/
CREATE UNIQUE INDEX CODIGO_MUNICIPIO ON MUNICIPIOS (UPPER(CODIGO));

/
CREATE UNIQUE INDEX CODIGO_DEPARTAMENTO ON DEPARTAMENTOS (UPPER(CODIGO));