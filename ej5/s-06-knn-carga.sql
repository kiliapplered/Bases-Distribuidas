--@Autor: Karla Andrea Najera Noyola
--@Fecha creación: 19/05/2023
--@Descripción: Archivo de carga inicial en knn-pc

Prompt Conectando a S1 - knnbdd_s1
connect bancos_bdd/bancos_bdd@knnbdd_s1
--si ocurre un error, la ejecución se detiene.
whenever sqlerror exit rollback;
Prompt limpiando...
delete from f_knn_pais_1;
delete from f_knn_banco_1;
delete from f_knn_empleado_1;
delete from f_knn_sucursal_1;
delete from f_knn_cuenta_1;
delete from f_knn_cuenta_3;
delete from f_knn_movimiento_2;

Prompt Cargando datos...
--PAIS
insert into f_knn_pais_1 (pais_id, clave, nombre, zona_economica)
  values (1, 'MX', 'MEXICO', 'A');
--BANCO
insert into f_knn_banco_1 (banco_id, clave, nombre)
  values (1, 'BB003', 'BANCOMER');
--EMPLEADO
insert into f_knn_empleado_1 (empleado_id, nombre, ap_paterno, ap_materno)
  values (1, 'JUAN', 'LOPEZ', 'LARA');
--SUCURSAL
insert into f_knn_sucursal_1 (sucursal_id, num_sucursal, banco_id, pais_id, gerente_id)
  values (1, 100, 1, 1, 1);
insert into f_knn_sucursal_1 (sucursal_id, num_sucursal, banco_id, pais_id, gerente_id)
  values (3, 300, 2, 1, 1);
--CUENTA
insert into f_knn_cuenta_1 (cuenta_id, saldo, nip)
  values (1, 45894.23, 1234);
insert into f_knn_cuenta_1 (cuenta_id, saldo, nip)
  values (2, 100500.56, 4321);
insert into f_knn_cuenta_3 (cuenta_id, num_cuenta, tipo_cuenta, sucursal_id)
  values (1, 800600400, 'D', 1);
--MOVIMIENTO
insert into f_knn_movimiento_2 (num_movimiento, cuenta_id, fecha_movimiento, tipo_movimiento, importe, descripcion, comprobante)
  values (2, 1, to_date('01/01/2015 12:00:15', 'DD/MM/YYYY HH24:MI:SS'), 'D', 500596.25, 'PAGO BONO PRODUCTIVIDAD', empty_blob());
commit;

Prompt Conectando a S2 - knnbdd_s2
connect bancos_bdd/bancos_bdd@knnbdd_s2
--si ocurre un error, la ejecución se detiene.
whenever sqlerror exit rollback;
Prompt limpiando...
delete from f_knn_pais_2;
delete from f_knn_banco_2;
delete from f_knn_empleado_2;
delete from f_knn_sucursal_2;
delete from f_knn_cuenta_2;
delete from f_knn_cuenta_4;
delete from f_knn_movimiento_1;
delete from f_knn_movimiento_3;

Prompt Cargando datos...
--PAIS
insert into f_knn_pais_2 (pais_id, clave, nombre, zona_economica)
  values (2, 'JAP', 'JAPON', 'B');
--BANCO
insert into f_knn_banco_2 (banco_id, clave, nombre)
  values (2, 'SS032', 'SCOTIABANK');
--EMPLEADO
insert into f_knn_empleado_2 (empleado_id, nombre, ap_paterno, ap_materno, folio_certificacion, jefe_id)
  values (2, 'CARLOS', 'BAEZ', 'AGUIRRE', 900200, 1);
--SUCURSAL
insert into f_knn_sucursal_2 (sucursal_id, num_sucursal, banco_id, pais_id, gerente_id)
  values (2, 200, 1, 2, 2);
insert into f_knn_sucursal_2 (sucursal_id, num_sucursal, banco_id, pais_id, gerente_id)
  values (4, 400, 2, 2, 2);
--CUENTA
insert into f_knn_cuenta_2 (cuenta_id, contrato)
  values (1, empty_blob());
insert into f_knn_cuenta_2 (cuenta_id, contrato)
  values (2, empty_blob());
insert into f_knn_cuenta_4 (cuenta_id, num_cuenta, tipo_cuenta, sucursal_id)
  values (2, 900700500, 'V', 4);
--MOVIMIENTO
insert into f_knn_movimiento_1 (num_movimiento, cuenta_id, fecha_movimiento, tipo_movimiento, importe, descripcion, comprobante)
  values (1, 1, to_date('01/01/1980 14:55:31', 'DD/MM/YYYY HH24:MI:SS'), 'D', 85745.56, 'PAGO AGUINALDO', empty_blob());
insert into f_knn_movimiento_3 (num_movimiento, cuenta_id, fecha_movimiento, tipo_movimiento, importe, descripcion, comprobante)
  values (3, 2, to_date('01/01/2016 19:05:04', 'DD/MM/YYYY HH24:MI:SS'), 'R', 40200.32, 'RETIRO LETRA AUTO', empty_blob());
commit;

Prompt Listo!