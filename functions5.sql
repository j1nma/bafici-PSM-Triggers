CREATE OR REPLACE FUNCTION inserta_datos_actua() RETURNS VOID
AS $$


DECLARE
actores CURSOR FOR SELECT id_actor, nombre
FROM actor;
actor RECORD;
pelicula RECORD;

BEGIN
OPEN actores;
	LOOP
	FETCH actores INTO actor;
	EXIT WHEN NOT FOUND;

		FOR pelicula IN
			(SELECT id_film
			FROM film
			WHERE REGEXP_REPLACE(REGEXP_REPLACE(LOWER(film.cast_), '^\s+', ''), '\s+$', '') LIKE ('%'|| actor.nombre ||'%'))
		LOOP
			INSERT INTO actua
			VALUES (actor.id_actor, pelicula.id_film)

			ON CONFLICT DO NOTHING;
		END LOOP;
	END LOOP;
END;
$$ LANGUAGE plpgSQL;