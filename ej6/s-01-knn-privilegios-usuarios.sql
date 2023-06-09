--@Autor:           Najera Noyola Karla Andrea
--@Fecha creación:  08/06/2023
--@Descripción:     Otorgar permisos a usuario de la práctica anterior

prompt Conectándose a knnbdd_s1 como usuario SYS
connect sys/system@knnbdd_s1 as sysdba
set serveroutput on
prompt Otorgando permisos a bancos_bdd en knnbdd_s1
grant create database link, create procedure to bancos_bdd;
prompt EXITO


prompt Conectándose a knnbdd_s2 como usuario SYS
connect sys/system@knnbdd_s2 as sysdba
set serveroutput on
prompt Otorgando permisos a bancos_bdd en knnbdd_s2
grant create database link, create procedure to bancos_bdd;
prompt EXIT