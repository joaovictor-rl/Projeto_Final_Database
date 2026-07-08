-- Migração 003: Evolução da tabela de usuários

ALTER TABLE usuarios ADD COLUMN biografia VARCHAR(160);
ALTER TABLE usuarios ADD COLUMN e_verificado BOOLEAN NOT NULL DEFAULT FALSE;
