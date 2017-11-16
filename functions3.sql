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

BEGIN
	OPEN countries;
	LOOP
    FETCH countries INTO country;
        EXIT WHEN NOT FOUND;
        IF (country.id_country <> 0)
        	INSERT INTO pertenece 
        	VALUES (country.id_film, country.id_country)
        	ON CONFLICT DO NOTHING;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgSQL;