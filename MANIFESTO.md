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

## Arquivos acrescentados depois da cópia

### DDL do banco (DBeaver, 12/10/2026)

| # | Arquivo | Bytes | SHA-256 | Situação |
|---|---|---|---|---|
| 1 | `sql/TipoTarefa.sql` | 356 | `8345eb22fadb63db` | enxugado |
| 2 | `sql/Categoria.sql` | 358 | `a9bc5392447c077f` | enxugado |
| 3 | `sql/Pessoa.sql` | 460 | `ccbe005105a14690` | enxugado |
| 4 | `sql/Obra.sql` | 855 | `b1b1c28456c56be6` | enxugado |
| 5 | `sql/Registro.sql` | 1674 | `a20886668c5c8107` | enxugado |

Os seis arquivos como o DBeaver os gerou (incluindo `Cliente.sql`, que saiu do conjunto) estão
preservados em `_NAO_PUBLICAR/origem-ddl/`, fora do repositório. O que foi enxugado, por tabela,
está em `sql/LEIA-ME.md`.

### Demais arquivos criados por último

| Arquivo | Bytes | SHA-256 | Papel |
|---|---|---|---|
| `LICENSE` | 1071 | `364407ed12e3df47` | MIT, Copyright (c) 2026 Bruno Oliveira |

## Histórico de alterações desta cópia

| # | Quando | Alteração | Por quê |
|---|---|---|---|
| 1 | 12/10/2026 16:32 | `rev14.py` → `apontador_horas.py`, com marca e credenciais fora do código | produto whitelabel publicável |
| 2 | 12/10/2026 16:32 | `timedelta` **reposto** no import do `datetime` | eu o havia removido por engano: meu verificador procurava `timedelta.` (acesso a atributo), mas ele é usado como **chamada** (`timedelta(minutes=...)`), 7 vezes. O `py_compile` passou; só a **execução** do app revelou o `NameError` |
| 3 | 12/10/2026 16:32 | default de `initial_time` no código: `'10'` → `'3600'` | sem `config.ini`, o app criava o arquivo com **10 segundos** de intervalo — e a interface pediria um lançamento a cada 10 s |
| 4 | 12/10/2026 16:32 | `APP_AUTOR` = `© 2026 Bruno Oliveira` | preencher o rodapé do "Sobre" (era só `© 2026`) |
| 5 | 12/10/2026 16:32 | `config.ini.example`: `initial_time` documentado como **segundos** (3600) | o exemplo dizia "em minutos" e trazia 60 — daria 1 minuto em vez de 1 hora |
| 6 | 12/10/2026 16:32 | DDL enxugado para as colunas usadas (6 → 5 arquivos) | decisão do autor: publicar só o que o app exige |
| 7 | 12/10/2026 16:32 | `LICENSE` criado | publicação com licença explícita |

| 8 | 12/10/2026 17:43 | `ETAPAS_TRABALHO` e `SEM_ETAPA` **restaurados** | apagados por engano na correção anterior: o script substituiu um trecho por **fatia** (`texto[:ini] + novo + texto[fim:]`) e o intervalo engolia as duas constantes, que viviam entre os imports e a primeira classe. **Efeito:** a janela "Registre a Tarefa!" morria no meio da construção — no Tk a exceção é engolida e a janela fica pela metade, com os widgets criados **antes** da falha visíveis. Só o dropdown de projeto aparecia; tarefa e categoria (criados depois) não existiam. Relatado pelo autor ao usar o app |

| 9 | 12/10/2026 17:54 | "Time Tracker" → `APP_NOME` no diálogo "Sobre" | marca esquecida: o título dentro do diálogo tinha o nome antigo do app. A varredura de identidade procurava a marca do cliente ("Plena") e o nome pessoal, mas **não o nome anterior do próprio app** — que é exatamente onde a marca se esconde depois de um rename |
| 10 | 12/10/2026 17:54 | Telas do app capturadas para o README (`docs/imagens/`) | geradas com a aplicação em execução contra o banco de origem, capturadas por `PrintWindow` (só a janela, sem o que está atrás) e com **dados fictícios** no campo de projeto |

