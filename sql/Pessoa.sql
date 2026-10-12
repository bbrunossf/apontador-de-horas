-- public."Pessoa" definição

-- Drop table

-- DROP TABLE public."Pessoa";

CREATE TABLE public."Pessoa" (
	id_nome serial4 NOT NULL,
	nome text NOT NULL,
	funcao text NULL,
	email text NULL,
	data_criacao timestamp(3) DEFAULT CURRENT_TIMESTAMP NOT NULL,
	ativo bool DEFAULT true NOT NULL,
	CONSTRAINT "Pessoa_pkey" PRIMARY KEY (id_nome)
);