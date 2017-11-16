CREATE OR REPLACE FUNCTION inserta_datos_actor() RETURNS VOID
AS $$

DECLARE
casts CURSOR FOR SELECT cast_, id_film
FROM film;
cas RECORD;

DECLARE new_id_actor INTEGER;
DECLARE actor_s TEXT;

BEGIN



	
	OPEN casts;
	LOOP
    FETCH casts INTO cas;
    EXIT WHEN NOT FOUND;

		FOREACH actor_s in array string_to_array(cas.cast_, ',')
		LOOP
			

			IF EXISTS (SELECT id_actor
				FROM actor
				WHERE nombre = RTRIM(LTRIM(LOWER(actor_s)))) THEN
				new_id_actor = (SELECT id_actor
							FROM actor
							WHERE nombre = RTRIM(LTRIM(LOWER(actor_s))));
			ELSE
				new_id_actor = (SELECT MAX(id_actor)
								FROM actor) +1;
			END IF;


	    
	    END LOOP;

	END LOOP;
END;
$$ LANGUAGE plpgSQL;