-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD '*.tsv' USING PigStorage('\t') AS 
(letra:CHARARRAY,
letras:bag{(a:CHARARRAY)},
letrass:MAP[]);

u = foreach lines generate FLATTEN($1),FLATTEN($2);
y= foreach u generate $0,$1;
grouped = GROUP y BY ($0,$1);
count = FOREACH grouped GENERATE group, COUNT(y);
STORE count INTO 'output' USING PigStorage('\t');
