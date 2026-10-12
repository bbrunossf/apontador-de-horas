# Manifesto da cópia organizada

Origem: `C:/Users/Bruno/plena` — repositório **privado** (`github.com/bbrunossf/plena`), branch `integracao/agente-ifc`
Caminho de origem dentro do repo: `timer_python/`
Destino: `J:/laboratorio/lab_apontador_horas`
Gerado em: 12/10/2026 16:17
Arquivos copiados da origem: **12** (públicos: 8, privados em `_NAO_PUBLICAR`: 4)
Arquivos **sanitizados**: **1** (`rev14.py` → `apontador_horas.py`)
Arquivos **criados nesta cópia** (não vêm da origem): **9**
Versões antigas deliberadamente NÃO copiadas: **10**

## Verificação entre branches (feita antes de copiar)

O diretório `timer_python/` foi comparado nos três branches com trabalho vivo. Todos os arquivos têm
**blob idêntico** nos três, com uma única exceção:

| Arquivo | `master` | `feature/agente-analise-estrutural` | `integracao/agente-ifc` |
|---|---|---|---|
| `rev14.py` | não existe | não existe | **49.713 bytes (`8f777c7b`)** |
| `rev13.py` e os demais 20 arquivos | `01e3bfe3` (etc.) | idêntico | idêntico |

A última versão do timer existe **apenas** em `integracao/agente-ifc`. Última alteração de
`rev14.py`: commit `801f6df` — *"revisão do timer com seleção metalica/concreto"* (30/09/2026).

## A origem não foi alterada

Confirmado por `git status --porcelain` antes e depois da cópia: limpo nos dois momentos.
A cópia foi feita lendo objetos do git (`git cat-file blob`), sem escrever nada no repositório.

## Arquivos copiados

| # | Origem (relativa) | Destino | Bytes | SHA-256 origem | SHA-256 destino | Obs |
|---|---|---|---|---|---|---|
| 1 | `timer_python/rev14.py` | `_NAO_PUBLICAR/origem/rev14.py` | 49713 | `63234d78cc69f1c7` | `63234d78cc69f1c7` | igual a origem — contém credencial e marca, por isso fora do publicável |
| 2 | `timer_python/icone.ico` | `src/app_atual/icone.ico` | 84051 | `bd47f8365649046e` | `bd47f8365649046e` | igual a origem |
| 3 | `timer_python/make_ico.py` | `src/app_atual/make_ico.py` | 410 | `a7aded2a20a2129f` | `a7aded2a20a2129f` | igual a origem |
| 4 | `timer_python/esquema.png` | `docs/diagramas/esquema.png` | 131771 | `fd3be9d7ea678546` | `fd3be9d7ea678546` | igual a origem |
| 5 | `timer_python/esquema2.svg` | `docs/diagramas/esquema2.svg` | 41779 | `4835895706f3533d` | `4835895706f3533d` | igual a origem |
| 6 | `timer_python/esquema3.svg` | `docs/diagramas/esquema3.svg` | 41608 | `766a8d92bc10642a` | `766a8d92bc10642a` | igual a origem |
| 7 | `timer_python/imagem.png` | `docs/diagramas/imagem.png` | 1155741 | `ff8fe30b34edc235` | `ff8fe30b34edc235` | igual a origem |
| 8 | `timer_python/tutorial nuitka.md` | `docs/bruto/tutorial-nuitka.md` | 845 | `39eaf245770e1bed` | `39eaf245770e1bed` | igual a origem |
| 9 | `timer_python/README.md` | `docs/bruto/README-versao-sqlite.md` | 3438 | `12205d6d8e9629da` | `12205d6d8e9629da` | igual a origem — descreve a versão SQLite (histórico) |
| 10 | `timer_python/config.ini` | `_NAO_PUBLICAR/segredos/config.ini` | 193 | `88500fe1e0c3fdc5` | `88500fe1e0c3fdc5` | igual a origem — perfil de conexão real |
| 11 | `timer_python/data.db` | `_NAO_PUBLICAR/dados/data.db` | 241664 | `cc438e6f4fad8f73` | `cc438e6f4fad8f73` | igual a origem — dados reais |
| 12 | `timer_python/app.log` | `_NAO_PUBLICAR/logs/app.log` | 5725 | `112d85286f051dc7` | `112d85286f051dc7` | igual a origem — log com nomes |
| 13 | `timer_python/rev14.py` | `src/app_atual/apontador_horas.py` | 49713 | `63234d78cc69f1c7` | `3c01b861ed82253d` | **sanitizado** — ver *O que mudou na sanitização* no README |

