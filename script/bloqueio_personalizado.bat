@echo off
set "senha_correta=MinhaSenha123"
set "tempo_bloqueio=%1"

if not defined tempo_bloqueio set "tempo_bloqueio=30"
set /a "tempo_bloqueio_segundos=tempo_bloqueio*60"

set "tentativas=0"
set "cancelar_senha="

:obter_senha
if defined cancelar_senha goto senha_cancelada

set /p "senha_inserida=Digite a senha para desbloquear ('cancelar' para cancelar): "

if "%senha_inserida%" equ "%senha_correta%" (
    echo Senha correta. O computador está desbloqueado.
    timeout /nobreak /t %tempo_bloqueio_segundos% >nul
) else (
    set /a "tentativas+=1"
    if %tentativas% lss 3 (
        echo Senha incorreta. Tente novamente.
        goto obter_senha
    ) else (
        echo Senha incorreta. Bloqueando o computador.
        rundll32.exe user32.dll, LockWorkStation
    )
)

rem Limpar o estado para a próxima execução
del /q "%APPDATA%\Tempo\CancelarSenha.txt"

exit /b

:senha_cancelada
echo A espera da senha foi cancelada.
rem Limpar o estado para a próxima execução
del /q "%APPDATA%\Tempo\CancelarSenha.txt"
exit /b
