CREATE OR REPLACE FUNCTION updateActuaEn() RETURNS TRIGGER
AS $$
BEGIN

	UPDATE actor
	SET cantidad_films = (SELECT COUNT(id_film)
				     FROM actua
				     WHERE id_actor = NEW.id_actor
				     GROUP BY id_actor)
	WHERE id_actor = NEW.id_actor;
RETURN NULL;
END;
$$ LANGUAGE plpgSQL;



SELECT COUNT(id_film)
FROM actua
WHERE id_actor = 1
GROUP BY id_actor;

--DROP FUNCTION seevbles();

--INSERT INTO actor VALUES (1,'Pepe Argento', NULL);

--INSERT INTO pelicula VALUES (500,'P. Argento FILM','P. Argento FILM ES','P. Argento FILM EN','P. Argento FILM ORIG', 1995, 'plot', 'synop_es', 'synop_en', 'tagline', 'duration', 'color', 'id_yt', 'url_tckt');

INSERT INTO actua VALUES (1, 500);

DELETE FROM actua;