## Verificação contra o banco de origem

Executada em 12/10/2026 16:32, com a VPN ativa, usando o `config.ini` desta cópia (host que responde pela
VPN) e a **própria classe `DatabaseManager` do app**:

| Verificação | Resultado |
|---|---|
| Conexão | PostgreSQL 16.15 (Ubuntu 24.04) |
| `check_tables_exist()` | verdadeiro |
| `get_all_projects()` | 342 obras, **0 entradas vazias** |
| `get_user_names()` | 8 pessoas, incluindo `Bruno` |
| `get_categorias()` | 5 |
| Colunas de etapa detectadas em `information_schema` | as 3 |
| `"Registro"` | 28.926 lançamentos |

A interface foi aberta conectada a esse banco: janela "Apontador de Horas", cronômetro em contagem
regressiva de 1 hora (60:00), sem diálogo de erro de conexão.

## Hashes atuais dos arquivos publicáveis

| Arquivo | SHA-256 |
|---|---|
| `.gitignore` | `301b1c18995597258ee2ee88f7b92f723804ac4be68ed57bda8a1838009f0af4` |
| `MANIFESTO.md` | `2c485dc1fd13bfcbba0d04bc4f5d4163c827d7e927e6791d7c3a64fd6889c84b` |
| `README.md` | `f5b93bfad12bfac93611fbfd82a503d6b543cec69420a237b96aba1b0ffa35d9` |
| `SECURITY.md` | `07c142c772776bcb3b73dfc25a7a28e9ad189694fe6cf9d840adc819ee092fbc` |
| `config.ini.example` | `f0c6aa9f622824debd18b598282b70846195e9d5bb10dfcfb8beac921fcb39ba` |
| `docs/bruto/README-versao-sqlite.md` | `12205d6d8e9629da4c50291f1fe82f9e944005edce9d363a659b7ea3bf4d4463` |
| `docs/bruto/tutorial-nuitka.md` | `39eaf245770e1bed146a83e44009dcfed20d033e0e11760d281d4c8272a79bfd` |
| `docs/como-gerar-executavel.md` | `3a247ebd26fb0ed92ec7bc25eac7527fb67af4e7613e293586d91d98e1684cf3` |
| `docs/diagramas/esquema.png` | `fd3be9d7ea6785467542e6c32433d9b8aadaecc54189d71d40d6a6b85074a74e` |
| `docs/diagramas/esquema2.svg` | `4835895706f3533d6db82eb709e962035ce6d03d31f129f1b316b6b9826a166f` |
| `docs/diagramas/esquema3.svg` | `766a8d92bc10642a6aa7644e021702902fa44d76193e5eaf4d181f8d9b2b46e9` |
| `docs/diagramas/imagem.png` | `ff8fe30b34edc2355ebfec5300fc21f1db414542c76949e5833d58fc9bdbeb2b` |
| `docs/por-que-pg8000.md` | `c11c505989713e7c8b389a600cf1436ac3b2440cc5cb333ea6032a8f871a800d` |
| `docs/schema-do-banco.md` | `1d938532a8b80387474bfb95d387f6748680b66a18d5e81fb18c0efe02410b10` |
| `requirements.txt` | `6c4055fc2268585ecae2ef288601d66a70b115fe650bf3538cd1fef9509e751a` |
| `sql/Categoria.sql` | `a9bc5392447c077f9aa3d907d842d71efab0acb558bce0d1de2c172f167c7976` |
| `sql/LEIA-ME.md` | `50b75a6559b57160e9e102f45939209afd66a627b67d6710cc5bff0f6d62817a` |
| `sql/Obra.sql` | `b1b1c28456c56be63d6a72a921551c8433cb0fbb295534aecb6d2e4bf2bd52f6` |
| `sql/Pessoa.sql` | `ccbe005105a146906e1a7ea4f1666ec7d09eb0d184219003c6744057458009ff` |
| `sql/Registro.sql` | `a20886668c5c8107eeb6d0ad6368a27229a992af5db8b370a431d81643f8c36a` |
| `sql/TipoTarefa.sql` | `8345eb22fadb63db2e44b0e32abe8a56eb2e1330e320bd70b99e1cfbad0b95aa` |
| `src/app_atual/apontador_horas.py` | `f96f61e61d4b51973df3b270c216a001cce92142cb541507551bd306d8a1ca17` |
| `src/app_atual/icone.ico` | `bd47f8365649046e211baf9df6a7734b2cb727cd891157edae03ce03eee9b350` |
| `src/app_atual/make_ico.py` | `a7aded2a20a2129f58fd94483a84dab23d024eed32ce28ff1928fe4aad66aee2` |

