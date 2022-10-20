/**********************************************************************************************************************
 * 
 * Script		: DML_CONSULTAS
 * Autor		: MIGUEL GOMEZ - <gomezcasas.miguelangel@gmail.com>
 * Fecha		: 18/10/2022
 * Descripcion	: DML PARA CONSULTAR LOS DATOS DEL MODELO.
 *
***********************************************************************************************************************/

--TABLA DEPARTAMENTOS
SELECT CODIGO
      ,NOMBRE
  FROM DEPARTAMENTOS;
  
--TABLA MUNICIPIOS
SELECT DEP.CODIGO   CODIGO_DEP
      ,DEP.NOMBRE   NOMBRE_DEP
      ,MUN.CODIGO   CODIGO_MUN
      ,MUN.NOMBRE   NOMBRE_MUN
      ,MUN.TIPO     TIPO_MUN
  FROM MUNICIPIOS   MUN
  JOIN DEPARTAMENTOS DEP
 USING (DEPARTAMENTO_ID);
 
--TABLA Cabeceras municipales y centros poblados
SELECT DEP.CODIGO   CODIGO_DEP
      ,DEP.NOMBRE   NOMBRE_DEP
      ,MUN.CODIGO   CODIGO_MUN
      ,MUN.NOMBRE   NOMBRE_MUN
      ,MUN.TIPO     TIPO_MUN
      ,CP.CODIGO    CODIGO_CP
      ,CP.NOMBRE    NOMBRE_CP
      ,CP.TIPO      TIPO_CP
  FROM CM_CP_ANM    CP
 INNER JOIN MUNICIPIOS    MUN
       ON (CP.MUNICIPIO_ID = MUN.MUNICIPIO_ID)
 INNER JOIN DEPARTAMENTOS DEP
       ON (MUN.DEPARTAMENTO_ID = DEP.DEPARTAMENTO_ID);
       
/******************************************************************************/

-- Consulta para filtar los MUNICIPIOS por la letra B
SELECT DEP.CODIGO   CODIGO_DEP
      ,DEP.NOMBRE   NOMBRE_DEP
      ,MUN.CODIGO   CODIGO_MUN
      ,MUN.NOMBRE   NOMBRE_MUN
      ,MUN.TIPO     TIPO_MUN
  FROM MUNICIPIOS   MUN
  JOIN DEPARTAMENTOS DEP
 USING (DEPARTAMENTO_ID)
 WHERE MUN.NOMBRE LIKE 'B%';
 
-- Consulta para buscar el DEPARTAMENTO por su respectivo Codigo.
SELECT CODIGO
      ,NOMBRE
  FROM DEPARTAMENTOS
 WHERE CODIGO = '41';
 
-- Consulta para buscar la Cabecera municipal o el centro poblado por su respectivo Codigo.
SELECT DEP.CODIGO   CODIGO_DEP
      ,DEP.NOMBRE   NOMBRE_DEP
      ,MUN.CODIGO   CODIGO_MUN
      ,MUN.NOMBRE   NOMBRE_MUN
      ,MUN.TIPO     TIPO_MUN
      ,CP.CODIGO    CODIGO_CP
      ,CP.NOMBRE    NOMBRE_CP
      ,CP.TIPO      TIPO_CP
  FROM CM_CP_ANM    CP
 INNER JOIN MUNICIPIOS    MUN
       ON (CP.MUNICIPIO_ID = MUN.MUNICIPIO_ID)
 INNER JOIN DEPARTAMENTOS DEP
       ON (MUN.DEPARTAMENTO_ID = DEP.DEPARTAMENTO_ID)
 WHERE CP.CODIGO = '13473016';
 
-- consulta con una Sub-Consulta para obtener las Cabeceras municipales y centros poblados de Departamento Especifico
SELECT DEP.CODIGO   CODIGO_DEP
      ,DEP.NOMBRE   NOMBRE_DEP
      ,MUN.CODIGO   CODIGO_MUN
      ,MUN.NOMBRE   NOMBRE_MUN
      ,MUN.TIPO     TIPO_MUN
      ,CP.CODIGO    CODIGO_CP
      ,CP.NOMBRE    NOMBRE_CP
      ,CP.TIPO      TIPO_CP
  FROM CM_CP_ANM    CP
 INNER JOIN MUNICIPIOS    MUN
       ON (CP.MUNICIPIO_ID = MUN.MUNICIPIO_ID)
 INNER JOIN DEPARTAMENTOS DEP
       ON (MUN.DEPARTAMENTO_ID = DEP.DEPARTAMENTO_ID)
 WHERE DEP.NOMBRE = (SELECT NOMBRE
                       FROM DEPARTAMENTOS
                      WHERE CODIGO = '20')
 ORDER BY CP.NOMBRE ASC;
 
--Consulta para obtener el Total de los MUNICIPIOS por cada DEPARTAMENTO
SELECT DEP.CODIGO        CODIGO_DEP
      ,DEP.NOMBRE        NOMBRE_DEP
      ,COUNT(MUN.CODIGO) TOTAL_MUNICIPIOS
  FROM MUNICIPIOS    MUN
  JOIN DEPARTAMENTOS DEP
 USING (DEPARTAMENTO_ID)
 GROUP BY DEP.CODIGO 
         ,DEP.NOMBRE
 ORDER BY DEP.NOMBRE;

-- Consulta con una Sub-Consulta para obtener los departamentos que tienen mas de 30 MUNICIPIOS
SELECT CODIGO_DEP
      ,NOMBRE_DEP
  FROM (SELECT DEP.CODIGO       CODIGO_DEP
              ,DEP.NOMBRE        NOMBRE_DEP
              ,COUNT(MUN.CODIGO) TOTAL_MUNICIPIOS
          FROM MUNICIPIOS    MUN
          JOIN DEPARTAMENTOS DEP
         USING (DEPARTAMENTO_ID) 
         GROUP BY DEP.CODIGO 
                 ,DEP.NOMBRE) SUB_CONSULTA
 GROUP BY CODIGO_DEP
         ,NOMBRE_DEP
HAVING MAX(TOTAL_MUNICIPIOS) > 30
 ORDER BY NOMBRE_DEP DESC;

