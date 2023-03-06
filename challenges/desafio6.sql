SELECT
	MIN(planos.valor_plano) AS faturamento_minimo,
  MAX(planos.valor_plano) AS faturamento_maximo,
  ROUND(AVG(planos.valor_plano), 2) AS faturamento_medio,
  SUM(planos.valor_plano) AS faturamento_total
FROM SpotifyClone.planos
INNER JOIN SpotifyClone.usuario ON planos.plano = usuario.fk_plano;