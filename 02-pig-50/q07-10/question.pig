-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
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

u = FOREACH lines GENERATE $0, COUNT_STAR($1) as f1:CHARARRAY, SIZE($2) as f2:CHARARRAY;
y = ORDER u BY $0,$1,$2;
STORE y INTO 'output' USING PigStorage(',');