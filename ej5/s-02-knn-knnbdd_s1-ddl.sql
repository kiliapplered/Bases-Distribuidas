--@Autor: Karla Andrea Najera Noyola
--@Fecha creación: 15/05/2023
--@Descripción: Implementación de fragmentos para knnbdd_s1

prompt Creando tabla f_knn_pais_1 en S1
create table f_knn_pais_1(
  pais_id         number(4,0)   not null,
  clave           varchar2(5)   not null,
  nombre          varchar2(100) not null,
  zona_economica  char(1)       not null,
  constraint f_knn_pais_1_pk primary key (pais_id)
);

prompt Creando tabla f_knn_sucursal_1 en S1
create table f_knn_sucursal_1(
  sucursal_id   number(10,0)  not null,
  num_sucursal  number(3,0)   not null,
  banco_id      number(5,0)   not null,
  pais_id       number(4,0)   not null,
  gerente_id    number(10,0)  not null,
  constraint f_knn_sucursal_1_pk primary key (sucursal_id),
  constraint sucursal_1_pais_1_id_fk foreign key (pais_id)
  references f_knn_pais_1 (pais_id)
);

prompt Creando tabla f_knn_cuenta_3 en S1
create table f_knn_cuenta_3(
  cuenta_id   number(10,0)  not null,
  sucursal_id number(10,0)  not null,
  num_cuenta  varchar2(18)  not null,
  tipo_cuenta char(1)       not null,
  constraint f_knn_cuenta_3_pk primary key (cuenta_id),
  constraint cuenta_3_sucursal_1_id_fk foreign key (sucursal_id)
  references f_knn_sucursal_1 (sucursal_id)
);

prompt Creando tabla f_knn_movimiento_2 en S1
create table f_knn_movimiento_2(
  num_movimiento    number(10,0)    not null,
  cuenta_id         number(10,0)    not null,
  fecha_movimiento  date            not null,
  tipo_movimiento   char(1)         not null,
  importe           number(18,2)    not null,
  descripcion       varchar2(2000)  not null,
  comprobante       blob            null,
  constraint f_knn_movimiento_2_pk primary key (num_movimiento, cuenta_id),
  constraint movimiento_2_cuenta_3_id_fk foreign key (cuenta_id)
  references f_knn_cuenta_3 (cuenta_id)
);

prompt Creando tabla f_knn_banco_1 en S1
create table f_knn_banco_1(
  banco_id  number(5,0)   not null,
  clave     varchar2(10)  not null,
  nombre    varchar2(40)  not null,
  constraint f_knn_banco_1_pk primary key (banco_id)
);

prompt Creando tabla f_knn_cuenta_1 en S1
create table f_knn_cuenta_1(
  cuenta_id number(10,0)  not null,
  saldo     number(18,2)  not null,
  nip       number(4,0)   not null,
  constraint f_knn_cuenta_1_pk primary key (cuenta_id)
);

prompt Creando tabla f_knn_empleado_1 en S1
create table f_knn_empleado_1(
  empleado_id         number(10,0)  not null,
  nombre              varchar2(40)  not null,
  ap_paterno          varchar2(40)  not null,
  ap_materno          varchar2(40)  not null,
  folio_certificacion varchar2(10)  null,
  jefe_id             number(10,0)  null,
  constraint f_knn_empleado_1_pk primary key (empleado_id)
);

prompt S1 con tablas creadas