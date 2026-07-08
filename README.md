# Projeto Final — Banco de Dados I (2026.2)
<img src="aux/twitter_banner.png" width="100%" alt="Twitter Banner">

Modelagem do banco de dados que sustentaria uma rede social no estilo **Twitter**: usuários publicando posts curtos (tweets), curtindo, comentando, seguindo outros usuários, retweetando e salvando favoritos.

## Integrantes

- João Victor Reis Lisboa - 202511140001
- João Antonio Fragallo Ferreira - 202511140010
- João Emannuel Neves De Brito - 202511140004
  
## Sistema escolhido

**Twitter**

Pergunta-guia do projeto: como esse sistema foi (ou seria) desenvolvido por baixo do capô?

O recorte do projeto cobre o núcleo funcional do produto:
- Cadastro de usuários
- Publicação de tweets
- Curtidas em tweets
- Comentários (respostas) em tweets
- Relação de "seguir" entre usuários
- Retweets (compartilhamento de tweets existentes)
- Favoritos (salvar tweets de forma privada)

## Entidades principais

| Entidade | Descrição |
|---|---|
| `usuarios` | Pessoas cadastradas na plataforma |
| `tweets` | Publicações feitas por um usuário |
| `curtidas` | Registro de um usuário curtindo um tweet |
| `comentarios` | Respostas de usuários a um tweet |
| `seguidores` | Relação N:N entre usuários (quem segue quem) |
| `retweets` | Registro de um usuário compartilhando (retweetando) um tweet |
| `favoritos` | Registro de um usuário salvando um tweet de forma privada |

## Relacionamentos

- Um **usuário** pode publicar vários **tweets** (1:N)
- Um **usuário** pode curtir vários **tweets**, e um **tweet** pode ser curtido por vários **usuários** (N:N, resolvido pela entidade `curtidas`)
- Um **usuário** pode comentar vários **tweets**, e um **tweet** pode ter vários **comentários** (1:N a partir do tweet, N:1 a partir do usuário)
- Um **usuário** pode seguir vários **usuários**, e ser seguido por vários (N:N, auto-relacionamento resolvido pela entidade `seguidores`)
- Um **usuário** pode retweetar vários **tweets**, e um **tweet** pode ser retweetado por vários **usuários** (N:N, resolvido pela entidade `retweets`)
- Um **usuário** pode favoritar vários **tweets** de forma privada (N:N, resolvido pela entidade `favoritos`)
- A partir da migration 003, `usuarios` também possui `biografia` e `e_verificado` (selo de verificação)

##  Modelos de Diagrama ER

Os modelos do banco de dados estão na pasta [`modelos/`](./modelos), e serão incrementados ao longo do projeto.
- [Modelo Lógico - v1](./modelos/modelo_logico_v1.pdf)
- [Modelo Lógico - v2](./modelos/modelo_logico_v2.pdf)

## Como rodar no Supabase

O projeto usa o **Supabase** (PostgreSQL gerenciado) para desenvolvimento e testes.

1. Criar uma conta gratuita em [supabase.com](https://supabase.com) e criar um novo projeto.
2. Abrir o **SQL Editor** do projeto no Supabase.
3. Executar as migrações **em ordem**, uma por vez, copiando o conteúdo de cada arquivo em `migrations/`:
   `001_init.sql` → `002_adiciona_retweets.sql` → `003_atualiza_perfil_usuarios.sql` → `004_adiciona_favoritos.sql`
4. Popular o banco com dados de exemplo, executando os arquivos de `seeds/` em ordem.
