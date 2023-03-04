-- Descomente e altere as linhas abaixo:

DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos(
  `plano` VARCHAR(45) PRIMARY KEY,
  `valor_plano` DECIMAL(10, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
  `pessoa_usuaria_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome_pessoa_usuaria` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `data_assinatura` DATE NOT NULL,
  `fk_plano` VARCHAR(45) NOT NULL,
		FOREIGN KEY (fk_plano) REFERENCES planos(plano)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas(
  `artista` VARCHAR(45) PRIMARY KEY
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns(
  `album_id` INT PRIMARY KEY AUTO_INCREMENT,
  `album` VARCHAR(45) NOT NULL,
  `fk_artista` VARCHAR(45) NOT NULL,
		FOREIGN KEY (`fk_artista`) REFERENCES artistas(`artista`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.cancoes(
  `cancao` VARCHAR(45) PRIMARY KEY,
  `fk_cancao_artista` VARCHAR(45) NOT NULL,
  `fk_album_id` INT NOT NULL,
  `duracao` INT NOT NULL,
  `ano_de_lancamento` YEAR NOT NULL,
		FOREIGN KEY (`fk_cancao_artista`) REFERENCES artistas(`artista`),
    FOREIGN KEY (`fk_album_id`) REFERENCES albuns(`album_id`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
  `fk_pessoa_usuaria_id` INT NOT NULL,
  `data_reproducao` DATETIME NOT NULL,
  `cancao` VARCHAR(45) NOT NULL,
  PRIMARY KEY(`fk_pessoa_usuaria_id`, `cancao`),
		FOREIGN KEY (`fk_pessoa_usuaria_id`) REFERENCES usuario(`pessoa_usuaria_id`),
    FOREIGN KEY (`cancao`) REFERENCES cancoes(`cancao`)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo(
  `fk_pessoa_usuaria_id` INT NOT NULL,
  `fk_artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY(`fk_pessoa_usuaria_id`, `fk_artista`),
		FOREIGN KEY (`fk_pessoa_usuaria_id`) REFERENCES usuario(`pessoa_usuaria_id`),
    FOREIGN KEY (`fk_artista`) REFERENCES artistas(`artista`)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (`plano`, `valor_plano`) VALUES
	('gratuito', 0),
	('familiar', 7.99),
	('universitário', 5.99),
	('pessoal', 6.99);


INSERT INTO SpotifyClone.usuario (`pessoa_usuaria_id`, `nome_pessoa_usuaria`, `idade`, `fk_plano`, `data_assinatura`) VALUES
	(1, 'Barbara Liskov', 82, 'gratuito', '2019-10-20'),
	(2, 'Robert Cecil Martin', 58, 'gratuito', '2017-01-06'),
	(3, 'Ada Lovelace', 37, 'familiar', '2017-12-30'),
	(4, 'Martin Fowler', 46, 'familiar', '2017-01-17'),
	(5, 'Sandi Metz', 58, 'familiar', '2018-04-29'),
	(6, 'Paulo Freire', 19, 'universitário', '2018-02-14'),
	(7, 'Bell Hooks', 26, 'universitário', '2018-01-05'),
	(8, 'Christopher Alexander', 85, 'pessoal', '2019-06-05'),
	(9, 'Judith Butler', 45, 'pessoal', '2020-05-13'),
	(10, 'Jorge Amado', 58, 'pessoal', '2017-02-17');
    
INSERT INTO SpotifyClone.artistas (`artista`) VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

INSERT INTO SpotifyClone.albuns (`album_id`, `album`, `fk_artista`) VALUES
	(1, 'Renaissance', 'Beyoncé'),
	(2, 'Jazz', 'Queen'),
	(3, 'Hot Space', 'Queen'),
	(4, 'Falso Brilhante', 'Elis Regina'),
	(5, 'Vento de Maio', 'Elis Regina'),
	(6, 'QVVJFA?', 'Baco Exu do Blues'),
	(7, 'Somewhere Far Beyond', 'Blind Guardian'),
	(8, 'I Put A Spell On You', 'Nina Simone');
    
INSERT INTO SpotifyClone.cancoes (`fk_album_id`, `fk_cancao_artista`, `ano_de_lancamento`, `cancao` , `duracao`) VALUES
	(1, 'Beyoncé', '2022', "BREAK MY SOUL", 279),
	(1, 'Beyoncé', '2022', "VIRGO'S GROOVE", 369),
	(1, 'Beyoncé', '2022', "ALIEN SUPERSTAR", 116),
	(2, 'Queen', '1978', "Don't Stop Me Now", 203),
	(3, 'Queen', '1982', "Under Pressure", 152),
	(4, 'Elis Regina', '1998', "Como Nossos Pais", 105),
	(5, 'Elis Regina', '2001', "O Medo de Amar é o Medo de Ser Livre", 107),
	(6, 'Baco Exu do Blues', '2003', "Samba em Paris", 267),
	(7, 'Blind Guardian', '2007', "The Bard's Song", 244),
	(8, 'Nina Simone', '2012', "Feeling Good", 100);

INSERT INTO SpotifyClone.historico (`fk_pessoa_usuaria_id`, `cancao`, `data_reproducao`) VALUES
  (1, "Samba em Paris", "2022-02-28 10:45:55"),
  (1, "VIRGO'S GROOVE", "2020-05-02 05:30:35"),
  (1, "Feeling Good", "2020-03-06 11:22:33"),
  (2, "Feeling Good", "2022-08-05 08:05:17"),
  (2, "O Medo de Amar é o Medo de Ser Livre", "2020-01-02 07:40:33"),
  (3, "Feeling Good", "2020-11-13 16:55:13"),
  (3, "VIRGO'S GROOVE", "2020-12-05 18:38:30"),
  (4, "Samba em Paris", "2021-08-15 17:10:10"),
  (5, "Samba em Paris", "2022-01-09 01:44:33"),
  (5, "Under Pressure", "2020-08-06 15:23:43"),
  (6, "O Medo de Amar é o Medo de Ser Livre", "2020-01-02 07:40:33"),
  (6, "BREAK MY SOUL", "2017-10-12 12:35:20"),
  (7, "Don't Stop Me Now", "2011-12-15 22:30:49"),
  (8, "Don't Stop Me Now", "2012-03-17 14:56:41"),
  (9, "The Bard's Song", "2022-02-24 21:14:22"),
  (10, "ALIEN SUPERSTAR", "2015-12-13 08:30:22");


INSERT INTO SpotifyClone.seguindo (`fk_pessoa_usuaria_id`, `fk_artista`) VALUES
  (1, 'Beyoncé'),
  (1, 'Queen'),
  (1, 'Elis Regina'),
  (2, 'Beyoncé'),
  (2, 'Elis Regina'),
  (3, 'Queen'),
  (4, 'Baco Exu do Blues'),
  (5, 'Blind Guardian'),
  (5, 'Nina Simone'),
  (6, 'Beyoncé'),
  (6, 'Nina Simone'),
  (7, 'Nina Simone'),
  (9, 'Elis Regina'),
  (10, 'Queen');


-- CREATE TABLE IF NOT EXISTS planos (
-- 	`plano` VARCHAR(45) PRIMARY KEY,
--     `valor_plano` DECIMAL(10, 2) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS usuario (
-- 	`pessoa_usuaria_id` INT PRIMARY KEY AUTO_INCREMENT,
--     `nome_pessoa_usuaria` VARCHAR(45) NOT NULL,
--     `idade` INT NOT NULL,
--     `fk_plano` VARCHAR(45) NOT NULL,
--     `data_assinatura` DATE NOT NULL,
-- 		FOREIGN KEY (fk_plano) REFERENCES planos(plano)
-- );

-- CREATE TABLE IF NOT EXISTS historico (
-- 	`id_historico` INT PRIMARY KEY AUTO_INCREMENT,
--     `fk_pessoa_usuaria_id` INT NOT NULL,
--     `data_reproducao` DATETIME NOT NULL,
--     `cancao` VARCHAR(40) NOT NULL,
-- 		FOREIGN KEY (`fk_pessoa_usuaria_id`) REFERENCES usuario(`pessoa_usuaria_id`)
-- );

-- CREATE TABLE IF NOT EXISTS artistas (
-- 	`artista` VARCHAR(45) PRIMARY KEY
-- );

-- CREATE TABLE IF NOT EXISTS albuns (
-- 	`album_id` INT PRIMARY KEY,
--     `album` VARCHAR(45) NOT NULL,
--     `fk_artista` VARCHAR(45) NOT NULL,
-- 		FOREIGN KEY (`fk_artista`) REFERENCES artistas(`artista`)
-- );

-- CREATE TABLE IF NOT EXISTS seguindo (
-- 	`fk_pessoa_usuaria_id` INT NOT NULL,
--     `fk_artista` VARCHAR(45) NOT NULL,
-- 		FOREIGN KEY (`fk_pessoa_usuaria_id`) REFERENCES usuario(`pessoa_usuaria_id`),
--         FOREIGN KEY (`fk_artista`) REFERENCES artistas(`artista`)
-- );

-- CREATE TABLE IF NOT EXISTS cancoes (
-- 	`cancao` VARCHAR(45) PRIMARY KEY,
--     `fk_cancao_artista` VARCHAR(45) NOT NULL,
--     `fk_album_id` INT NOT NULL,
--     `duracao` INT NOT NULL,
--     `ano_de_lancamento` YEAR NOT NULL,
-- 		FOREIGN KEY (`fk_cancao_artista`) REFERENCES artistas(`artista`),
--         FOREIGN KEY (`fk_album_id`) REFERENCES albuns(`album_id`)
-- );
