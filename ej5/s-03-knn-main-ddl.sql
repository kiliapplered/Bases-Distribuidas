--@Autor: Karla Andrea Najera Noyola
--@Fecha creación: 15/05/2023
--@Descripción: Creación de tablas en las PDBs

Prompt Conectando a S1 - knnbdd_s1
connect bancos_bdd/bancos_bdd@knnbdd_s1

Prompt Ejecutando scripts de creación de tablas
@s-02-knn-knnbdd_s1-ddl.sql

Prompt Conectando a S2 - knnbdd_s2
connect bancos_bdd/bancos_bdd@knnbdd_s2

Prompt Ejecutando scripts de creación de tablas
@s-02-knn-knnbdd_s2-ddl.sql

Prompt Listo!
exit