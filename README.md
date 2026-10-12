# Apontador de Horas

Aplicação desktop (Windows) para **registrar horas trabalhadas por projeto e tarefa**. Fica aberta
no canto da tela contando o tempo; a cada intervalo (padrão: 60 minutos) pede o lançamento — projeto,
tarefa, categoria e etapa de trabalho — e grava no PostgreSQL.

Produto **whitelabel**: nenhuma marca, nenhum nome de cliente e nenhuma credencial dentro do código.

## Origem desta cópia

| | |
|---|---|
| **Origem** | `C:\Users\Bruno\plena` — repositório **privado** `github.com/bbrunossf/plena`, branch `integracao/agente-ifc` (o único que contém a última versão do timer) |
| **Arquivo de origem** | `timer_python/rev14.py` — 49.713 bytes, último commit `801f6df` (30/09/2026) |
| **Destino** | `J:\laboratorio\lab_apontador_horas` |
| **Verificação** | SHA-256 de origem e destino por arquivo em `MANIFESTO.md`; a origem não foi alterada (leitura por objetos do git, sem tocar no disco) |

Escopo da cópia: **somente a última versão**. As versões `rev10` a `rev13` (e um `.exe` compilado)
ficaram no repositório privado, íntegras e intactas.

## O que o app faz

- **Cronômetro regressivo** para o intervalo de apontamento, com janela compacta que preserva
  posição e tamanho entre sessões.
- **Tela de lançamento**: projeto (obra), tarefa, categoria, duração e, desde a rev14, a **etapa de
  trabalho** (estrutura metálica, concreto armado ou concreto pré-moldado — no máximo uma).
- **Hora extra** e **lançamento parcial** (apontar um intervalo menor que o cronômetro).
- **Consulta dos lançamentos do dia** e dos últimos N dias.
- **Reconexão**: se o banco estiver fora, abre um diálogo de nova tentativa em vez de fechar.
- **Configurações** salvas em `config.ini` (usuário, intervalo, posição da janela).

## Como rodar

```bash
python -m venv .venv && .venv\Scripts\activate
pip install -r requirements.txt
copy config.ini.example config.ini    # e preencha os dados de conexão
python apontador_horas.py
```

O banco precisa ter as tabelas `"Obra"`, `"Pessoa"`, `"TipoTarefa"`, `"Categoria"` e `"Registro"` —
veja **[docs/schema-do-banco.md](docs/schema-do-banco.md)** e os scripts em `sql/`.

## Como gerar o `.exe`

**[docs/como-gerar-executavel.md](docs/como-gerar-executavel.md)** — passo a passo com Nuitka,
explicação de cada opção, assinatura do executável e as armadilhas conhecidas.

## Por que pg8000

**[docs/por-que-pg8000.md](docs/por-que-pg8000.md)** — driver Python puro, escolhido pelo
empacotamento: sem libpq/DLL, o `.exe` de arquivo único funciona sem depender de binário externo.

## Estrutura

```
lab_apontador_horas/
├── src/app_atual/apontador_horas.py   # a aplicação (1.281 linhas)
├── src/app_atual/icone.ico            # ícone do app e do executável
├── src/app_atual/make_ico.py          # utilitário que gerou o .ico a partir de uma imagem
├── config.ini.example                 # modelo de configuração (o config.ini real é ignorado pelo git)
├── requirements.txt                   # pg8000
├── docs/
│   ├── schema-do-banco.md             # tabelas e colunas que o app exige
│   ├── como-gerar-executavel.md       # build do .exe (Nuitka)
│   ├── por-que-pg8000.md              # decisão do driver
│   ├── diagramas/                     # esquema do banco (png/svg) e imagem do app
│   └── bruto/                         # material de origem ainda não tratado
├── sql/                               # scripts de criação do banco (ver LEIA-ME)
├── MANIFESTO.md                       # auditoria da cópia (hashes)
└── SECURITY.md                        # o que era sensível e o que foi feito
```

## O que mudou na sanitização

| Item | Original (`rev14.py`) | Nesta versão |
|---|---|---|
| Nome do app | `"Timer Plena"` no título da janela | constante `APP_NOME` = *Apontador de Horas* |
| Rodapé do "Sobre" | `© 2026 Plena Engenharia Estrutural` | constante `APP_AUTOR` |
| Versão exibida | texto fixo `"Versão 14"` | constante `APP_VERSAO` = `1.0.0` |
| Credenciais | `user`, `password`, `database`, `host` **embutidos no código** (dois lugares) | lidas do `config.ini` por `carregar_config_banco()`, com validação |
| Schema do banco | fixo no código (`schema='public'`), exigia edição manual antes de cada build | chave `schema` no `config.ini` |
| Nome de usuário padrão | `'Bruno'` quando o config vinha vazio | vazio |
| Imports | 8 imports sem uso (`requests`, `hashlib`, `subprocess`, `shutil`, `json`, `sys`, `filedialog`, `timedelta`) e comentários de drivers antigos | removidos |
| Cabeçalho | docstring da rev14 | docstring do produto, citando o schema exigido |

**Nada da lógica foi alterado**: as consultas, a interface, os diálogos e o fluxo de apontamento
são os do `rev14.py`.

## Estado e pendências

- [x] Cópia da última versão, com hashes conferidos (`MANIFESTO.md`)
- [x] Sanitização: sem marca, sem credencial, sem imports mortos
- [x] **Sintaxe verificada** (`py_compile` OK) — a aplicação, porém, **não foi executada contra um
      banco**: o Postgres de origem está numa rede privada à qual esta máquina não tem acesso
- [ ] Scripts SQL de criação das tabelas (a gerar no **DBeaver** e salvar em `sql/`)
- [ ] Teste real de execução + build do `.exe` numa máquina limpa
- [ ] `LICENSE` (a definir: MIT, se for para uso aberto)
- [ ] Decidir o nome definitivo do produto e o repositório público
