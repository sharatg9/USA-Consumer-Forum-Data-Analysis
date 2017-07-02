DATA = LOAD '$Input' USING TextLoader() AS (line:chararray);
A = FOREACH DATA GENERATE FLATTEN(STRSPLIT(line, ',(?=(?:[^"]*"[^"]*")*[^"]*$)'));
A1 = FILTER A BY $7 != 'Company' ;
B = FOREACH A1 GENERATE $7, $15 ;
C = GROUP B BY $0 ;
D = FOREACH C GENERATE group , COUNT(B.$1);
E = ORDER D BY $1 DESC ;
store E into '$Output' ;

