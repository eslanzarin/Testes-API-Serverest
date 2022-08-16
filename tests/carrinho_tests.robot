#Sessão para configuração, documentação imports de arquivos e libraries
* Settings *
Documentation       Arquivo de Testes para Endpoint /carrinhos
Resource            ../keywords/carrinho_keywords.robot
Suite Setup         Criar Sessão

#Sessão para criação dos cenários de teste
* Test Cases *
#----------------------------------------------- GET ------------------------------------------------------------
Cenário 53: GET Listar Carrinhos 200
    [tags]      GET_CARRINHOS
    GET Endpoint /carrinhos
    Printar Conteudo da Response
    Validar Status Code "200"

Cenário 54: GET Buscar Carrinho por Id 200
    [tags]      GET_CARRINHOS_ID
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    GET Endpoint /carrinhos Id "Valido"
    DELETE Endpoint /carrinhos/concluir-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 55: GET Buscar carrinho por ID inválido 400
    [Tags]      GET_CARRINHOS_ID_INVALIDO
    Gerar Id Invalido
    GET Endpoint /carrinhos Id "Invalido"
    Validar Status Code "400"

#----------------------------------------------- POST ------------------------------------------------------------
Cenário 56: POST Criar Carrinho 201
    [tags]      POST_CARRINHOS
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 57: POST Cadastrar Novo Carrinho Usuario Já com Carrinho 400
    [tags]      POST_CARRINHO_DUPLICADO
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Mensagem "Não é permitido possuir produto duplicado | Não é permitido ter mais de 1 carrinho | Produto não encontrado | Produto não possui quantidade suficiente"
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 58: POST Cadastrar Produto em Quantidade Insuficiente em Carrinho 400
    [tags]      POST_CARRINHO_PRODUTO_INSUFICIENTE
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos Insuficiente
    POST Endpoint /carrinhos
    Validar Status Code "400"
    Validar Mensagem "Não é permitido possuir produto duplicado | Não é permitido ter mais de 1 carrinho | Produto não encontrado | Produto não possui quantidade suficiente"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

#Cenário: POST Cadastrar Novo Carrinho com Produto Duplicado 400
    #[tags]      POST_CARRINHO_PRODUTO_DUPLICADO

Cenário 59: POST Cadastrar Novo Carrinho com Token Expirado 401
    [tags]      POST_CARRINHO_TOKEN_EXPIRADO
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_valido"
    POST Endpoint /produtos
    Pegar Dados Token Estatico "token_expirado"
    POST Endpoint /carrinhos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 60: POST Cadastrar Novo Carrinho com Token Ausente 401
    [tags]     POST_CARRINHO_TOKEN_EXPIRADO
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_valido"
    POST Endpoint /produtos
    Pegar Dados Token Estatico "token_ausente"
    POST Endpoint /carrinhos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 61: POST Cadastrar Novo Carrinho com Usuario Inexistente 401
    [tags]      POST_CARRINHO_TOKEN_EXPIRADO
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_valido"
    POST Endpoint /produtos
    Pegar Dados Token Estatico "token_usuario_inexistente"
    POST Endpoint /carrinhos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 62: POST Cadastrar Novo Carrinho com Token Invalido 401
    [tags]      POST_CARRINHO_TOKEN_INVALIDO
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_valido"
    POST Endpoint /produtos
    Pegar Dados Token Estatico "token_invalido"
    POST Endpoint /carrinhos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

#----------------------------------------------- DELETE ------------------------------------------------------------
Cenário 63: DELETE Concluir Compra 200
    [tags]      DELETE_CARRINHO_CONCLUIR_COMPRA
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos/concluir-compra
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 64: DELETE /concluir-compra Concluir Carrinho com Token Expirado 401
    [tags]      DELETE_CONCLUIR_TOKEN_EXPIRADO
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    Pegar Dados Token Estatico "token_expirado"
    DELETE Endpoint /carrinhos/concluir-compra Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /carrinhos/concluir-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 65: DELETE /concluir-compra Concluir Carrinho com Token Usuario Inexistente 401
    [tags]      DELETE_CONCLUIR_TOKEN_USUARIO_INEXISTENTE
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos Invalido
    Pegar Dados Token Estatico "token_usuario_inexistente"
    DELETE Endpoint /carrinhos/concluir-compra Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /carrinhos/concluir-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 66: DELETE /concluir-compra Concluir Carrinho com Token Ausente 401
    [tags]      DELETE_CONCLUIR_TOKEN_AUSENTE
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos Invalido
    Pegar Dados Token Estatico "token_ausente"
    DELETE Endpoint /carrinhos/concluir-compra Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /carrinhos/concluir-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 67: DELETE /concluir-compra Concluir Carrinho com Token Invalido 401
    [tags]      DELETE_CONCLUIR_TOKEN_INVALIDO
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos Invalido
    Pegar Dados Token Estatico "token_invalido"
    DELETE Endpoint /carrinhos/concluir-compra Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /carrinhos/concluir-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 68: DELETE Cancelar Compra com Sucesso 200
    [tags]      DELETE_CARRINHO_CANCELAR_COMPRA
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    DELETE Endpoint /carrinhos/cancelar-compra
    Validar Status Code "200"
    Printar Conteudo da Response
    Log To Console       ${\n}${\n}MENSAGEM PREVISTA: Registro excluído com sucesso.
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 69: DELETE /cancelar-compra Cancelar Carrinho com Token Expirado 401
    [tags]      DELETE_CANCELAR_TOKEN_EXPIRADO
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos Invalido
    Pegar Dados Token Estatico "token_expirado"
    DELETE Endpoint /carrinhos/cancelar-compra Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 70: DELETE /cancelar-compra Cancelar Carrinho com Token Usuario Inexistente 401
    [tags]      DELETE_CANCELAR_TOKEN_USUARIO_INEXISTENTE
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos Invalido
    Pegar Dados Token Estatico "token_usuario_inexistente"
    DELETE Endpoint /carrinhos/cancelar-compra Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 71: DELETE /cancelar-compra Cancelar Carrinho com Token Ausente 401
    [tags]      DELETE_CANCELAR_TOKEN_AUSENTE
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    DELETE Endpoint /usuarios
    Pegar Dados Token Estatico "token_ausente"
    DELETE Endpoint /carrinhos/cancelar-compra Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 72: DELETE /cancelar-compra Cancelar Carrinho com Token Invalido 401
    [tags]      DELETE_CANCELAR_TOKEN_EXPIRADO
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    DELETE Endpoint /usuarios
    Pegar Dados Token Estatico "token_invalido"
    DELETE Endpoint /carrinhos/cancelar-compra Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios
