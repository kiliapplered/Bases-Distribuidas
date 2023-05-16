--@Autor: Karla Andrea Najera Noyola
--@Fecha creación: dd/mm/yyyy
--@Descripción: Consulta de restricciones de referencia en jrc-pc

Prompt Conectando a S1 - knnbdd_s1
connect bancos_bdd/bancos_bdd@knnbdd_s1
--ejecuta la misma consulta en ambas pdbs
@s-05-knn-consulta-restricciones.sql

Prompt Conectando a S2 - knnbdd_s2
connect bancos_bdd/bancos_bdd@knnbdd_s1
--ejecuta la misma consulta en ambas pdbs
@s-05-knn-consulta-restricciones.sql

Prompt Listo!
exit