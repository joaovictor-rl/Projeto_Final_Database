-- Migração 005: Adiciona tabela de mídias

CREATE TABLE midias (
    id_midia        SERIAL PRIMARY KEY,
    id_tweet        INTEGER NOT NULL REFERENCES tweets(id_tweet) ON DELETE CASCADE,
    tipo_midia      VARCHAR(20) NOT NULL CHECK (tipo_midia IN ('imagem', 'video', 'gif')),
    url_midia       VARCHAR(255) NOT NULL,
    data_upload     TIMESTAMP NOT NULL DEFAULT NOW()
);
