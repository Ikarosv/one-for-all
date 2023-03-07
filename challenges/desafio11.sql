SELECT
  album,
  COUNT(cancoes_favoritas.cancao_favorita) as favoritadas
FROM albuns
JOIN cancoes ON cancoes.fk_album_id = albuns.album_id
JOIN cancoes_favoritas ON cancoes_favoritas.cancao_favorita = cancoes.cancao

GROUP BY album
ORDER BY favoritadas DESC
LIMIT 3
;