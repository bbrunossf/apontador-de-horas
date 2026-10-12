-- public."Categoria" definição

-- Drop table

-- DROP TABLE public."Categoria";

CREATE TABLE public."Categoria" (
	id_categoria serial4 NOT NULL,
	nome_categoria text NOT NULL,
	CONSTRAINT "Categoria_pkey" PRIMARY KEY (id_categoria)
);