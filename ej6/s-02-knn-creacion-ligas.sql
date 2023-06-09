--@Autor:           Najera Noyola Karla Andrea
--@Fecha creación:  08/06/2023
--@Descripción:     Creación de ligas para comunicación bidireccional

prompt Creando liga en knnbdd_s1 hacia knnbdd_s2
connect bancos_bdd/bancos_bdd@knnbdd_s1
create database link knnbdd_s2.fi.unam using 'KNNBDD_S2';

prompt Creando liga en knnbdd_s2 hacia knnbdd_s1
connect bancos_bdd/bancos_bdd@knnbdd_s2
create database link knnbdd_s1.fi.unam using 'KNNBDD_S1';

prompt Listo.
exit