@echo off
REM Gera o executavel do Apontador de Horas (Nuitka).
REM Requisitos: Python puro (sem Anaconda), "pip install -r requirements.txt nuitka"
REM e o Visual Studio Build Tools com "Desenvolvimento para desktop com C++".
REM Detalhes: docs\como-gerar-executavel.md

cd /d "%~dp0"
python build.py %*
if errorlevel 1 (
    echo.
    echo Falhou. Veja docs\como-gerar-executavel.md
    pause
    exit /b 1
)
pause
