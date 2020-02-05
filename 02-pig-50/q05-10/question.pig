-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD '*.tsv' AS 
(letra:CHARARRAY,
letras:CHARARRAY,
letrass:CHARARRAY);


words = FOREACH lines GENERATE FLATTEN(TOKENIZE(letras)) AS word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);
s = LIMIT wordcount 7;
STORE s INTO 'output' USING PigStorage('\t');



