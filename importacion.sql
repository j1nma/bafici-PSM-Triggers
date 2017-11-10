\copy director from bafici13-directores.csv header delimiter ';' csv;
\copy film from bafici13-filmsTEST.csv header delimiter ',' csv ENCODING 'LATIN1';
\copy pais from bafici13-paises.csv header delimiter ',' csv;