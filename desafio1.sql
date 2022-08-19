DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

     CREATE TABLE SpotifyClone.planos(
      plano_id INT AUTO_INCREMENT,
      plano_tipo VARCHAR(50) NOT NULL,
      plano_valor DECIMAL(10, 2) NOT NULL,
      PRIMARY KEY(plano_id)
  ) engine = InnoDB;
  
      CREATE TABLE SpotifyClone.artistas(
      artista_id INT AUTO_INCREMENT,
	    artista_name VARCHAR(50) NOT NULL,
      PRIMARY KEY(artista_id)
  ) engine = InnoDB;

      CREATE TABLE SpotifyClone.usuarios(
      usuario_id INT AUTO_INCREMENT,
      usuario_name VARCHAR(50) NOT NULL,
      usuario_idade INT NOT NULL,
      plano_id INT NOT NULL,
      data_assinaturaPlano DATE NOT NULL,
      PRIMARY KEY(usuario_id),
	    FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
  ) engine = InnoDB;
    

      CREATE TABLE SpotifyClone.albuns(
      album_id INT AUTO_INCREMENT,
	    album_name VARCHAR(50) NOT NULL,
      artista_id INT NOT NULL,
      album_lancamento INT NOT NULL,
      PRIMARY KEY(album_id),
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;


      CREATE TABLE SpotifyClone.cancoes(
      cancao_id INT AUTO_INCREMENT,
	    cancao_name VARCHAR(100) NOT NULL,
      cancao_duracao INT NOT NULL,
      artista_id INT NOT NULL,
      album_id INT NOT NULL,
      PRIMARY KEY(cancao_id),
      FOREIGN KEY (album_id) REFERENCES albuns (album_id),
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;

      CREATE TABLE SpotifyClone.seguindo_artistas(
      seguindo_id INT AUTO_INCREMENT,
	    usuario_id INT NOT NULL,
      artista_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(seguindo_id, usuario_id, artista_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
      FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
  ) engine = InnoDB;
    

      CREATE TABLE SpotifyClone.historicos_reproducao(
      historico_id INT AUTO_INCREMENT,
	    usuario_id INT NOT NULL,
      cancao_id INT NOT NULL,
      historico_data DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY(historico_id, usuario_id, cancao_id),
      FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
      FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
  ) engine = InnoDB;
 
  INSERT INTO SpotifyClone.planos (plano_tipo, plano_valor)
  VALUES
    ('Gratuito', 0),
    ('Familiar', 7.99),
    ('Universitário', 5.99),
    ('Pessoal', 6.99);

  INSERT INTO SpotifyClone.usuarios (usuario_name, usuario_idade, plano_id, data_assinaturaPlano)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');
    
  INSERT INTO SpotifyClone.artistas (artista_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
  INSERT INTO SpotifyClone.seguindo_artistas (usuario_id, artista_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);
    
    
  INSERT INTO SpotifyClone.albuns (album_name, album_lancamento, artista_id)
  VALUES
    ('Renaissance', 2022, 1),
    ('Jazz', 1978, 2),
    ('Hot Space', 1982, 2),
    ('Falso Brilhante', 1998, 3),
    ('Vento de Maio', 2001, 3),
    ('QVVJFA?', 2003, 4),
    ('Somewhere Far Beyond', 2007, 5),
    ('I Put A Spell On You', 2012, 6);
    
  INSERT INTO SpotifyClone.cancoes (cancao_name, cancao_duracao, album_id, artista_id)
  VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 3, 2),
    ('Como Nossos Pais', 105, 4, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    ('Samba em Paris', 267, 6, 4),
    ('The Bard’s Song', 244, 7, 5),
    ('Feeling Good', 100, 8, 6);
    
  INSERT INTO SpotifyClone.historicos_reproducao (usuario_id, cancao_id, historico_data)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
    
    
    
