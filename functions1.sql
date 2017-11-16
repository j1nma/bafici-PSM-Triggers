CREATE OR REPLACE FUNCTION inserta_datos_peliculas() RETURNS VOID
AS $$

DECLARE
pels CURSOR FOR SELECT id_film, title, title_es, title_en, title_orig, year_, plot, synopsis_es, synopsis_en, tagline, duration, color, id_youtube, url_ticket
FROM film;
pel RECORD;

BEGIN
	OPEN pels;
	LOOP
    FETCH pels INTO pel;
        EXIT WHEN NOT FOUND;
        INSERT INTO pelicula 
        VALUES (pel.id_film, pel.title, pel.title_es, pel.title_en, pel.title_orig, pel.year_, pel.plot, pel.synopsis_es, pel.synopsis_en, pel.tagline, pel.duration, pel.color, pel.id_youtube, pel.url_ticket)
        ON CONFLICT DO NOTHING;
    END LOOP;
END;
$$ LANGUAGE plpgSQL;