SELECT artista, albuns.album,
	COUNT(seguindo.fk_pessoa_usuaria_id) AS pessoas_seguidoras
FROM SpotifyClone.artistas
INNER JOIN SpotifyClone.albuns ON artistas.artista = albuns.fk_artista
INNER JOIN SpotifyClone.seguindo ON artistas.artista = seguindo.fk_artista
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista, album;