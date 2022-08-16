* Settings *
Documentation           Keywords e variáveis para ações no endpoint login
Resource                ../support/base.robot

* Variables *

* Keywords *
Pegar Dados Login Estatico "${palavra}"     #ARGUMENTOS ACEITOS: "user_inexistente", "user_sem_email", "user_sem_senha"
    ${payload}             Pegar Dados Login Estatico        ${palavra}
    Set Global Variable    ${payload}

POST Endpoint /login e Armazenar Token
    Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios e Armazenar Id
    &{payload}              Create Dictionary              email=${email}           password=teste
    ${response}             POST On Session         serverest      /login       data=&{payload}       expected_status=Anything
    ${token_auth}           Set Variable                        ${response.json()["authorization"]}
    Set Global Variable     ${token_auth}
    Set Global Variable     ${response}
    Validar Ter Logado

POST Endpoint /login Senha Invalida
    Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios e Armazenar Id
    &{payload}              Create Dictionary              email=${email}           password=senhasenha
    ${response}             POST On Session         serverest      /login       data=&{payload}       expected_status=Anything
    Set Global Variable     ${response}

Validar Ter Logado
    Should be Equal         ${response.json()["message"]}       Login realizado com sucesso
    Should Not Be Empty     ${response.json()["authorization"]}

POST Endpoint /login Usuario Estatico
    ${response}             POST On Session         serverest      /login       json=&{payload}       expected_status=Anything
    Set Global Variable     ${response}
    Log To Console          ${response.content}

Login Usuário Administrador False e Armazenar Token
    Pegar Dados Usuario Estatico "user_adm_false"
    POST Endpoint /usuarios e Armazenar Id
    &{payload}              Create Dictionary       email=${email}  password=teste
    ${response}             POST On Session         serverest       /login       json=&{payload}       expected_status=Anything
    ${not_adm_token_auth}   Set Variable            ${response.json()["authorization"]}
    Set Global Variable     ${not_adm_token_auth}
    Set Global Variable     ${response}