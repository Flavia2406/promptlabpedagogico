@echo off
color 0E
title Configurando Conexao com o GitHub

echo =================================================================
echo             CONECTANDO ESTA PASTA AO GITHUB DA FLAVIA
echo =================================================================
echo.
echo Ola! Vi que esta e a sua primeira vez configurando esta pasta
echo neste computador.
echo.
echo Vou conectar ela com o seu repositorio na nuvem...
echo.

git init
git remote add origin https://github.com/Flavia2406/promptlabpedagogico.git
git fetch origin
git branch -M main
git reset --mixed origin/main

echo.
echo =================================================================
echo TUDO CONECTADO COM SUCESSO!
echo =================================================================
echo.
echo Agora sua pasta ja sabe conversar com o GitHub.
echo Pode fechar esta tela e dar um duplo-clique no arquivo
echo "Atualizar_Site.bat" que agora ele vai funcionar perfeitamente!
echo.
pause