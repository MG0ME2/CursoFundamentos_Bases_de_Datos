/**********************************************************************************************************************
 * 
 * Script		: Instalacion_Automatica
 * Autor		: MIGUEL GOMEZ - <gomezcasas.miguelangel@gmail.com>
 * Fecha		: 16/10/2022
 * Descripcion	: SCRIPT PARA INSTALACION AUTOMATICA DE LOS DDL Y DML DEL MODELO.
 *
***********************************************************************************************************************/

column dt new_value vdt
column db new_value vdb
select to_char(sysdate,'yyyymmdd_hh24miss') dt, sys_context('userenv','db_name') db from dual;
spool &vdb._logSAO1_&vdt.txt
set serveroutput on
set timing on
execute dbms_application_info.set_action('APLICANDO SAO2');
prompt Inicio Proceso!!
select to_char(sysdate,'yyyy-mm-dd hh:mi:ss p.m.') fecha_inicio from dual;

prompt "------------------------------------------------------"
prompt " APLICANDO Instalacion_Automatica.sql "
prompt "------------------------------------------------------"

prompt "************ Aplicando TABLAS ************"
prompt "Aplicando /1_TABLAS/1_DDL_TABLAS"
@./1_TABLAS/1_DDL_TABLAS.sql

prompt "Aplicando /1_TABLAS/2_DDL_INDEX.SQL"
@./1_TABLAS/2_DDL_INDEX.sql

prompt "************ Aplicando INSERTS ************"
prompt "Aplicando 2_INSERTS/1_DML_DEPARTAMENTOS.SQL"
@./2_INSERTS/1_DML_DEPARTAMENTOS.sql

prompt "Aplicando 2_INSERTS/2_DML_MUNICIPIOS.SQL"
@./2_INSERTS/2_DML_MUNICIPIOS.sql

prompt "Aplicando 2_INSERTS/3_DML_CM_CP_ANM.SQL"
@./2_INSERTS/3_DML_CM_CP_ANM.sql

prompt "------------------------------------------------------"
prompt " FIN DE APLICA Instalacion_Automatica.sql "
prompt "------------------------------------------------------"
commit;

select to_char(sysdate,'yyyy-mm-dd hh:mi:ss p.m.') fecha_fin from dual;
prompt Fin Proceso!!
set timing off
set serveroutput off
spool off
