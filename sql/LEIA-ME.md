# Scripts de criação do banco

DDL do **DBeaver** (gerado em 12/10/2026 a partir do banco de origem), **enxugado** para conter
somente as colunas que o app usa. Sem dados: nenhum `INSERT`, nenhum `COMMENT ON`, nenhum `GRANT`.

## Ordem de execução

As chaves estrangeiras entram por `ALTER TABLE` no fim do `Registro.sql`, então **a ordem importa**:

```
1. TipoTarefa.sql
2. Categoria.sql
3. Pessoa.sql
4. Obra.sql
5. Registro.sql     (FK -> Obra, Pessoa, TipoTarefa, Categoria)
```

Tudo no schema `public`. Se o banco usar outro schema, ajuste o DDL e a chave `schema` do
`config.ini`.

## O que foi enxugado

| Tabela | Colunas mantidas | Colunas removidas do DDL completo |
|---|---|---|
| `"TipoTarefa"` | `id_tipo_tarefa`, `nome_tipo` | — |
| `"Categoria"` | `id_categoria`, `nome_categoria` | — |
| `"Pessoa"` | `id_nome`, `nome` | `funcao`, `email`, `data_criacao`, `ativo` |
| `"Obra"` | `id_obra`, `cod_obra`, `nome_obra` | `id_cliente`, `data_inicio`, `total_horas_planejadas`, datas e observações de planejamento, `tipo_obra`, `finalizada`, `historico`, `criado_em`, `peso_informado_kg`, `peso_nao_aplicavel` |
| `"Registro"` | as 11 usadas pelo app | `adicionado_bot` |
| `"Cliente"` | **tabela inteira removida** | era referenciada só pela FK `Obra.id_cliente`, que saiu junto |

Os DDL completos como o DBeaver gerou estão preservados em `../_NAO_PUBLICAR/origem-ddl/`, fora do
repositório.

## Duas decisões deliberadas neste DDL

1. **`Obra.cod_obra` é `NOT NULL`** (no banco de origem aceita nulo). O app monta o rótulo do menu
   com `cod_obra || ' - ' || nome_obra` e busca a obra por `cod_obra`; no PostgreSQL
   `NULL || texto` é `NULL`, o que produziria linha vazia no menu e busca impossível. No banco de
   origem nenhuma das obras está com código nulo, mas o schema permitia.
2. **`Registro.duracao_minutos DEFAULT 60`** e **`hora_extra DEFAULT false`** foram mantidos como
   no banco de origem — o app sempre envia os dois explicitamente, o default é só rede de segurança.

## Conferência contra o app

| Verificação | Resultado |
|---|---|
| Toda coluna que o `apontador_horas.py` lê ou escreve existe no DDL | **sim** (5 tabelas) |
| As 3 colunas de etapa existem | **sim**, `bool NULL` |
| Arquivos das tabelas referenciadas por FK | todos presentes |
| Dado real nos scripts | nenhum |

## Pendências conhecidas do schema

- **`Pessoa.ativo`**: o app lista todas as pessoas, sem filtrar as inativas.
  No DDL enxuto a coluna não existe mais — se quiser o filtro depois, ela precisa voltar.
- **Etapas de trabalho**: o app detecta as colunas em `information_schema` e funciona mesmo sem
  elas; os lançamentos ficam com `NULL`.
