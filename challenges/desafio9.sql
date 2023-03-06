SELECT COUNT(historico.cancao) AS musicas_no_historico
FROM SpotifyClone.usuario
INNER JOIN SpotifyClone.historico ON
usuario.pessoa_usuaria_id = historico.fk_pessoa_usuaria_id
WHERE SpotifyClone.usuario.nome_pessoa_usuaria = "Barbara Liskov"
;