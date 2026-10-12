#!/usr/bin/env python3
"""Gera o executável do Apontador de Horas com Nuitka.

Lê o nome e a versão direto do `apontador_horas.py` (constantes APP_NOME/APP_VERSAO), então não
existe mais o "lembrar de mudar a versão antes de compilar": a versão do executável é a mesma que
aparece na tela "Sobre".

Uso:
    python build.py             # compila
    python build.py --dry-run   # só mostra o comando que seria executado
"""
from __future__ import annotations

import re
import shutil
import subprocess
import sys
from pathlib import Path

RAIZ = Path(__file__).resolve().parent
FONTE = RAIZ / "src" / "app_atual" / "apontador_horas.py"
ICONE = RAIZ / "src" / "app_atual" / "icone.ico"


def constante(nome: str) -> str:
    texto = FONTE.read_text(encoding="utf-8")
    m = re.search(rf'^{nome}\s*=\s*"([^"]+)"', texto, re.M)
    if not m:
        raise SystemExit(f"Não encontrei a constante {nome} em {FONTE}")
    return m.group(1)


def main() -> int:
    if not FONTE.exists():
        raise SystemExit(f"Fonte não encontrada: {FONTE}")

    nome = constante("APP_NOME")
    versao = constante("APP_VERSAO")
    saida = f"apontador_horas_v{versao}.exe"

    comando = [
        sys.executable, "-m", "nuitka",
        "--standalone",
        "--onefile",
        "--enable-plugin=tk-inter",
        "--windows-console-mode=disable",
        "--assume-yes-for-downloads",
        f"--include-data-file={ICONE}={ICONE.name}",
        f"--windows-icon-from-ico={ICONE}",
        f"--output-filename={saida}",
        f"--product-name={nome}",
        f"--file-description={nome}",
        f"--file-version={versao}",
        f"--product-version={versao}",
        str(FONTE),
    ]

    print(f"{nome} — versão {versao}")
    print("comando:")
    print("  " + " ".join(f'"{c}"' if " " in str(c) else str(c) for c in comando))

    if "--dry-run" in sys.argv:
        print("\n(--dry-run: nada foi compilado)")
        return 0

    if shutil.which("cl") is None:
        print("\nAVISO: não encontrei o compilador C (`cl`) no PATH.")
        print("O Nuitka precisa do Visual Studio Build Tools com 'Desenvolvimento para desktop com C++'.")

    print("\ncompilando (a primeira vez demora alguns minutos)...\n")
    resultado = subprocess.run(comando, cwd=RAIZ)
    if resultado.returncode != 0:
        print("\nfalhou. Veja docs/como-gerar-executavel.md")
        return resultado.returncode

    destino = RAIZ / saida
    if destino.exists():
        mb = destino.stat().st_size / 1024 / 1024
        print(f"\npronto: {destino}  ({mb:.1f} MB)")
        print("Lembre de enviar o config.ini.example junto com o executável.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
