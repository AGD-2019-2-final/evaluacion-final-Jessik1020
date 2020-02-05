-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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

u = FOREACH lines GENERATE SUBSTRING(fecha,0,4) as year;
grouped = group u by year;
y = FOREACH grouped GENERATE group,   COUNT(u);
STORE y INTO 'output' USING PigStorage(',');