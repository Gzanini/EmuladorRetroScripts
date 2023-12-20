@echo off

rem Defina o caminho da raiz do OneDrive
set "onedrive_raiz=C:\Caminho\Para\Seu\OneDrive"

rem Certifique-se de que o diretório do OneDrive existe
if not exist "%onedrive_raiz%" (
    echo Diretório do OneDrive não encontrado.
    exit /b
)

rem Obtenha a lista de raízes no OneDrive
for /d %%I in ("%onedrive_raiz%\*") do (
    set "raiz_atual_onedrive=%%~dpI"

    rem Defina o caminho da raiz do emulador
    set "emulador_raiz=D:\Caminho\Para\Sua\Raiz\De\Emulador"

    rem Crie o caminho espelhado na raiz do emulador
    set "caminho_espelhado=%emulador_raiz%\%%~nxI"

    rem Crie o caminho espelhado se não existir
    if not exist "%caminho_espelhado%" (
        mkdir "%caminho_espelhado%"
    )

    rem Mova apenas os arquivos que não existem no diretório de destino
    for %%F in ("%raiz_atual_onedrive%\*") do (
        set "destino=%caminho_espelhado%\%%~nxF"
        if not exist "!destino!" (
            copy /y "%%F" "!destino!"
            echo Arquivo copiado de "%%F" para "!destino!" com sucesso.
        ) else (
            echo Arquivo "!destino!" já existe. Pulando a cópia.
        )
    )
)

echo Todos os arquivos foram movidos com sucesso.