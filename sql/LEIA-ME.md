# Scripts de criação do banco

Esta pasta é o lugar dos scripts SQL. Eles **não** vieram no código de origem: o `rev14.py` cita um
`rev14_alter_registro.sql` que não existe em lugar nenhum do repositório `plena` (conferido em todos
os `.sql` do branch `integracao/agente-ifc`).

## Nomes combinados

| Arquivo | O que deve conter |
|---|---|
| `01_schema.sql` | `CREATE TABLE` das cinco tabelas usadas pelo app |
| `02_alter_etapas.sql` | `ALTER TABLE "Registro"` acrescentando `trabalho_metalica`, `trabalho_concreto_armado` e `trabalho_pre_moldado` |
| `03_exemplo_dados.sql` | *opcional* — poucas linhas **fictícias** em `"Obra"`, `"Pessoa"`, `"TipoTarefa"` e `"Categoria"`, apenas para a interface ter o que listar numa demonstração |

A lista de colunas que cada script precisa cobrir está em
**[../docs/schema-do-banco.md](../docs/schema-do-banco.md)** — vale conferir item por item, porque
foi levantada lendo as consultas do app, não de um DDL oficial.

## De onde vêm os arquivos

Gerados no **DBeaver** a partir do banco real (botão direito na tabela → *Generate SQL* → *DDL*) e
salvos aqui. Depois de gerados:

1. **Revisar nomes de cliente ou de obra** que possam ter vazado em comentários, `COMMENT ON` ou
   `DEFAULT`.
2. **Nenhum dado real**: os scripts devem ter só estrutura (e, no caso do `03`, dados inventados).
3. Marcar no `MANIFESTO.md` quais arquivos entraram depois da cópia inicial.