## Como este defeito foi encontrado (e como não repetir)

O autor abriu a tela de apontamento e viu **só o campo de projeto**. Sintoma de "janela pela
metade" não é problema de dados: é exceção durante a montagem da interface. A reprodução foi
headless — instanciar a janela num `tk.Tk()` com `withdraw()` e ler `widget['values']` de cada
campo — e o `NameError: name 'SEM_ETAPA' is not defined` apareceu na hora (a causa já era
conhecida da verificação anterior, mas não do uso).

O que provou o tamanho do estrago foi a comparação da **AST** dos dois arquivos
(`_NAO_PUBLICAR/origem/rev14.py` contra `src/app_atual/apontador_horas.py`, colhendo
`FunctionDef`, `ClassDef` e `Assign`): nome perdido, zero — 6 classes, 55 funções e as constantes
do whitelabel. Sem isso, a busca seria no escuro.

Regra que ficou desta cópia: **edição por fatia exige conferir o intervalo**, e a integridade se
confere por nome (AST), não por leitura.

## Verificação do estado atual (12/10/2026 17:43)

Depois do conserto, a janela foi montada de verdade contra o banco de origem e cada campo lido:

| Campo | Opções | Observação |
|---|---|---|
| projeto | 342 | itens são texto limpo (`000 - PLANEJAMENTO`) |
| tarefa | 9 | restaura a tarefa do último lançamento |
| categoria | 5 | preenche ao escolher a tarefa |
| etapa | 4 (3 + "não se aplica") | `ETAPAS_TRABALHO` + `SEM_ETAPA` |

O caminho de gravação resolvendo os ids por consulta (sem escrever nada): `id_obra` 211,
`id_tipo_tarefa` 8, `id_categoria` 3, `id_nome` 5 (Bruno).

## Telas publicadas no README (12/10/2026 17:54)

| Arquivo | Tamanho | O que mostra |
|---|---|---|
| `docs/imagens/principal.png` | 416x239 | cronômetro em contagem, menu e botões Pause/Reset |
| `docs/imagens/registrar-tarefa.png` | 316x459 | a tela "Registre a Tarefa!" com projeto (fictício), etapa, tarefa, subtarefa (categoria) e hora extra |
| `docs/imagens/sobre.png` | 316x219 | "Sobre": nome, versão e autoria vindos das constantes |

Como foram feitas (ferramentas guardadas em `_NAO_PUBLICAR/`, fora do repositório):

1. `abre_janela.py <principal|tarefa|sobre>` monta **uma** janela por vez com o banco real e fica
   no `mainloop`. Dois detalhes que custaram tentativas: a janela principal **é** o `root` (não pode
   ser escondida), e as janelas `transient` ficam invisíveis se o pai estiver `withdrawn` — o root
   vai para fora da tela (`1x1+-3000+-3000`) em vez de ser escondido.
2. `captura_limpa.ps1 -Titulo "<titulo da janela>" -Saida <png>` acha a janela por `EnumWindows`
   (o `FindWindow` não encontra esses Toplevel do Tk) e captura com `PrintWindow` + `PW_RENDERFULLCONTENT`,
   que renderiza **só a janela** — sem o papel de parede aparecendo nas bordas da sombra.

Nenhuma escrita foi feita no banco durante as capturas.
