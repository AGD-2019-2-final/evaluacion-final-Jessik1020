-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'evaluacion-final-Jessik1020/02-pig-50/q06-10/*.tsv' AS 
(letra:CHARARRAY,
letras:CHARARRAY,
letrass:MAP[]);

lines = LOAD '*.tsv' USING PigStorage('\t') AS 
(letra:CHARARRAY,
letras:bag{(a:CHARARRAY)},
letrass:MAP[]);

u= FOREACH lines GENERATE FLATTEN(letrass) as vocal;
grouped = GROUP u BY vocal;
count = FOREACH grouped GENERATE group, COUNT(u);
STORE count INTO 'output' USING PigStorage(',');