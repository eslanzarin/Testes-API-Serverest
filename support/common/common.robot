* Settings *
Documentation           Keywords e variáveis para ações gerais
Library                 OperatingSystem

* Variables *


* Keywords *
Printar Status Code
    Log To Console      ${\n}STATUS CODE RECEBIDO: ${\n}${response.status_code}${\n}

Printar Conteudo da Response
    Log To Console      ${\n}CONTEÚDO DA RESPONSE: ${\n}${response.content}${\n}

Validar Status Code "${statuscode}"
    Should Be True      ${response.status_code} == ${statuscode}
    Printar Status Code

Validar Mensagem "${mensagem}"
    Log To Console      ${\n}CONTEÚDO DA RESPONSE: ${\n}${response.content}${\n}
    Should Contain      ${mensagem}         ${response.json()["message"]}
    Log To Console       MENSAGEM RECEBIDA: ${response.json()["message"]}. ${\n}${\n}MENSAGEM PREVISTA: ${mensagem}.

Validar GET por Id
    Should Not Be Empty     ${response.json()["_id"]}
    Printar Conteudo da Response

Validar Delete
    Should Be Equal     ${response.json()["message"]}           Registro excluído com sucesso
    Printar Conteudo da Response

Pegar Dados Token Estatico "${palavra}"     #ARGUMENTOS ACEITOS: "token_expirado", "token_usuario_inexistente", "token_ausente", "token_invalido"
    ${token_auth_invalido}             Pegar Dados Token Estatico        ${palavra}
    Set Global Variable       ${token_auth_invalido}