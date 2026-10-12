-- public."Registro" definição

-- Drop table

-- DROP TABLE public."Registro";

CREATE TABLE public."Registro" (
	id_registro serial4 NOT NULL,
	"timestamp" timestamp(3) NOT NULL,
	id_nome int4 NOT NULL,
	id_obra int4 NOT NULL,
	id_tipo_tarefa int4 NOT NULL,
	id_categoria int4 NOT NULL,
	duracao_minutos int4 DEFAULT 60 NOT NULL,
	hora_extra bool DEFAULT false NOT NULL,
	adicionado_bot bool DEFAULT false NOT NULL,
	trabalho_metalica bool NULL,
	trabalho_concreto_armado bool NULL,
	trabalho_pre_moldado bool NULL,
	CONSTRAINT "Registro_pkey" PRIMARY KEY (id_registro)
);


-- public."Registro" chaves estrangeiras

ALTER TABLE public."Registro" ADD CONSTRAINT "Registro_id_categoria_fkey" FOREIGN KEY (id_categoria) REFERENCES public."Categoria"(id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Registro_id_nome_fkey" FOREIGN KEY (id_nome) REFERENCES public."Pessoa"(id_nome) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Registro_id_obra_fkey" FOREIGN KEY (id_obra) REFERENCES public."Obra"(id_obra) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Registro_id_tipo_tarefa_fkey" FOREIGN KEY (id_tipo_tarefa) REFERENCES public."TipoTarefa"(id_tipo_tarefa) ON DELETE RESTRICT ON UPDATE CASCADE;