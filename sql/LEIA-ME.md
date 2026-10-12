# Scripts de criação do banco

DDL gerado no **DBeaver** a partir do banco de origem (12/10/2026), um arquivo por tabela. Sem
dados: nenhum `INSERT`, nenhum `COMMENT ON`, nenhum `GRANT`.

## Ordem de execução

As chaves estrangeiras são criadas por `ALTER TABLE` no fim de cada arquivo, então **a ordem
importa**:

```
1. Cliente.sql      (Obra referencia Cliente)
2. TipoTarefa.sql
3. Categoria.sql
4. Pessoa.sql
5. Obra.sql         (FK -> Cliente)
6. Registro.sql     (FK -> Obra, Pessoa, TipoTarefa, Categoria)
```

Todos os arquivos criam objetos no schema `public`. Se o banco usar outro schema, ajuste tanto o
DDL quanto a chave `schema` do `config.ini`.

## Conferência contra o app

| Verificação | Resultado |
|---|---|
| Toda coluna que o `apontador_horas.py` lê ou escreve existe no DDL? | **sim** — 5 tabelas, todas conferidas |
| As 3 colunas de etapa (`trabalho_metalica`, `trabalho_concreto_armado`, `trabalho_pre_moldado`) existem? | **sim**, `bool NULL` — o `ALTER TABLE` previsto é desnecessário |
| Arquivos das tabelas referenciadas por FK | todos presentes (inclusive `Cliente`, que só existe por causa do FK de `Obra`) |
| Dado real nos scripts | nenhum |

## Observações sobre o schema gerado

1. **Colunas que o app não usa** vieram junto, porque são do sistema completo: em `Obra`
   (`id_cliente`, `data_inicio`, planejamento, `tipo_obra`, `finalizada`, `historico`,
   `peso_informado_kg`, `peso_nao_aplicavel`), em `Pessoa` (`funcao`, `email`, `data_criacao`,
   `ativo`) e em `Registro` (`adicionado_bot`). São inofensivas (`NULL`/`DEFAULT`), mas revelam o
   desenho do sistema de origem — decidir na publicação se ficam ou se o schema é enxugado para o
   mínimo que o app exige (a lista mínima está em `../docs/schema-do-banco.md`).
2. **`cod_obra` é nullable e único** em `Obra`. O app monta o rótulo com
   `cod_obra || ' - ' || nome_obra` — e no PostgreSQL `NULL || texto` resulta em **NULL**. Ou seja:
   uma obra sem código aparece como **linha vazia** no menu, e o app depois faz
   `split(' - ')[0]` nessa string vazia. Vale corrigir em um dos dois lados: preencher `cod_obra` no
   banco (ou torná-la `NOT NULL`), ou usar `COALESCE` na consulta do app.
3. **`Pessoa.ativo` existe mas o app não filtra por ele** — a lista de usuários traz também as
   pessoas inativas (`SELECT nome FROM "Pessoa" ORDER BY nome`).
4. **Sequências**: os `serial4` já criam as sequences necessárias; não há script extra de sequence.

## Alteração deste DDL depois de publicado

Se algum arquivo mudar, registre no `../MANIFESTO.md` (seção de arquivos criados/alterados nesta
cópia) e confira de novo contra `../docs/schema-do-banco.md`.
