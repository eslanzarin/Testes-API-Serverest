* Settings *
Documentation           Keywords e variáveis para ações no endpoint usuários
Resource                ../support/base.robot

* Variables *

* Keywords *
Pegar Dados Usuario Estatico "${palavra}"       #ARGUMENTOS ACEITOS: "user_valido", "user_invalido", "user_sem_senha", "user_sem_email", "user_sem_adm", "user_sem_nome", "user_adm_false"
    ${payload}             Pegar Dados Usuario Estatico        ${palavra}
    Set Global Variable    ${payload}
    IF     "${palavra}" == "user_adm_false"
        ${email}                Set Variable                    ${payload["email"]}
        Set Global Variable     ${email}
    END

GET Endpoint /usuarios
    ${response}             GET On Session          serverest       /usuarios
    Set Global Variable     ${response}

GET Endpoint /usuarios por Id
    ${response}             GET On Session          serverest       /usuarios/${id_usuario}
    Set Global Variable     ${response}
    Validar GET por Id

GET Endpoint /usuarios Id Inexistente
    ${response}             GET On Session          serverest       /usuarios/${invalid_id}      expected_status=Anything
    Set Global Variable     ${response}
    Validar Mensagem "Usuário não encontrado"

POST Endpoint /usuarios e Armazenar Id
    ${response}             POST On Session         serverest           /usuarios       json=&{payload}
    ${id_usuario}           Set Variable                      ${response.json()["_id"]}
    Set Global Variable     ${response}
    Set Global Variable     ${id_usuario}

POST Endpoint /usuarios Invalido
    ${response}             POST On Session         serverest           /usuarios       json=&{payload}     expected_status=Anything
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${response}             PUT On Session          serverest           /usuarios/${id_usuario}               json=&{payload}
    #Log to Console          PUT Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios Id Inexistente
    ${response}             PUT On Session          serverest           /usuarios/${invalid_id}               json=&{payload}
    ${id_usuario}           Set Variable                      ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}
    Set Global Variable     ${response}

PUT Endpoint /usuarios Id Inexistente e Mesmo Email
    ${response}             PUT On Session          serverest           /usuarios/${invalid_id}               json=&{payload}     expected_status=Anything
    Log to Console          PUT Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session          serverest        /usuarios/${id_usuario}         expected_status=Anything
    Set Global Variable     ${response}

DELETE Endpoint /usuarios Id Inexistente
    ${response}             DELETE On Session          serverest   /usuarios/${invalid_id}
    Set Global Variable     ${response}
    Validar Mensagem "Nenhum registro excluído"

Validar Ter Criado Usuario
    Should be Equal         ${response.json()["message"]}       Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}
    #Log To Console          Response: ${response.content}

