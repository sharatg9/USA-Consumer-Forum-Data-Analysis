DATA = LOAD '$Input' USING TextLoader() AS (line:chararray);
A = FOREACH DATA GENERATE FLATTEN(STRSPLIT(line, ',(?=(?:[^"]*"[^"]*")*[^"]*$)'));
B = FILTER A BY $0 == $11 ;
C = GROUP B ALL;
D = FOREACH C GENERATE COUNT(B.$15);
store D into '$Output' ;
