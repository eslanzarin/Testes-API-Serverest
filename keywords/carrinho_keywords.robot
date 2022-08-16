* Settings *
Documentation           Keywords e variáveis para ações no endpoint carrinho
Resource                ../support/base.robot

* Variables *

* Keywords *
GET Endpoint /carrinhos
    ${response}             GET On Session          serverest       /carrinhos
    Set Global Variable     ${response}

GET Endpoint /carrinhos Id "${tipo}"
    IF      "${tipo}" == "Valido"
        ${response}             GET On Session          serverest       /carrinhos/${id_carrinho}
        Set Global Variable     ${response}
        Validar GET por Id
    ELSE IF     "${tipo}" == "Invalido"
        ${response}             GET On Session          serverest       /carrinhos/${invalid_id}      expected_status=Anything
        Set Global Variable     ${response}
        Validar Mensagem "Carrinho não encontrado"
    END

Gerar Carrinho Valido
    ${produtos}     Convert String to JSON      [{"idProduto": "id", "quantidade": 3}]
    ${produtos}     Update Value to JSON        ${produtos}         $..idProduto        ${id_produto}
    &{payload}      Create Dictionary           produtos=${produtos}
    Set Global Variable     &{payload}

POST Endpoint /carrinhos
    Gerar Carrinho Valido
    &{header}           Create Dictionary       Authorization=${token_auth}
    ${response}         POST On Session         serverest      /carrinhos        json=&{payload}      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}
    IF      ${response.status_code} == ${201}
        ${id_carrinho}      Set Variable            ${response.json()["_id"]}
        Set Global Variable     ${id_carrinho}
    END

POST Endpoint /carrinhos Invalido
    &{header}           Create Dictionary       Authorization=${token_auth_invalido}
    ${response}         POST On Session         serverest      /carrinhos        json=&{payload}      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/concluir-compra Invalido
    &{header}               Create Dictionary       Authorization=${token_auth_invalido}
    ${response}             DELETE On Session          serverest       /carrinhos/concluir-compra      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra Invalido
    &{header}               Create Dictionary       Authorization=${token_auth_invalido} 
    ${response}             DELETE On Session          serverest       /carrinhos/cancelar-compra      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/concluir-compra
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             DELETE On Session          serverest       /carrinhos/concluir-compra      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}

DELETE Endpoint /carrinhos/cancelar-compra
    &{header}               Create Dictionary       Authorization=${token_auth} 
    ${response}             DELETE On Session          serverest       /carrinhos/cancelar-compra      headers=&{header}         expected_status=Anything
    Set Global Variable     ${response}

