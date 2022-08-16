* Settings *
Documentation       Arquivo de Testes para Library Python
Library             library_teste.py


* Test Cases *
Library Criar e Deletar Usuarios
    [tags]      CRIAR_DELETAR
    ${json}             Criar e Deletar Usuario      ${30}
    Log To Console      ${json}

Library Criar Logar e Deletar Usuarios
    [tags]      CRIAR_LOGAR
    ${qntd}         Criar Info          ${30}
    ${lista_users}  Criar Usuarios      ${qntd}
    Log To Console          ${lista_users}
    Info Logar Usuarios     ${lista_users}
    Logar Usuarios          ${qntd}
    Deletar Usuarios        ${lista_users}