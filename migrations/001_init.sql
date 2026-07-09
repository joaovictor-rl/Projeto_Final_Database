-- Migração 001: Schema inicial
-- Sistema: Twitter
-- Entidades: usuarios, tweets, curtidas, comentarios, seguidores


-- Tabela de usuários
CREATE TABLE usuarios (
    id_usuario      SERIAL PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    nome_usuario    VARCHAR(50) NOT NULL UNIQUE,   
    email           VARCHAR(150) NOT NULL UNIQUE,
    senha_hash      VARCHAR(255) NOT NULL,
    data_criacao    TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Tabela de tweets
CREATE TABLE tweets (
    id_tweet        SERIAL PRIMARY KEY,
    id_usuario      INTEGER NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    conteudo        VARCHAR(280) NOT NULL,        
    data_publicacao TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Tabela de curtidas (relação N:N entre usuarios e tweets)
CREATE TABLE curtidas (
    id_usuario      INTEGER NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_tweet        INTEGER NOT NULL REFERENCES tweets(id_tweet) ON DELETE CASCADE,
    data_curtida    TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id_usuario, id_tweet)            
);

-- Tabela de comentários (respostas a um tweet)
CREATE TABLE comentarios (
    id_comentario   SERIAL PRIMARY KEY,
    id_usuario      INTEGER NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_tweet        INTEGER NOT NULL REFERENCES tweets(id_tweet) ON DELETE CASCADE,
    conteudo        VARCHAR(280) NOT NULL,
    data_comentario TIMESTAMP NOT NULL DEFAULT NOW()
);

-- Tabela de seguidores (auto-relacionamento N:N entre usuarios)
CREATE TABLE seguidores (
    id_seguidor     INTEGER NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_seguido      INTEGER NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    data_seguir     TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (id_seguidor, id_seguido),
    CHECK (id_seguidor <> id_seguido)             
);
