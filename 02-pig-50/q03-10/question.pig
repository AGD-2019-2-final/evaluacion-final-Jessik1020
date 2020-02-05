-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' AS (line:CHARARRAY,Date:CHARARRAY,Cantidad:INT );
v = FOREACH lines GENERATE Cantidad;
y = ORDER v BY $0;
z = LIMIT y 5;
STORE z INTO 'output' USING PigStorage('\t');


