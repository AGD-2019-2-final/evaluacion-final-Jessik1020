-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        birthday, 
--        DATE_FORMAT(birthday, "yyyy"),
--        DATE_FORMAT(birthday, "yy"),
--    FROM 
--        persons
--    LIMIT
--        5;
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD '*.csv' USING PigStorage(',') AS 
(id:INT,
nombre:CHARARRAY,
apellido:CHARARRAY,
fecha:CHARARRAY,
color:CHARARRAY,
valor:INT);

u = FOREACH lines GENERATE fecha,SUBSTRING(fecha,0,4) AS f4, SUBSTRING(fecha,2,4) AS f2;
y = FOREACH u GENERATE f4,f2;

STORE y INTO 'output' USING PigStorage(',');


