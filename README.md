# Projeto Final — Banco de Dados I (2026.2)

Modelagem do banco de dados que sustentaria uma rede social no estilo **Twitter**: usuários publicando posts curtos (tweets), curtindo, comentando, seguindo outros usuários e usando hashtags.

## Integrantes

- João Victor Reis Lisboa
- João Antonio Fragallo Ferreira
- João Emannuel Neves De Brito
  
## Sistema escolhido

**Twitter**

Pergunta-guia do projeto: como esse sistema foi (ou seria) desenvolvido por baixo do capô?

O recorte do projeto cobre o núcleo funcional do produto:
- Cadastro de usuários
- Publicação de tweets
- Curtidas em tweets
- Comentários (respostas) em tweets
- Relação de "seguir" entre usuários

## Entidades principais (versão inicial)

| Entidade | Descrição |
|---|---|
| `usuarios` | Pessoas cadastradas na plataforma |
| `tweets` | Publicações feitas por um usuário |
| `curtidas` | Registro de um usuário curtindo um tweet |
| `comentarios` | Respostas de usuários a um tweet |
| `seguidores` | Relação N:N entre usuários (quem segue quem) |

## Relacionamentos

- Um **usuário** pode publicar vários **tweets** (1:N)
- Um **usuário** pode curtir vários **tweets**, e um **tweet** pode ser curtido por vários **usuários** (N:N, resolvido pela entidade `curtidas`)
- Um **usuário** pode comentar vários **tweets**, e um **tweet** pode ter vários **comentários** (1:N a partir do tweet, N:1 a partir do usuário)
- Um **usuário** pode seguir vários **usuários**, e ser seguido por vários (N:N, auto-relacionamento resolvido pela entidade `seguidores`)

##  Modelos de Diagrama ER

Os modelos do banco de dados estão na pasta [`modelos/`](./modelos), e serão incrementados ao longo do projeto.
- [Modelo Lógico - v1](./modelos/modelo_logico_v1.pdf)

O projeto usa o **Supabase** (PostgreSQL gerenciado) para desenvolvimento e testes.

1. Criar uma conta gratuita em [supabase.com](https://supabase.com) e criar um novo projeto.
2. Abrir o **SQL Editor** do projeto no Supabase.
3. Executar as migrações **em ordem**, uma por vez, copiando o conteúdo de cada arquivo em `migrations/`:
