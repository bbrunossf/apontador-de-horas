# Schema exigido pelo Apontador de Horas

> **Estado:** levantado por leitura das consultas do `apontador_horas.py` (a lista abaixo é o que o
> app lê e escreve, coluna por coluna). Os **tipos são inferidos do uso**, não de um DDL oficial —
> o script definitivo é o que você gerar no DBeaver e salvar nesta pasta `sql/`.

## Tabelas

### `"Obra"`

| Coluna | Papel no app | Tipo (inferido) |
|---|---|---|
| `id_obra` | chave usada no `INSERT` em `"Registro"` e nos `JOIN` | inteiro / serial |
| `cod_obra` | código mostrado no dropdown (`cod_obra - nome_obra`) | texto |
| `nome_obra` | nome mostrado no dropdown | texto |

O app verifica se há registros nesta tabela (`SELECT COUNT(1) FROM "Obra"`) ao iniciar.

### `"Pessoa"`

| Coluna | Papel no app | Tipo (inferido) |
|---|---|---|
| `id_nome` | chave gravada em `"Registro".id_nome` | inteiro / serial |
| `nome` | lista de usuários no dropdown e no diálogo de configurações | texto |

### `"TipoTarefa"`

| Coluna | Papel no app | Tipo (inferido) |
|---|---|---|
| `id_tipo_tarefa` | chave gravada em `"Registro"` | inteiro / serial |
| `nome_tipo` | nome exibido | texto |

### `"Categoria"`

| Coluna | Papel no app | Tipo (inferido) |
|---|---|---|
| `id_categoria` | chave gravada em `"Registro"` | inteiro / serial |
| `nome_categoria` | nome exibido | texto |

### `"Registro"` (tabela de fatos)

| Coluna | Papel no app | Tipo (inferido) |
|---|---|---|
| `id_registro` | chave primária | inteiro / serial |
| `timestamp` | data e hora do lançamento; o app agrupa com `DATE(timestamp)` | timestamp |
| `id_nome` | pessoa do lançamento | inteiro (FK `"Pessoa"`) |
| `id_obra` | obra do lançamento | inteiro (FK `"Obra"`) |
| `id_tipo_tarefa` | tarefa | inteiro (FK `"TipoTarefa"`) |
| `id_categoria` | categoria | inteiro (FK `"Categoria"`) |
| `duracao_minutos` | duração apontada | inteiro |
| `hora_extra` | marca de hora extra | booleano |
| `trabalho_metalica` | etapa (rev14) | booleano, nulo permitido |
| `trabalho_concreto_armado` | etapa (rev14) | booleano, nulo permitido |
| `trabalho_pre_moldado` | etapa (rev14) | booleano, nulo permitido |

Convenção das três colunas de etapa: `True` = etapa selecionada, `NULL` = não selecionada **ou**
registro anterior à rev14 (sem informação). No máximo uma etapa por registro.

## Detalhe de compatibilidade

O app **não quebra** se as três colunas de etapa não existirem: ele consulta
`information_schema.columns` (filtrando `table_schema` e `table_name = 'Registro'`) e monta o
`SELECT` apenas com as colunas que encontrar. Você pode usar a versão antiga do banco e aplicar o
`ALTER TABLE` depois — os lançamentos anteriores ficam com `NULL`.

## Scripts desta pasta

| Arquivo | O que é |
|---|---|
| `01_schema.sql` | DDL das cinco tabelas (a ser gerado no DBeaver) |
| `02_alter_etapas.sql` | `ALTER TABLE "Registro"` acrescentando as três colunas de etapa |
| `03_exemplo_dados.sql` | opcional: poucas linhas **fictícias** em Obra/Pessoa/TipoTarefa/Categoria, só para a interface ter o que listar |
