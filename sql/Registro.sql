-- Apontador de Horas — tabela de lançamentos (fatos)
-- Versão enxuta: somente as colunas usadas pelo app (o DDL completo do DBeaver está
-- preservado em _NAO_PUBLICAR/origem-ddl/, fora do repositório).
--
-- trabalho_* : etapa do serviço. True = selecionada; NULL = não selecionada ou
--              lançamento anterior à versão que introduziu as etapas. No máximo uma
--              por registro. O app detecta estas colunas em information_schema e
--              funciona mesmo se elas não existirem.

CREATE TABLE public."Registro" (
	id_registro serial4 NOT NULL,
	"timestamp" timestamp(3) NOT NULL,
	id_nome int4 NOT NULL,
	id_obra int4 NOT NULL,
	id_tipo_tarefa int4 NOT NULL,
	id_categoria int4 NOT NULL,
	duracao_minutos int4 DEFAULT 60 NOT NULL,
	hora_extra bool DEFAULT false NOT NULL,
	trabalho_metalica bool NULL,
	trabalho_concreto_armado bool NULL,
	trabalho_pre_moldado bool NULL,
	CONSTRAINT "Registro_pkey" PRIMARY KEY (id_registro)
);

ALTER TABLE public."Registro" ADD CONSTRAINT "Registro_id_nome_fkey" FOREIGN KEY (id_nome) REFERENCES public."Pessoa"(id_nome) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Registro_id_obra_fkey" FOREIGN KEY (id_obra) REFERENCES public."Obra"(id_obra) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Registro_id_tipo_tarefa_fkey" FOREIGN KEY (id_tipo_tarefa) REFERENCES public."TipoTarefa"(id_tipo_tarefa) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE public."Registro" ADD CONSTRAINT "Registro_id_categoria_fkey" FOREIGN KEY (id_categoria) REFERENCES public."Categoria"(id_categoria) ON DELETE RESTRICT ON UPDATE CASCADE;
