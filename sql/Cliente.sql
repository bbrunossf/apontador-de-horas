-- public."Cliente" definição

-- Drop table

-- DROP TABLE public."Cliente";

CREATE TABLE public."Cliente" (
	id_cliente serial4 NOT NULL,
	nome_cliente text NOT NULL,
	contato text NULL,
	CONSTRAINT "Cliente_pkey" PRIMARY KEY (id_cliente)
);