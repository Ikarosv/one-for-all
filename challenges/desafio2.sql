SELECT
	(SELECT COUNT(*) FROM cancoes) cancoes,
  (SELECT COUNT(*) FROM artistas) artistas,
	(SELECT COUNT(*) FROM albuns) albuns;