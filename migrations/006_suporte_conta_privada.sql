-- Migração 004: Implementa suporte a contas privadas e fluxo de aprovação de seguidores
-- Motivação técnica: Permitir que usuários restrinjam seu conteúdo e aprovem quem pode segui-los.

ALTER TABLE usuarios ADD COLUMN e_privado BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE seguidores ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'aprovado';

ALTER TABLE seguidores ADD CONSTRAINT check_status_seguidor CHECK (status IN ('pendente', 'aprovado'));