## Arquivos criados nesta cópia

Não vêm da origem — foram escritos aqui, para transformar o app em produto publicável.

| # | Arquivo | Bytes | SHA-256 | Papel |
|---|---|---|---|---|
| 1 | `.gitignore` | 226 | `301b1c1899559725` | — |
| 2 | `config.ini.example` | 576 | `d7ce554c9ffc49fd` | — |
| 3 | `requirements.txt` | 184 | `6c4055fc2268585e` | — |
| 4 | `README.md` | 5509 | `020822d2e302c57f` | — |
| 5 | `SECURITY.md` | 3117 | `1eb68b6e0ba16f70` | — |
| 6 | `docs/schema-do-banco.md` | 3064 | `1d938532a8b80387` | — |
| 7 | `docs/como-gerar-executavel.md` | 3639 | `3a247ebd26fb0ed9` | — |
| 8 | `docs/por-que-pg8000.md` | 2941 | `c11c505989713e7c` | — |
| 9 | `sql/LEIA-ME.md` | 1434 | `ab8780aa4b59d368` | — |

## Arquivos NÃO copiados (versões antigas, mantidas no repositório privado)

| Arquivo | Bytes | Motivo |
|---|---|---|
| `rev10.py` | 40.930 | versão antiga |
| `rev11a.py` | 43.134 | versão antiga |
| `rev12.py` | 42.758 | versão antiga |
| `rev12a.py` | 42.644 | versão antiga |
| `rev12b.py` | 42.686 | versão antiga |
| `rev12c.py` | 44.947 | versão antiga |
| `rev12d.py` | 43.514 | versão antiga |
| `rev12e.py` | 39.333 | versão antiga |
| `rev12f_pre.py` | 39.314 | versão antiga |
| `rev12f_pre.exe` | 11.820.544 | binário compilado (não é fonte) |

## Onde fica cada coisa

| Destino | Papel | Entra em repositório público? |
|---|---|---|
| `src/app_atual/apontador_horas.py` | a aplicação sanitizada | sim |
| `src/app_atual/icone.ico`, `make_ico.py` | ícone e utilitário que o gerou | sim |
| `docs/diagramas/` | esquema do banco (png/svg) e imagem do app | sim |
| `docs/bruto/` | material de origem ainda não tratado | revisar antes |
| `docs/*.md` | documentação escrita nesta cópia | sim |
| `sql/` | scripts de criação do banco (a gerar no DBeaver) | sim |
| `_NAO_PUBLICAR/origem/rev14.py` | fonte original, com credencial e marca | **não** |
| `_NAO_PUBLICAR/segredos/config.ini` | perfil de conexão real | **não** |
| `_NAO_PUBLICAR/dados/data.db` | SQLite da versão antiga, com dados reais | **não** |
| `_NAO_PUBLICAR/logs/app.log` | log com nomes de obra e de pessoas | **não** |

`_NAO_PUBLICAR/` está no `.gitignore` e nunca entra em repositório público.

## Arquivos acrescentados depois da cópia (DDL do banco)

Gerados pelo autor no **DBeaver**, em 12/10/2026, a partir do banco PostgreSQL de origem (acesso por VPN). Não vêm do repositório: são um artefato novo deste laboratório.

| # | Arquivo | Bytes | SHA-256 | Origem |
|---|---|---|---|---|
| 1 | `sql/Cliente.sql` | 257 | `c36750de40c41408` | DBeaver, 12/10/2026 |
| 2 | `sql/TipoTarefa.sql` | 253 | `b229374becff9696` | DBeaver, 12/10/2026 |
| 3 | `sql/Categoria.sql` | 250 | `986f7681e2da5268` | DBeaver, 12/10/2026 |
| 4 | `sql/Pessoa.sql` | 357 | `d795709dd4e234bd` | DBeaver, 12/10/2026 |
| 5 | `sql/Obra.sql` | 975 | `950f870b4eff0640` | DBeaver, 12/10/2026 |
| 6 | `sql/Registro.sql` | 1349 | `a7f7a0211c114c61` | DBeaver, 12/10/2026 |

Conferência: todas as colunas usadas pelo app existem no DDL; as três colunas de etapa já vêm no `CREATE TABLE` (o `ALTER TABLE` previsto é desnecessário). Detalhes em `sql/LEIA-ME.md`.
