SELECT cancao, COUNT(*) AS reproducoes
FROM SpotifyClone.historico
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;