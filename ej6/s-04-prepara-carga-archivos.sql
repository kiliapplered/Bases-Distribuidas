--@Autor:           Najera Noyola Karla Andrea
--@Fecha creación:  08/06/2023
--@Descripción:     Carga de blobs en BDD

whenever sql exit rollback;

!mkdir -p /tmp/bdd/p06

!chmod 744 /unam-bdd/ej6/m_archivo*.pdf

!cp /unam-bdd/ej06/m_archivo*.pdf /tmp/bdd/p06

!chmod -R 777 /tmp/bdd

--ruta donde se ubicarán los archivos PDFs
define p_pdf_path='/tmp/bdd/p06'
set verify off

Prompt Limpiando y creando directorio en /tmp/bdd/p06
!rm -rf &p_pdf_path
!mkdir -p &p_pdf_path
!chmod 777 &p_pdf_path

-- Se asume que los archivos PDF se encuentran en el mismo directorio donde se
-- ejecuta este script.
!cp /unam-bdd/ej6/m_archivo_*.pdf &p_pdf_path
!chmod 755 &p_pdf_path/m_archivo_*.pdf

--knnbdd_s1
Prompt conectando a knnbdd_s1 como SYS para crear objetos tipo directory
accept p_sys_password default 'system' prompt 'Password de sys [system]: ' hide
connect sys@knnbdd_s1/&p_sys_password as sysdba

Prompt creando un objeto DIRECTORY para acceder al directorio /tmp/bdd/p06
create or replace directory tmp_dir as '&p_pdf_path';
grant read,write on directory tmp_dir to bancos_bdd;

--knnbdd_s2
Prompt conectando a knnbdd_s1 como SYS para crear objetos tipo directory
accept p_sys_password default 'system' prompt 'Password de sys [system]: ' hide
connect sys@knnbdd_s2/&p_sys_password as sysdba

Prompt creando un objeto DIRECTORY para acceder al directorio /tmp/bdd/p06
create or replace directory tmp_dir as '&p_pdf_path';
grant read,write on directory tmp_dir to bancos_bdd;

------------------ Cargando datos en knnbdd_s1 ----------------------
Prompt conectando a knnbdd_s1 con usuario bancos_bdd para cargar datos binarios
connect bancos_bdd/bancos_bdd@knnbdd_s1

/*
En este sitio se cargarán los siguientes archivos.
F_KNN_MOVIMIENTO_2
NUM_MOVIMIENTO CUENTA_ID  COMPROBANTE
-------------- ---------- -----------
       2           1      m_archivo_4.pdf
*/

Prompt ejecutando procedimientos para hacer import/export de datos BLOB
@s-00-carga-blob-en-bd.sql
@s-00-guarda-blob-en-archivo.sql

Prompt cargando datos binarios.
begin
  carga_blob_en_bd('TMP_DIR','m_archivo_4.pdf','f_knn_movimiento_2',
    'comprobante','num_movimiento','2','cuenta_id','1');
end;
/

Prompt mostrando el tamaño de los objetos BLOB en BD.
Prompt Para f_knn_movimiento_2:
select cuenta_id,num_movimiento,dbms_lob.getlength(comprobante) as longitud
from f_knn_movimiento_2;

Prompt salvando datos BLOB en directorio TMP_DIR
begin
  guarda_blob_en_archivo('TMP_DIR','m_export_archivo_4.pdf','f_knn_movimiento_2',
    'comprobante','num_movimiento','2','cuenta_id','1');
end;
/

Prompt mostrando el contenido del directorio para validar la existencia del archivo.
!ls -l &p_pdf_path/m_export_archivo_*.pdf


------------------ Cargando datos en knnbdd_s2 ----------------------

Prompt conectando a knnbdd_s2 con usuario bancos_bdd para cargar datos binarios
connect bancos_bdd/bancos_bdd@knnbdd_s2

/*
En este sitio se cargarán los siguientes archivos:

F_KNN_MOVIMIENTO_1
NUM_MOVIMIENTO CUENTA_ID  COMPROBANTE
-------------- ---------- -----------
       1           1      m_archivo_3.pdf

F_KNN_MOVIMIENTO_3
NUM_MOVIMIENTO CUENTA_ID  COMPROBANTE
-------------- ---------- -----------
       3           2      m_archivo_5.pdf


F_KNN_CUENTA_2
CUENTA_ID  CONTRATO
---------  -----------
    1      m_archivo_1.pdf
    2      m_archivo_2.pdf
*/

Prompt ejecutando procedimientos para hacer import/export de datos BLOB
@s-00-carga-blob-en-bd.sql
@s-00-guarda-blob-en-archivo.sql

Prompt cargando datos binarios.
begin
  carga_blob_en_bd('TMP_DIR','m_archivo_1.pdf','f_knn_cuenta_2',
    'contrato','cuenta_id','1',null,null);
  carga_blob_en_bd('TMP_DIR','m_archivo_2.pdf','f_knn_cuenta_2',
    'contrato','cuenta_id','2',null,null);
  carga_blob_en_bd('TMP_DIR','m_archivo_3.pdf','f_knn_movimiento_1',
    'comprobante','num_movimiento','1','cuenta_id','1');
  carga_blob_en_bd('TMP_DIR','m_archivo_5.pdf','f_knn_movimiento_3',
    'comprobante','num_movimiento','3','cuenta_id','2');
end;
/

Prompt mostrando el tamaño de los objetos BLOB en BD.
Prompt Para f_knn_cuenta_2:
select cuenta_id,dbms_lob.getlength(contrato) as longitud
from f_knn_cuenta_2;
Prompt Para f_knn_movimiento_1:
select cuenta_id,num_movimiento,dbms_lob.getlength(comprobante) as longitud
from f_knn_movimiento_1;
Prompt Para f_knn_movimiento_3:
select cuenta_id,num_movimiento,dbms_lob.getlength(comprobante) as longitud
from f_knn_movimiento_3;

Prompt salvando datos BLOB en directorio TMP_DIR
begin
  guarda_blob_en_archivo('TMP_DIR','m_export_archivo_1.pdf','f_knn_cuenta_2',
    'contrato','cuenta_id','1',null,null);
  guarda_blob_en_archivo('TMP_DIR','m_export_archivo_2.pdf','f_knn_cuenta_2',
    'contrato','cuenta_id','2',null,null);
  guarda_blob_en_archivo('TMP_DIR','m_export_archivo_3.pdf','f_knn_movimiento_1',
    'comprobante','num_movimiento','1','cuenta_id','1');
  guarda_blob_en_archivo('TMP_DIR','m_export_archivo_5.pdf','f_knn_movimiento_3',
    'comprobante','num_movimiento','3','cuenta_id','2');
end;
/

Prompt mostrando el contenido del directorio para validar la existencia del archivo.
!ls -l &p_pdf_path/m_export_archivo_*.pdf

Prompt Listo!
disconnect