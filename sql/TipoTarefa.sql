-- public."TipoTarefa" definição

-- Drop table

-- DROP TABLE public."TipoTarefa";

CREATE TABLE public."TipoTarefa" (
	id_tipo_tarefa serial4 NOT NULL,
	nome_tipo text NOT NULL,
	CONSTRAINT "TipoTarefa_pkey" PRIMARY KEY (id_tipo_tarefa)
);