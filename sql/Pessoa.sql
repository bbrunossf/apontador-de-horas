-- Apontador de Horas — tabela de pessoas
-- Versão enxuta: somente as colunas usadas pelo app (o DDL completo do DBeaver está
-- preservado em _NAO_PUBLICAR/origem-ddl/, fora do repositório).
-- As colunas funcao, email, data_criacao e ativo do banco de origem ficaram de fora:
-- o app só lista "nome" e grava o id_nome.

CREATE TABLE public."Pessoa" (
	id_nome serial4 NOT NULL,
	nome text NOT NULL,
	CONSTRAINT "Pessoa_pkey" PRIMARY KEY (id_nome)
);
