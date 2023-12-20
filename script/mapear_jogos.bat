@echo off

rem Defina o caminho da raiz do emulador
set "emulador_raiz=D:\Caminho\Para\Sua\Raiz\De\Emulador"

rem Certifique-se de que o diretório do emulador existe
if not exist "%emulador_raiz%" (
    echo Diretório do emulador não encontrado.
    exit /b
)

rem Defina o caminho do arquivo de mapa
set "arquivo_mapa=%emulador_raiz%\mapa_arquivos.txt"

rem Crie o arquivo de mapa (ou sobrescreva se já existir)
(
    echo. :: Mapa de arquivos do emulador
) > "%arquivo_mapa%"

rem Preencha o arquivo de mapa com os caminhos dos arquivos
for /r "%emulador_raiz%" %%I in (*) do (
    echo %%~dpnI\%%~nxI >> "%arquivo_mapa%"
)

echo Mapa de arquivos criado com sucesso em %arquivo_mapa%.