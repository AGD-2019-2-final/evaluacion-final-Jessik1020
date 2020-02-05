--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta en SQL.
-- 
--    SELECT
--        color
--    FROM 
--        u 
--    WHERE 
--        color 
--    LIKE 'b%';
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

y= FOREACH lines GENERATE color;
u= FILTER y BY STARTSWITH(color,'b');

STORE u INTO 'output' USING PigStorage(',');

