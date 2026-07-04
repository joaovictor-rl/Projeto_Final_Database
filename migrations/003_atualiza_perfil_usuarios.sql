-- Migração 003: Evolução da tabela de usuários
-- Motivação técnica: Adicionar suporte a metadados de perfil e status de verificação.

ALTER TABLE usuarios ADD COLUMN biografia VARCHAR(160);
ALTER TABLE usuarios ADD COLUMN e_verificado BOOLEAN NOT NULL DEFAULT FALSE;
