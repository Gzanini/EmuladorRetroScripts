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

rem Adicione todos os arquivos modificados e excluídos ao índice
git add --all

rem Faça um commit com uma mensagem
git commit -m "Atualizações automáticas"

rem Envie as alterações para o repositório remoto usando a branch fornecida pelo usuário
git push origin %branch%

echo Alterações enviadas para o Git com sucesso.