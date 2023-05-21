--@Autor: Karla Andrea Najera Noyola
--@Fecha creación: 19/05/2023
--@Descripción: Consultas para conteo de registros.

set linesize window

prompt Conectando a S1 - knnbdd_s1
connect bancos_bdd/bancos_bdd@knnbdd_s1
prompt Mostrando conteo...
select
  (select count(*) from f_knn_pais_1) as pais_1,
  (select count(*) from f_knn_banco_1) as banco_1,
  (select count(*) from f_knn_empleado_1) as empleado_1,
  (select count(*) from f_knn_sucursal_1) as sucursal_1,
  (select count(*) from f_knn_cuenta_1) as cuenta_1,
  (select count(*) from f_knn_cuenta_3) as cuenta_3,
  (select count(*) from f_knn_movimiento_2) as movimiento_2
from dual;

prompt Conectando a S1 - knnbdd_s2
connect bancos_bdd/bancos_bdd@knnbdd_s2
prompt Mostrando conteo...
select
  (select count(*) from f_knn_pais_2) as pais_2,
  (select count(*) from f_knn_banco_2) as banco_2,
  (select count(*) from f_knn_empleado_2) as empleado_2,
  (select count(*) from f_knn_sucursal_2) as sucursal_2,
  (select count(*) from f_knn_cuenta_2) as cuenta_2,
  (select count(*) from f_knn_cuenta_4) as cuenta_4,
  (select count(*) from f_knn_movimiento_1) as movimiento_1,
  (select count(*) from f_knn_movimiento_3) as movimiento_3
from dual;

Prompt Listo!