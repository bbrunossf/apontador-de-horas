-- Apontador de Horas — tabela de obras (projetos)
-- Versão enxuta: somente as colunas usadas pelo app (o DDL completo do DBeaver está
-- preservado em _NAO_PUBLICAR/origem-ddl/, fora do repositório).
--
-- Diferença deliberada em relação ao banco de origem: `cod_obra` aqui é NOT NULL.
-- O app monta o rótulo do menu com `cod_obra || ' - ' || nome_obra` e procura a obra
-- por `WHERE cod_obra = %s`; no PostgreSQL, `NULL || texto` resulta em NULL (linha
-- vazia no menu, busca impossível). No banco de origem a coluna aceita NULL — hoje
-- nenhuma das obras tem código nulo, mas o schema permitia.

CREATE TABLE public."Obra" (
	id_obra serial4 NOT NULL,
	cod_obra text NOT NULL,
	nome_obra text NOT NULL,
	CONSTRAINT "Obra_pkey" PRIMARY KEY (id_obra)
);
CREATE UNIQUE INDEX "Obra_cod_obra_key" ON public."Obra" USING btree (cod_obra);
