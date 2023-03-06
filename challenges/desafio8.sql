SELECT
	fk_artista as artista,
    album
FROM SpotifyClone.albuns
WHERE fk_artista = "Elis Regina"
ORDER BY album
;