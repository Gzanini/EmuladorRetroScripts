@echo off

rem Este script cancela a espera da senha em bloqueio_personalizado.bat

echo 1 > "%APPDATA%\Tempo\CancelarSenha.txt"

echo A espera da senha foi cancelada.