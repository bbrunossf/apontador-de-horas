-- Apontador de Horas — tabela de tarefas
-- Versão enxuta: somente as colunas usadas pelo app (o DDL completo do DBeaver está
-- preservado em _NAO_PUBLICAR/origem-ddl/, fora do repositório).

CREATE TABLE public."TipoTarefa" (
	id_tipo_tarefa serial4 NOT NULL,
	nome_tipo text NOT NULL,
	CONSTRAINT "TipoTarefa_pkey" PRIMARY KEY (id_tipo_tarefa)
);
