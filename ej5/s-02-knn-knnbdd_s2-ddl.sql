--@Autor: Karla Andrea Najera Noyola
--@Fecha creación: 15/05/2023
--@Descripción: Implementación de fragmentos para knnbdd_s2

prompt Creando tabla f_knn_pais_2 en S2
create table f_knn_pais_2(
  pais_id         number(4,0)   not null,
  clave           varchar2(5)   not null,
  nombre          varchar2(100) not null,
  zona_economica  char(1)       not null,
  constraint f_knn_pais_2_pk primary key (pais_id)
);

prompt Creando tabla f_knn_sucursal_2 en S2
create table f_knn_sucursal_2(
  sucursal_id   number(10,0)  not null,
  num_sucursal  number(3,0)   not null,
  banco_id      number(5,0)   not null,
  pais_id       number(4,0)   not null,
  gerente_id    number(10,0)  not null,
  constraint f_knn_sucursal_2_pk primary key (sucursal_id),
  constraint sucursal_2_pais_2_id_fk foreign key (pais_id)
  references f_knn_pais_2 (pais_id)
);

prompt Creando tabla f_knn_cuenta_4 en S2
create table f_knn_cuenta_4(
  cuenta_id   number(10,0)  not null,
  sucursal_id number(10,0)  not null,
  num_cuenta  varchar2(18)  not null,
  tipo_cuenta char(1)       not null,
  constraint f_knn_cuenta_4_pk primary key (cuenta_id),
  constraint cuenta_4_sucursal_2_id_fk foreign key (sucursal_id)
  references f_knn_sucursal_2 (sucursal_id)
);

prompt Creando tabla f_knn_movimiento_3 en S2
create table f_knn_movimiento_3(
  num_movimiento    number(10,0)    not null,
  cuenta_id         number(10,0)    not null,
  fecha_movimiento  date            not null,
  tipo_movimiento   char(1)         not null,
  importe           number(18,2)    not null,
  descripcion       varchar2(2000)  not null,
  comprobante       blob            null,
  constraint f_knn_movimiento_3_pk primary key (num_movimiento, cuenta_id),
  constraint movimiento_3_cuenta_4_id_fk foreign key (cuenta_id)
  references f_knn_cuenta_4 (cuenta_id)
);

prompt Creando tabla f_knn_banco_2 en S2
create table f_knn_banco_2(
  banco_id  number(5,0)   not null,
  clave     varchar2(10)  not null,
  nombre    varchar2(40)  not null,
  constraint f_knn_banco_2_pk primary key (banco_id)
);

prompt Creando tabla f_knn_cuenta_2 en S2
create table f_knn_cuenta_2(
  cuenta_id number(10,0)  not null,
  contrato  blob          not null,
  constraint f_knn_cuenta_2_pk primary key (cuenta_id)
);

prompt Creando tabla f_knn_movimiento_1 en S2
create table f_knn_movimiento_1(
  num_movimiento    number(10,0)    not null,
  cuenta_id         number(10,0)    not null,
  fecha_movimiento  date            not null,
  tipo_movimiento   char(1)         not null,
  importe           number(18,2)    not null,
  descripcion       varchar2(2000)  not null,
  comprobante       blob            null,
  constraint f_knn_movimiento_1_pk primary key (num_movimiento, cuenta_id),
  constraint movimiento_1_cuenta_2_id_fk foreign key (cuenta_id)
  references f_knn_cuenta_2 (cuenta_id)
);

prompt Creando tabla f_knn_empleado_2 en S2
create table f_knn_empleado_2(
  empleado_id         number(10,0)  not null,
  nombre              varchar2(40)  not null,
  ap_paterno          varchar2(40)  not null,
  ap_materno          varchar2(40)  not null,
  folio_certificacion varchar2(10)  null,
  jefe_id             number(10,0)  null,
  constraint f_knn_empleado_1_pk primary key (empleado_id)
);

prompt S2 con tablas creadas