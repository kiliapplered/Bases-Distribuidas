--@Autor: Karla Andrea Najera Noyola
--@Fecha creación: 15/05/2023
--@Descripción: Creación de usuarios para la máquina pc-knn.

prompt Conectándose a knnbdd_s1 como usuario SYS
connect sys@knnbdd_s1 as sysdba

prompt Creando usuario bancos_bdd y asignando privilegios
create user bancos_bdd identified by karla quota unlimited on users;
grant create session, create table, create procedure, create sequence to bancos_bdd;

prompt conectándose a knnbdd_s2 como usuario SYS
connect sys@knnbdd_s2 as sysdba

prompt creando usuario bancos_bdd
create user bancos_bdd identified by karla quota unlimited on users;
grant create session, create table, create procedure, create sequence to bancos_bdd;

prompt Listo
exit