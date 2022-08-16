#Sessão para configuração, documentação imports de arquivos e libraries
* Settings *
Documentation       Arquivo de Testes para Endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/login_keywords.robot
Resource            ../support/fixtures/dynamics.robot
Suite Setup         Criar Sessão

#Sessão para criação dos cenários de teste
* Test Cases *

#----------------------------------------------- GET ------------------------------------------------------------
Cenário 22: GET Todos os Produtos 200
    [tags]      GET_TODOS_PRODUTOS
    GET Endpoint /produtos
    Validar Status Code "200"
    Printar Conteudo da Response

Cenário 23: GET Buscar produto por Id 200
    [tags]      GET_PRODUTO_ID
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    GET Endpoint /produtos "Valido"
    Validar GET por Id
    Validar Status Code "200"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 24: GET Buscar Produto Id Incorreto 400
    [tags]      GET_PRODUTO_ID_INVALIDO
    Gerar Id Invalido
    GET Endpoint /produtos "Invalido"
    Validar Status Code "400"

#----------------------------------------------- POST ------------------------------------------------------------
Cenário 25: POST Criar Produto 201
    [tags]      POST_PRODUTO
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    Validar Ter Criado Produto
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 26: POST Criar Produto Nome Repetido 400
    [tags]      POST_PRODUTO_NOME_REPETIDO
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    Dados Dinamicos Produto Mesmo Nome
    POST Endpoint /produtos Invalido
    Validar Status Code "400"
    Validar Mensagem "Já existe produto com esse nome"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 27: POST Produto sem Preço 400
    [tags]      POST_PRODUTO_SEM_PRECO  
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_sem_preco"
    POST Endpoint /produtos Invalido
    Validar Status Code "400"
    Printar Conteudo da Response 
    DELETE Endpoint /usuarios 

Cenário 28: POST Produto sem Descrição 400
    [tags]      POST_PRODUTO_SEM_DESCRICAO 
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_sem_descricao"
    POST Endpoint /produtos Invalido
    Validar Status Code "400"
    Printar Conteudo da Response 
    DELETE Endpoint /usuarios 

Cenário 29: POST Produto sem Quantidade 400
    [tags]      POST_PRODUTO_SEM_QUANTIDADE  
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_sem_quantidade"
    POST Endpoint /produtos Invalido
    Validar Status Code "400"
    Printar Conteudo da Response 
    DELETE Endpoint /usuarios 

Cenário 30: POST Produto sem Nome 400
    [tags]      POST_PRODUTO_SEM_NOME  
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_sem_nome"
    POST Endpoint /produtos Invalido
    Validar Status Code "400"
    Printar Conteudo da Response 
    DELETE Endpoint /usuarios 

Cenário 31: POST Produto Preço Zero 400
    [tags]      POST_PRODUTO_PRECO_ZERO  
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_preco_zero"
    POST Endpoint /produtos Invalido
    Validar Status Code "400"
    Printar Conteudo da Response 
    DELETE Endpoint /usuarios 

Cenário 32: POST Produto Quantidade Zero 400
    [tags]      POST_PRODUTO_QUANTIDADE_ZERO  
    POST Endpoint /login e Armazenar Token
    Pegar Dados Produto Estatico "produto_quantidade_zero"
    POST Endpoint /produtos Invalido
    Printar Conteudo da Response 
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios 

Cenário 33: POST Criar Produto Token Expirado 401
    [tags]      POST_PRODUTO_TOKEN_EXPIRADO
    Pegar Dados Token Estatico "token_expirado"
    Dados Dinamicos Produto
    POST Endpoint /produtos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 34: POST Criar Produto Token Usuario Inexistente 401
    [tags]      POST_PRODUTO_TOKEN_USUARIO_INEXISTENTE
    Pegar Dados Token Estatico "token_usuario_inexistente"
    Dados Dinamicos Produto
    POST Endpoint /produtos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 35: POST Criar Produto Token Invalido 401
    [tags]      POST_PRODUTO_TOKEN_INVALIDO
    Pegar Dados Token Estatico "token_invalido"
    Dados Dinamicos Produto
    POST Endpoint /produtos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 36: POST Criar Produto Token Ausente 401
    [tags]      POST_PRODUTO_TOKEN_AUSENTE
    Pegar Dados Token Estatico "token_ausente"
    Dados Dinamicos Produto
    POST Endpoint /produtos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 37: POST Criar Produto Administrador False 403
    [tags]      POST_PRODUTO_ADM_FALSE
    Login Usuário Administrador False e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos Administrador False
    Validar Status Code "403"
    Validar Mensagem "Rota exclusiva para administradores"
    DELETE Endpoint /usuarios

#----------------------------------------------- PUT -------------------------------------------------------------

