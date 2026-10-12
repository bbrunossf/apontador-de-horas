# Por que pg8000 (e não psycopg/sqlite3)

Esta pasta `sql/` guarda os scripts de criação do banco. Os arquivos virão do **DBeaver** (DDL
gerado a partir do banco real) — este documento explica apenas a decisão de driver, que ficou
registrada no código.

## A trilha, como está no código

O `apontador_horas.py` ainda carrega as marcas da migração:

```python
#import sqlite3
#import psycopg
#from psycopg import sql

import pg8000
```

Ou seja, o projeto passou por **três drivers**:

1. **`sqlite3`** — primeira fase: banco em arquivo (o `data.db` desta cópia é o resto dela), com o
   arquivo hospedado em drive de rede mapeado. Simples de distribuir, ruim para múltiplos
   usuários ao mesmo tempo (é um arquivo só; trava com escrita concorrente e não aceita dois
   computadores gravando sem risco de corrupção).
2. **`psycopg`** (psycopg3) — a tentativa de ir para PostgreSQL. Foi abandonado.
3. **`pg8000`** — o driver que ficou.

## O motivo técnico

O aplicativo é distribuído como **um único `.exe` gerado pelo Nuitka** (`--standalone --onefile`).
Isso muda o critério de escolha do driver:

| Driver | Dependência | Consequência no empacotamento |
|---|---|---|
| `psycopg` (psycopg3) e `psycopg2` | biblioteca **libpq** compilada (DLL no Windows) | o Nuitka precisa localizar e embarcar a DLL; é a origem clássica de "funciona na minha máquina, quebra no `.exe`" |
| `pg8000` | **Python puro**, zero binário | entra no `.exe` como qualquer módulo; nada para embarcar, nada para faltar |

Ou seja: `pg8000` foi escolhido por **empacotamento**, não por desempenho. É a decisão certa para
este caso de uso — um app de apontamento faz poucas consultas curtas por hora; o custo de um driver
puro é irrelevante. Para carga pesada (milhares de linhas em lote), `psycopg` com libpq é bem mais
rápido — e aí a DLL passa a ser um problema que vale resolver.

## O que a escolha custou

- **Desempenho**: `pg8000` é mais lento que um driver com libpq. Irrelevante aqui, mas é bom saber
  o motivo caso apareça lentidão em consultas grandes.
- **Recursos**: algumas funcionalidades específicas do protocolo (cursores nomeados, `COPY`
  otimizado, certos tipos) exigem mais código com `pg8000`. O app não usa nenhuma delas.
- **Uma conexão por operação**: o código abre e fecha conexão a cada consulta
  (`get_connection()` faz `pg8000.connect(...)` + `SET search_path TO <schema>`), em vez de manter
  um pool. Simples e robusto para um app desktop com um usuário — e evita a conexão "pendurada"
  quando a rede do escritório cai; em troca, cada ação paga o custo de reconectar.

> Registro de honestidade: a justificativa acima foi reconstruída da evidência no código (os
> imports comentados, o `pg8000.connect` direto e o tutorial do Nuitka). Se a razão original foi
> outra, o autor corrige aqui — o texto existe para que a decisão não fique sem explicação.
