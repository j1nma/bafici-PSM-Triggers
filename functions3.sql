CREATE OR REPLACE FUNCTION inserta_datos_pertenece() RETURNS VOID
AS $$

DECLARE
countries CURSOR FOR 
	(
		SELECT id_country1 AS id_country, id_film
		FROM film
		UNION
		SELECT id_country2 AS id_country, id_film
		FROM film
		UNION
		SELECT id_country3 AS id_country, id_film
		FROM film
		UNION
		SELECT id_country4 AS id_country, id_film
		FROM film
		UNION
		SELECT id_country5 AS id_country, id_film
		FROM film
		UNION
		SELECT id_country6 AS id_country, id_film
		FROM film
		UNION
		SELECT id_country7 AS id_country, id_film
		FROM film
		UNION
		SELECT id_country8 AS id_country, id_film
		FROM film
	);
country RECORD;

--JMA
countryIDs CURSOR FOR (SELECT COLUMN_NAME
							FROM INFORMATION_SCHEMA.COLUMNS
							WHERE COLUMN_NAME LIKE 'id_country%' AND TABLE_NAME = 'film');
countryID RECORD;

--JMA

BEGIN
	-- OPEN countries;
	-- LOOP
 --    FETCH countries INTO country;
 --        EXIT WHEN NOT FOUND;
 --        IF (country.id_country <> 0) THEN
 --        	INSERT INTO pertenece 
 --        	VALUES (country.id_film, country.id_country)
 --        	ON CONFLICT DO NOTHING;
 --        END IF;
 --    END LOOP;

 --JMA
 OPEN countryIDs;
	LOOP
    FETCH countryIDs INTO countryID;
        EXIT WHEN NOT FOUND;

        SELECT id_country, id_film
		FROM film
		WHERE film.countryID;

        IF (countryID.id_country <> 0) THEN
        	INSERT INTO pertenece 
        	VALUES (countryID.id_film, countryID.id_country)
        	ON CONFLICT DO NOTHING;
        END IF;
    END LOOP;
--JMA

END;
$$ LANGUAGE plpgSQL;