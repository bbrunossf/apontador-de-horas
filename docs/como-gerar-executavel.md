# Como gerar o executável para Windows

Resumo do que era uma anotação solta (`docs/bruto/tutorial-nuitka.md`), agora com o passo a passo e
o motivo de cada opção. A aplicação vira **um único `.exe`** com o [Nuitka](https://nuitka.net/).

## Requisitos

1. **Python puro, sem Anaconda.** O ambiente do Anaconda traz DLLs próprias que o Nuitka tenta
   embarcar e acabam gerando `.exe` que só abre na máquina que compilou. Use o Python do
   python.org ou um ambiente virtual limpo.
2. **Dependências do app:** `pip install -r requirements.txt` (só o `pg8000`; o Tkinter já vem no
   Python do Windows).
3. **Compilador C:** Nuitka compila de verdade (não só empacota). Instale o *Visual Studio Build
   Tools* com a carga de trabalho "Desenvolvimento para desktop com C++".
4. **Nuitka:** `pip install nuitka`. Na primeira execução ele baixa o que precisar.

## Comando

O caminho normal no repositório é `python build.py` (ou `build.bat`): ele monta este comando
sozinho, lendo `APP_NOME`/`APP_VERSAO` do código e nomeando a saída como
`apontador_horas_v<versão>.exe`. O comando manual abaixo fica para quem quiser entender as opções,
ajustar algo ou compilar sem o script.

```bash
nuitka --standalone --onefile --enable-plugin=tk-inter --windows-console-mode=disable \
       --include-data-file=icone.ico=icone.ico --windows-icon-from-ico=icone.ico \
       apontador_horas.py
```

| Opção | O que faz |
|---|---|
| `--standalone` | reúne tudo o que o programa precisa (Python, bibliotecas) junto do executável, sem depender do que está instalado na máquina |
| `--onefile` | junta esse conjunto em **um** arquivo `.exe` (ele se extrai numa pasta temporária ao abrir) |
| `--enable-plugin=tk-inter` | garante que o Tkinter e seus arquivos de suporte entrem no pacote — sem isso, a janela não abre no `.exe` |
| `--windows-console-mode=disable` | esconde a janela de console preta atrás da interface |
| `--include-data-file=icone.ico=icone.ico` | embarca o ícone **dentro** do executável (o app chama `icone.ico` em tempo de execução) |
| `--windows-icon-from-ico=icone.ico` | usa o mesmo `.ico` como ícone do arquivo no Windows |

Resultado: `apontador_horas.exe` na pasta `dist/` (ou no diretório atual, conforme a versão do
Nuitka).

## Depois de compilar

1. **Assinar o executável.** Sem assinatura, o Windows SmartScreen mostra "editor desconhecido" e
   alguns antivírus bloqueiam — falsos positivos são comuns em executáveis de um arquivo só.
   Use um certificado de assinatura de código (`signtool sign /f certificado.pfx /p senha /fd sha256 apontador_horas.exe`).
2. **Entregar o `config.ini` junto.** O `.exe` lê o `config.ini` da **pasta onde ele está**. Mande
   o `config.ini.example` para o usuário copiar e preencher — nunca embuta credencial no
   executável.
3. **Testar em uma máquina sem Python** (o teste que importa: o `.exe` não deve depender de nada
   instalado).

## As duas armadilhas que estavam anotadas no tutorial antigo

O texto original terminava com dois avisos em caixa alta. Os dois eram consequência de valores
fixos dentro do código:

| Aviso antigo | Situação nesta versão |
|---|---|
| **"LEMBRAR DE MUDAR O SCHEMA ANTES DE COMPILAR"** | **Resolvido**: o schema saiu do código e passou a ser lido do `config.ini` (chave `schema`), com validação. Não há mais nada para editar antes de compilar |
| **"LEMBRAR DE MUDAR A VERSÃO ANTES DE COMPILAR"** | **Ainda vale, mas agora é um lugar só**: a versão exibida no "Sobre" vem da constante `APP_VERSAO`, no topo do `apontador_horas.py` |

## Sobre o ambiente de compilação

O build do Nuitka costuma demorar alguns minutos na primeira vez (ele compila o código C gerado) e
exige os mesmos cuidados de qualquer empacotamento: rode o build numa máquina limpa, com as
dependências do `requirements.txt`, e guarde o comando acima num script (`build.bat`) para não
depender de memória.
