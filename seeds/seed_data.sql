-- Dados de exemplo para testar o schema inicial (001_init.sql)

INSERT INTO usuarios (nome, nome_usuario, email, senha_hash) VALUES
('Ana Souza',    'ana_souza',    'ana@example.com',    'hash1'),
('Bruno Lima',   'bruno_lima',   'bruno@example.com',  'hash2'),
('Carla Mendes', 'carla_mendes', 'carla@example.com',  'hash3');

INSERT INTO tweets (id_usuario, conteudo) VALUES
(1, 'Bom dia! Alguém sabe se o metrô tá funcionando normal hoje?'),
(2, 'A meta de hoje era acordar cedo e ir pra academia, falhei miseravelmente.'),
(1, 'Terminei de assistir aquela série nova... sem condições, o final foi bizarro de ruim');

INSERT INTO curtidas (id_usuario, id_tweet) VALUES
(2, 1),
(3, 1),
(3, 2);

INSERT INTO comentarios (id_usuario, id_tweet, conteudo) VALUES
(2, 1, 'A linha verde tá parada :/'),
(1, 2, 'Normal kkkkk');

INSERT INTO seguidores (id_seguidor, id_seguido) VALUES
(1, 2),
(2, 1),
(3, 1);