Cenário 38: PUT Editar Produto 200
    [tags]      PUT_PRODUTO
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    Pegar Dados Produto Estatico "produto_valido"
    PUT Endpoint /produtos
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"
    DELETE Endpoint /produtos    
    DELETE Endpoint /usuarios

Cenário 39: PUT Editar Novo Produto 201
    [tags]      PUT_NOVO_PRODUTO
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    Gerar Id Invalido
    PUT Endpoint /produtos Id Inexistente
    Validar Ter Criado Produto
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"    
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 40: PUT Editar Produto Mesmo Nome 400
    [tags]      PUT_PRODUTO_MESMO_NOME
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    Dados Dinamicos Produto Mesmo Nome
    Gerar Id Invalido
    PUT Endpoint /produtos Id Inexistente e Mesmo Nome
    Validar Status Code "400"
    Validar Mensagem "Já existe produto com esse nome"
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 41: PUT Editar Produto Token Expirado 401
    [tags]      PUT_PRODUTO_TOKEN_EXPIRADO
    Pegar Dados Token Estatico "token_expirado"
    Pegar Dados Produto Estatico "produto_valido"
    PUT Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 42: PUT Editar Produto Token Usuario Inexistente 401
    [tags]      PUT_PRODUTO_TOKEN_USUARIO_INEXISTENTE
    Pegar Dados Token Estatico "token_usuario_inexistente"
    Pegar Dados Produto Estatico "produto_valido"
    PUT Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 43: PUT Editar Produto Token Ausente 401
    [tags]      PUT_PRODUTO_TOKEN_AUSENTE
    Pegar Dados Token Estatico "token_ausente"
    Pegar Dados Produto Estatico "produto_valido"
    PUT Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 44: PUT Editar Produto Token Invalido 401
    [tags]      PUT_PRODUTO_TOKEN_USUARIO_INVALIDO
    Pegar Dados Token Estatico "token_invalido"
    Pegar Dados Produto Estatico "produto_valido"
    PUT Endpoint /produtos
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"

Cenário 45: PUT Editar Produto Administrador False 403
    [tags]      PUT_PRODUTO_ADM_FALSE
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    DELETE Endpoint /usuarios
    Login Usuário Administrador False e Armazenar Token
    PUT Endpoint /produtos Administrador False
    Validar Status Code "403"
    Validar Mensagem "Rota exclusiva para administradores"
    DELETE Endpoint /usuarios
    POST Endpoint /login e Armazenar Token
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

#----------------------------------------------- DELETE ------------------------------------------------------------

Cenário 46: DELETE Excluir Produto 200
    [tags]      DELETE_PRODUTO
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    DELETE Endpoint /produtos
    Validar Delete
    Validar Status Code "200"
    DELETE Endpoint /usuarios

Cenário 47: DELETE Excluir Produto Token Invalido 401
    [tags]      DELETE_PRODUTO_TOKEN_INVALIDO
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    Pegar Dados Token Estatico "token_invalido"
    DELETE Endpoint /produtos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /produtos    
    DELETE Endpoint /usuarios

Cenário 48: DELETE Excluir Produto Token Expirado 401
    [tags]      DELETE_PRODUTO_TOKEN_EXPIRADO
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    Pegar Dados Token Estatico "token_expirado"
    DELETE Endpoint /produtos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /produtos    
    DELETE Endpoint /usuarios

Cenário 49: DELETE Excluir Produto Token Ausente 401
    [tags]      DELETE_PRODUTO_TOKEN_AUSENTE
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    Pegar Dados Token Estatico "token_ausente"
    DELETE Endpoint /produtos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /produtos    
    DELETE Endpoint /usuarios

Cenário 50: DELETE Excluir Produto Token Usuario Inexistente 401
    [tags]      DELETE_PRODUTO_TOKEN_USUARIO_INEXISTENTE
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    Pegar Dados Token Estatico "token_usuario_inexistente"
    DELETE Endpoint /produtos Invalido
    Validar Status Code "401"
    Validar Mensagem "Token de acesso ausente, inválido, expirado ou usuário do token não existe mais"
    DELETE Endpoint /produtos    
    DELETE Endpoint /usuarios

Cenário 51: DELETE Excluir Produto Administrador False 403
    [tags]      DELETE_PRODUTO_ADM_FALSE
    POST Endpoint /login e Armazenar Token
    POST Endpoint /produtos
    DELETE Endpoint /usuarios
    Login Usuário Administrador False e Armazenar Token
    DELETE Endpoint /produtos Administrador False
    Validar Status Code "403"
    Validar Mensagem "Rota exclusiva para administradores"
    DELETE Endpoint /usuarios
    POST Endpoint /login e Armazenar Token
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios

Cenário 52: DELETE Excluir Produto em Carrinho 400
    [tags]      DELETE_PRODUTO_CARRINHO
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    DELETE Endpoint /produtos
    Validar Status Code "400"
    Validar Mensagem "Não é permitido excluir produto que faz parte de carrinho"
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios