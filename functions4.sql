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

    	IF (cas.cast_ IS NOT NULL) THEN

			FOREACH actor_s in array string_to_array(cas.cast_, ',')
			LOOP

				IF EXISTS (SELECT id_actor
					FROM actor
					WHERE nombre = REGEXP_REPLACE(REGEXP_REPLACE(LOWER(actor_s), '^\s+', ''), '\s+$', '')) THEN
					new_id_actor = (SELECT id_actor
								FROM actor
								WHERE nombre = REGEXP_REPLACE(REGEXP_REPLACE(LOWER(actor_s), '^\s+', ''), '\s+$', ''));
				ELSE
					new_id_actor = (SELECT COALESCE(MAX(id_actor),1)
									FROM actor) + 1;
				END IF;

				INSERT INTO actor 
		    	VALUES (new_id_actor, REGEXP_REPLACE(REGEXP_REPLACE(LOWER(actor_s), '^\s+', ''), '\s+$', ''), 0)
		    	ON CONFLICT DO NOTHING;
		    
		    END LOOP;
		END IF;

	END LOOP;
END;
$$ LANGUAGE plpgSQL;