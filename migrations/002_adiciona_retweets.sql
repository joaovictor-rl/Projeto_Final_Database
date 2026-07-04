-- Migração 002: Adiciona tabela de retweets
-- Motivação técnica: Permitir o compartilhamento de conteúdo existente mantendo a referência original.

CREATE TABLE retweets (
    id_usuario      INTEGER NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_tweet        INTEGER NOT NULL REFERENCES tweets(id_tweet) ON DELETE CASCADE,
    data_retweet    TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id_usuario, id_tweet)
);
