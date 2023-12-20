@echo off

rem Certifique-se de que você está no diretório do seu repositório Git
cd /d C:\Caminho\Para\Seu\Repositorio\Git

rem Pergunta ao usuário qual branch deve ser usada
set /p branch="Digite o nome da branch (por exemplo, 'main'): "

rem Verifica se o input está vazio
if "%branch%"=="" (
    echo Nome da branch não fornecido. Saindo.
    exit /b
)

rem Descarte alterações locais para evitar conflitos (pode ser perigoso em algumas situações)
git reset --hard HEAD

rem Limpe o diretório para garantir que não haja conflitos
git clean -fdx

rem Puxa as alterações da branch remota especificada
git pull origin %branch%

echo Alterações puxadas do Git com sucesso.
