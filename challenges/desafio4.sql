SELECT nome_pessoa_usuaria as pessoa_usuaria,
	CASE
		WHEN MAX(YEAR(historico.data_reproducao)) >= 2021 THEN 'Ativa'
        ELSE 'Inativa'
	END AS status_pessoa_usuaria
FROM SpotifyClone.usuario
INNER JOIN SpotifyClone.historico ON usuario.pessoa_usuaria_id = historico.fk_pessoa_usuaria_id
GROUP BY nome_pessoa_usuaria
ORDER BY nome_pessoa_usuaria;