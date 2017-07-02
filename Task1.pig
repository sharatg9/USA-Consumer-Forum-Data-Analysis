DATA = LOAD '$Input' USING TextLoader() AS (line:chararray);
B = FOREACH DATA GENERATE FLATTEN(STRSPLIT(line, ',(?=(?:[^"]*"[^"]*")*[^"]*$)'));
C = FOREACH B GENERATE $13,$15 ; 
D = FILTER C BY $0 == 'Yes' ;
E = GROUP D ALL;
F = FOREACH E GENERATE COUNT(D.$1);
store F into '$Output' ;
