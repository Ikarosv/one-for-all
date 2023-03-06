SELECT usuario.nome_pessoa_usuaria as pessoa_usuaria,
	COUNT(historico.cancao) AS musicas_ouvidas,
    ROUND(SUM(cancoes.duracao) / 60, 2) AS total_minutos
FROM SpotifyClone.usuario
JOIN SpotifyClone.historico ON usuario.pessoa_usuaria_id = historico.fk_pessoa_usuaria_id
JOIN SpotifyClone.cancoes on historico.cancao = cancoes.cancao
GROUP BY nome_pessoa_usuaria
ORDER BY nome_pessoa_usuaria;