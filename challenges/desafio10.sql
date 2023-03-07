USE SpotifyClone;

CREATE TABLE IF NOT EXISTS cancoes_favoritas(
	pessoa_usuaria_id INT NOT NULL,
	cancao_favorita VARCHAR(45) NOT NULL,
    FOREIGN KEY (pessoa_usuaria_id) REFERENCES usuario(pessoa_usuaria_id),
    FOREIGN KEY (cancao_favorita) REFERENCES cancoes(cancao),
    PRIMARY KEY (cancao_favorita, pessoa_usuaria_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancoes_favoritas (pessoa_usuaria_id, cancao_favorita)
VALUES
  (1, 'ALIEN SUPERSTAR'),
  (1, 'Como Nossos Pais'),
  (1, 'Feeling Good'),
  (2, "Don't Stop Me Now"),
  (3, 'BREAK MY SOUL'),
  (3, 'ALIEN SUPERSTAR'),
  (4, 'O Medo de Amar é o Medo de Ser Livre'),
  (4, "Don't Stop Me Now"),
  (5, 'Feeling Good'),
  (5, "VIRGO'S GROOVE"),
  (6, "Don't Stop Me Now"),
  (7, "O Medo de Amar é o Medo de Ser Livre"),
  (8, "ALIEN SUPERSTAR")
  ;
