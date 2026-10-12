- rodar no ambiente python puro (sem Anaconda)
- instalar as dependências (pode criar um ambiente virtual)
- instalar o compilador com o VS build
- executar o nuitka (deixar ele baixar o que for necessário)
	sintaxe completa:
	nuitka --standalone --onefile --enable-plugin=tk-inter --windows-console-mode=disable --include-data-file=icone.ico=icone.ico --windows-icon-from-ico=icone.ico rev13.py
	


standalone: cria versão auto-dependente, sem precisar de pacotes externos
onefile: cria um único arquivo executável
windows-disable-console: oculta a tela de console
windows-icon-from-ico: adiciona um ícone .ico ao executável
include-data-file=icone.ico=icone.ico: incorpora o .ico ao executável

- assinar o executável

## LEMBRAR DE MUDAR O SCHEMA ANTES DE COMPILAR
### LEMBRAR DE MUDAR A VERSÃO ANTES DE COMPILAR
