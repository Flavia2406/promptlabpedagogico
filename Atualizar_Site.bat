@echo off
setlocal enabledelayedexpansion
color 0B
title Atualizador do Site da Flavia

echo =================================================================
echo                 ATUALIZADOR DO SITE DA FLAVIA
echo =================================================================
echo.
echo Procurando os arquivos do seu site na pasta...
echo.

set count=0
for %%F in (*.html) do (
    set /a count+=1
    set "file[!count!]=%%F"
    echo [!count!] %%F
)

if !count! equ 0 (
    color 0C
    echo.
    echo =================================================================
    echo ERRO: NENHUM ARQUIVO HTML FOI ENCONTRADO NA PASTA
    echo =================================================================
    echo Por favor, coloque um arquivo .html nesta mesma pasta.
    echo.
    pause
    exit /b
)

echo.
echo Qual arquivo voce deseja publicar como sua pagina principal?
set /p choice="Digite o numero correspondente (1 a !count!) e aperte ENTER: "

if not defined file[!choice!] (
    color 0C
    echo.
    echo OPCAO INVALIDA! O numero digitado nao esta na lista.
    echo Feche esta janela e abra o atualizador novamente.
    echo.
    pause
    exit /b
)

for /f "delims=" %%A in ("!choice!") do set "selected_file=!file[%%A]!"

echo.
echo -----------------------------------------------------------------
echo Excelente! Voce escolheu publicar: !selected_file!
echo -----------------------------------------------------------------
echo.

if /I not "!selected_file!"=="index.html" (
    echo [Passo 1/3] Ajustando o arquivo para o formato padrao da web...
    copy /Y "!selected_file!" "index.html" > nul
) else (
    echo [Passo 1/3] Arquivo validado...
)

echo [Passo 2/3] Preparando arquivos e salvando nova versao...
git add . > nul 2>&1
set DATA_HORA=%date% %time:~0,5%
git commit -m "Publicou arquivo: !selected_file! em !DATA_HORA!" > nul 2>&1

echo [Passo 3/3] Enviando para a internet (GitHub)...
echo.
git push origin main

if !errorlevel! neq 0 (
    color 0C
    echo.
    echo =================================================================
    echo OPS OCORREU UM ERRO AO ENVIAR PARA A INTERNET.
    echo =================================================================
    echo - Verifique sua conexao com a internet.
    echo - Tire uma foto desta tela para mostrar ao Flavio.
    echo.
    pause
    exit /b
)

color 0A
echo.
echo =================================================================
echo DEU TUDO CERTO! SEU SITE FOI ATUALIZADO COM SUCESSO!
echo =================================================================
echo.
echo Lembrete: O sistema leva cerca de 2 minutinhos para atualizar 
echo o visual no link oficial. Tenha paciencia antes de clicar.
echo.
echo Link do seu site online:
echo https://flavia2406.github.io/promptlabpedagogico/
echo.
echo =================================================================
echo.
echo O processo terminou. Pode fechar esta janela.
pause > nul