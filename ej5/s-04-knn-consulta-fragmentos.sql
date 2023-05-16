--@Autor: Karla Andrea Najera Noyola
--@Fecha creación: 15/05/2023
--@Descripción: Consulta de fragmentos creados en knn-pc

Prompt Conectando a S1 - knnbdd_s1
connect bancos_bdd/bancos_bdd@knnbdd_s1

Prompt mostrando lista de fragmentos
select table_name from user_tables;

Prompt Conectando a S2 - knnbdd_s2
connect bancos_bdd/bancos_bdd@knnbdd_s2

Prompt mostrando lista de fragmentos
select table_name from user_tables;

Prompt Listo!
exit