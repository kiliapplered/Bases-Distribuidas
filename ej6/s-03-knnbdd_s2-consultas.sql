--@Autor:           Najera Noyola Karla Andrea
--@Fecha creación:  08/06/2023
--@Descripción:     Creación de ligas para comunicación bidireccional S2

-- conectando a knnbdd_s2
connect bancos_bdd/bancos_bdd@knnbdd_s2

-- Realizando conteo de registros
set serveroutput on

--La consulta se lanza en KNNBDD_S2
declare
  v_num_paises number;
  v_num_bancos number;
  v_num_sucursales number;
  v_num_empleados number;
  v_num_cuentas number;
  v_num_movimientos number;
begin
  dbms_output.put_line('Realizando consulta empleando ligas');
  -- Consultando f_knn_pais
  select count(*) as into v_num_paises
  from (
    select pais_id
    from f_knn_pais_1@knnbdd_s1.fi.unam
    union all
    select pais_id
    from f_knn_pais_2
  ) q1;

  -- Consultando f_knn_banco
  select count(*) as into v_num_bancos
  from (
    select banco_id
    from f_knn_banco_1@knnbdd_s1.fi.unam
    union all
    select banco_id
    from f_knn_banco_2
  ) q2;

  -- Consultando f_knn_sucursal
  select count(*) as into v_num_sucursales
  from (
    select sucursal_id
    from f_knn_sucursal_1@knnbdd_s1.fi.unam
    union all
    select sucursal_id
    from f_knn_sucursal_2
  ) q3;

  -- Consultando f_knn_empleado
  select count(*) as into v_num_empleados
  from (
    select empleado_id
    from f_knn_empleado_1@knnbdd_s1.fi.unam
    union all
    select empleado_id
    from f_knn_empleado_2
  ) q4;

  -- Consultando f_knn_cuenta
  select count(*) as into v_num_cuentas
  from (
    select cuenta_id
    from f_knn_cuenta_3@knnbdd_s1.fi.unam
    union all
    select cuenta_id
    from f_knn_cuenta_4
  ) q5;

  -- Consultando f_knn_movimiento
  select count(*) as into v_num_movimientos
  from (
    select num_movimiento
    from f_knn_movimiento_2@knnbdd_s1.fi.unam
    union all
    select num_movimiento
    from f_knn_movimiento_1
    union all
    select num_movimiento
    from f_knn_movimiento_3
  ) q6;

  dbms_output.put_line('Resultado del conteo de registros');
  dbms_output.put_line('Paises: '||v_num_paises);
  dbms_output.put_line('Bancos: '||v_num_bancos);
  dbms_output.put_line('Sucursales: '||v_num_sucursales);
  dbms_output.put_line('Empleados: '||v_num_empleados);
  dbms_output.put_line('Cuentas: '||v_num_cuentas);
  dbms_output.put_line('Movimientos: '||v_num_movimientos);
end;
/

Prompt Listo
exit