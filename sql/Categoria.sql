-- Apontador de Horas — tabela de categorias
-- Versão enxuta: somente as colunas usadas pelo app (o DDL completo do DBeaver está
-- preservado em _NAO_PUBLICAR/origem-ddl/, fora do repositório).

CREATE TABLE public."Categoria" (
	id_categoria serial4 NOT NULL,
	nome_categoria text NOT NULL,
	CONSTRAINT "Categoria_pkey" PRIMARY KEY (id_categoria)
);
