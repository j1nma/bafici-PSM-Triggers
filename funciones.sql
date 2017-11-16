CREATE OR REPLACE FUNCTION updateActuaEn() RETURNS TRIGGER
AS $$
BEGIN

	UPDATE actor
	SET cantidad_films = ((SELECT COUNT(id_film)
							FROM actua
							WHERE id_actor = NEW.id_actor
							GROUP BY id_actor) + 1)
	WHERE id_actor = NEW.id_actor;
RETURN NULL;
END;
$$ LANGUAGE plpgSQL;

CREATE TRIGGER contador_actor
AFTER INSERT ON actua
FOR EACH ROW 
EXECUTE PROCEDURE updateActuaEn();