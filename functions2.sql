CREATE OR REPLACE FUNCTION inserta_datos_dirige() RETURNS VOID
AS $$

DECLARE
dirs CURSOR FOR 
	(
		SELECT id_director1 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director2 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director3 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director4 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director5 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director6 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director7 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director8 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director9 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director10 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director11 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director12 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director13 AS id_director, id_film
		FROM film
		UNION
		SELECT id_director14 AS id_director, id_film
		FROM film
	);
dir RECORD;

BEGIN
	OPEN dirs;
	LOOP
    FETCH dirs INTO dir;
        EXIT WHEN NOT FOUND;
        IF (dir.id_director <> 0) THEN
        	INSERT INTO dirige 
        	VALUES (dir.id_director, dir.id_film)
        	ON CONFLICT DO NOTHING;
        END IF;
    END LOOP;
END;
$$ LANGUAGE plpgSQL;