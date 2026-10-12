# Segurança e credenciais

Este app se conecta a um PostgreSQL da rede do escritório. A versão de origem (`rev14.py`) trazia
**usuário, senha, banco e host escritos dentro do código**, em dois lugares diferentes — além de um
`config.ini` versionado com o mesmo perfil.

## O que existia, onde, e o que fazer

| # | Item | Onde aparecia | O que fazer |
|---|---|---|---|
| 1 | **Senha do PostgreSQL** (3 caracteres) | `rev14.py` (duas ocorrências: `DatabaseManager.__init__` e os defaults de `main()`), `timer_python/config.ini` | Trocar a senha no banco. Não é só pela exposição: é uma senha curta demais para qualquer serviço que aceite conexão de rede |
| 2 | **Usuário e nome do banco** (`plena`) | mesmos locais | Sem ação própria — mas evite o usuário de aplicação com privilégio de superusuário. Crie um usuário só com `SELECT`/`INSERT` nas tabelas `"Obra"`, `"Pessoa"`, `"TipoTarefa"`, `"Categoria"` e `"Registro"` |
| 3 | **Host do banco** (endereço da rede interna) | `rev14.py`, `config.ini` | Confirmar que o PostgreSQL **não aceita conexão de fora da rede local** (`pg_hba.conf` e firewall). Um endereço privado com senha trivial fica exposto no momento em que a porta for encaminhada |
| 4 | **`data.db`** (SQLite da primeira versão, 241 KB) | `timer_python/data.db`, versionado | **Dados reais de apontamento.** Não publicar em nenhuma hipótese — está isolado em `_NAO_PUBLICAR/dados/` |
| 5 | **`app.log`** (5,7 KB) | `timer_python/app.log`, versionado | Log com nomes de obra/pessoas. Isolado em `_NAO_PUBLICAR/logs/` |

Nada disso estava em repositório **público**: o repo `plena` é privado. As chaves existem em texto
claro no histórico do git dele e na pasta de trabalho local.

## Endereço defasado no `config.ini` (descoberto no teste de conexão)

O `config.ini` desta cópia trazia um endereço que **não responde** por esta VPN — não há rota para
aquela faixa. O endereço correto é o mesmo que estava embutido no código antigo, e é o que está
funcionando agora: alcançável pelo túnel `bruno-casa-final` (IP do túnel `10.8.0.4`).

O teste de conexão confirmou o banco de produção: PostgreSQL 16.15, 342 obras, 8 pessoas, 9 tipos de
tarefa, 5 categorias e 28.926 lançamentos. **O `config.ini` do repositório privado continua com o
endereço antigo** — vale corrigir lá também, senão a próxima cópia repete o erro.

## O que foi feito nesta cópia

1. **Credenciais fora do código.** O `rev14.py` sanitizado não tem nenhum dado de conexão: tudo vem
   do `config.ini`, por `carregar_config_banco()`, que valida o schema e avisa quando falta
   preencher.
2. **`config.ini` real não entra no repositório**: está em `_NAO_PUBLICAR/segredos/`, e o
   `.gitignore` cobre `config.ini`, `*.log`, `*.db` e `.env`.
3. **`config.ini.example`** com valores de exemplo, para o usuário copiar e preencher.
4. **Sem marca de cliente e sem nome pessoal** no código (o padrão de usuário era `'Bruno'`; agora é
   vazio).

## Aviso para o futuro (vale para o repositório `plena`)

O histórico do repositório privado `plena` contém, **em commits antigos**:

- a senha e o usuário do banco (no código do timer);
- **`dump_producao.dump`** (973 KB, dump do banco de produção), `prisma/data.db` e
  `timer_python/data.db` versionados;
- chaves de licença de terceiros repetidas em vários arquivos.

Se algum dia um branch desse repositório for publicado — inclusive o `integracao/agente-ifc`, que é
o mais interessante para portfólio — **apagar os arquivos não basta**: eles continuam no histórico.
Publicar exige **repositório novo, com história limpa** (é exatamente o que esta pasta de
laboratório faz para o timer: copia só a última versão, sem o histórico de origem).
