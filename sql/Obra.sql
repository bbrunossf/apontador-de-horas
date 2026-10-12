-- public."Obra" definição

-- Drop table

-- DROP TABLE public."Obra";

CREATE TABLE public."Obra" (
	id_obra serial4 NOT NULL,
	cod_obra text NULL,
	nome_obra text NOT NULL,
	id_cliente int4 NULL,
	data_inicio date NULL,
	total_horas_planejadas float8 DEFAULT 0 NOT NULL,
	data_inicio_planejamento date NULL,
	data_fim_planejamento date NULL,
	observacoes_planejamento text NULL,
	tipo_obra text NULL,
	finalizada bool DEFAULT false NULL,
	historico bool DEFAULT false NOT NULL,
	criado_em timestamptz(6) DEFAULT now() NULL,
	peso_informado_kg float8 NULL,
	peso_nao_aplicavel bool DEFAULT false NOT NULL,
	CONSTRAINT "Obra_pkey" PRIMARY KEY (id_obra)
);
CREATE UNIQUE INDEX "Obra_cod_obra_key" ON public."Obra" USING btree (cod_obra);


-- public."Obra" chaves estrangeiras

ALTER TABLE public."Obra" ADD CONSTRAINT "Obra_id_cliente_fkey" FOREIGN KEY (id_cliente) REFERENCES public."Cliente"(id_cliente) ON DELETE SET NULL ON UPDATE CASCADE;