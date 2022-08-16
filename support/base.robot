#Sessão para configuração, documentação imports de arquivos e libraries
* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Library             RPA.JSON
Library             ../library_teste.py
Resource            ./common/common.robot
Resource            ./fixtures/dynamics.robot
Resource            ./variables/serverest_variables.robot
Resource            ../keywords/login_keywords.robot
Resource            ../keywords/usuarios_keywords.robot
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/carrinho_keywords.robot

#Sessão para keywords Personalizadas
* Keywords *
Criar Sessão
    Create Session          serverest       ${BASE_URI}