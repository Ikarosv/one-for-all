SELECT nome_pessoa_usuaria,
	COUNT(historico.cancao) AS musicas_ouvidas,
    ROUND(SUM(duracao) / 60, 2) AS total_minutos
FROM usuario
JOIN historico ON usuario.pessoa_usuaria_id = historico.fk_pessoa_usuaria_id
JOIN cancoes on historico.cancao = cancoes.cancao
GROUP BY nome_pessoa_usuaria
ORDER BY nome_pessoa_usuaria;