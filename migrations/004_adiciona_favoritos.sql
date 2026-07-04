-- Migração 004: Adiciona tabela de favoritos (bookmarks)
-- Motivação técnica: Permitir que usuários salvem tweets de forma privada.

CREATE TABLE favoritos (
    id_usuario      INTEGER NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_tweet        INTEGER NOT NULL REFERENCES tweets(id_tweet) ON DELETE CASCADE,
    data_salvo      TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id_usuario, id_tweet)
);
