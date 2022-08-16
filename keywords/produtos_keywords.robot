* Settings *
Documentation           Keywords e variáveis para ações no endpoint produtos
Resource                ../support/base.robot

* Keywords *
Pegar Dados Produto Estatico "${palavra}"       #ARGUMENTOS ACEITOS: "produto_valido", "produto_sem_nome", "produto_sem_preco", "produto_sem_descricao", "produto_sem_quantidade", "produto_quantidade_insuficiente", "produto_preco_zero", "produto_quantidade_zero"
    ${payload}             Pegar Dados Produto Estatico        ${palavra}
    Set Global Variable    ${payload}

GET Endpoint /produtos
    ${response}             GET On Session          serverest       /produtos
    Set Global Variable     ${response}

GET Endpoint /produtos "${tipo}"
    IF  "${tipo}" == "Valido"
        ${response}             GET On Session          serverest       /produtos/${id_produto}
        Set Global Variable     ${response}
    ELSE IF     "${tipo}" == "Invalido"
        ${response}             GET On Session          serverest       /produtos/${invalid_id}      expected_status=Anything
        Set Global Variable     ${response}
        Validar Mensagem "Produto não encontrado"
    END

POST Endpoint /produtos
    Dados Dinamicos Produto
    &{header}                 Create Dictionary       Authorization=${token_auth}
    ${response}               POST On Session         serverest      /produtos        json=&{payload}      headers=&{header}
    ${id_produto}             Set Variable            ${response.json()["_id"]}
    Set Global Variable       ${id_produto}
    Set Global Variable       ${response}

POST Endpoint /produtos Invalido
    &{header}                 Create Dictionary       Authorization=${token_auth}
    ${response}               POST On Session         serverest      /produtos        json=&{payload}      headers=&{header}        expected_status=Anything
    Set Global Variable       ${response}
    IF      ${response.status_code} == ${201}
        ${id_produto}      Set Variable            ${response.json()["_id"]}
        Set Global Variable     ${id_produto}
    END

POST Endpoint /produtos Insuficiente
    Pegar Dados Produto Estatico "produto_quantidade_insuficiente"
    &{header}                 Create Dictionary       Authorization=${token_auth}
    ${response}               POST On Session         serverest      /produtos        json=&{payload}      headers=&{header}        expected_status=Anything
    ${id_produto}             Set Variable                      ${response.json()["_id"]}
    Set Global Variable       ${id_produto}
    Set Global Variable       ${response}

POST Endpoint /produtos Administrador False
    &{header}                 Create Dictionary       Authorization=${not_adm_token_auth}
    ${response}               POST On Session         serverest      /produtos        json=&{payload}      headers=&{header}        expected_status=Anything
    Set Global Variable       ${response}
    Log To Console            Response: ${response.json()["message"]}

PUT Endpoint /produtos
    &{header}                 Create Dictionary       Authorization=${token_auth}
    ${response}               PUT On Session         serverest      /produtos/${id_produto}        json=&{payload}      headers=&{header}         expected_status=Anything
    Set Global Variable       ${response}
    Log To Console            Response: ${response.json()["message"]}

PUT Endpoint /produtos Id Inexistente
    &{header}                 Create Dictionary       Authorization=${token_auth}
    ${response}               PUT On Session         serverest      /produtos/${invalid_id}        json=&{payload}      headers=&{header}
    ${id_produto}             Set Variable          ${response.json()["_id"]}
    Set Global Variable       ${response}
    Set Global Variable       ${id_produto}
    Printar Conteudo da Response

PUT Endpoint /produtos Id Inexistente e Mesmo Nome
    &{header}                 Create Dictionary       Authorization=${token_auth}
    ${response}               PUT On Session         serverest      /produtos/${invalid_id}        json=&{payload}      headers=&{header}        expected_status=Anything
    Set Global Variable       ${response}
    Printar Conteudo da Response
    
PUT Endpoint /produtos Administrador False
    &{header}                 Create Dictionary       Authorization=${not_adm_token_auth}
    ${response}               PUT On Session         serverest      /produtos/${id_produto}        json=&{payload}      headers=&{header}         expected_status=Anything
    Set Global Variable       ${response}
    Printar Conteudo da Response

DELETE Endpoint /produtos Invalido
    &{header}               Create Dictionary       Authorization=${token_auth_invalido}
    ${response}             DELETE On Session       serverest      /produtos/${id_produto}      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}

DELETE Endpoint /produtos
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             DELETE On Session       serverest      /produtos/${id_produto}      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}

DELETE Endpoint /produtos Administrador False
    &{header}               Create Dictionary           Authorization=${not_adm_token_auth}
    ${response}             DELETE On Session       serverest      /produtos/${id_produto}      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}

Validar Ter Criado Produto
    Should be Equal         ${response.json()["message"]}       Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}
    Log to Console          Response: ${response.json()["message"]}
