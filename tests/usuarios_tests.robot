#Sessão para configuração, documentação imports de arquivos e libraries
* Settings *
Documentation       Arquivo de Testes para Endpoint /usuarios
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessão

#Sessão para criação dos cenários de teste
* Test Cases *

#----------------------------------------------- GET ------------------------------------------------------------
Cenário 6: GET Todos os Usuários 200
    [tags]      GET_TODOS_USUARIOS
    GET Endpoint /usuarios
    Validar Status Code "200"
    Printar Conteudo da Response

Cenário 7: GET Buscar usuário por Id 200
    [tags]      GET_USUARIO_ID
    Pegar Dados Usuario Estatico "user_valido"
    POST Endpoint /usuarios e Armazenar Id
    GET Endpoint /usuarios por Id
    Validar Status Code "200"
    DELETE Endpoint /usuarios

Cenário 8: GET Buscar Usuário Id Incorreto 400
    [tags]      GET_USUARIO_ID_INVALIDO
    Gerar Id Invalido
    GET Endpoint /usuarios Id Inexistente
    Validar Status Code "400"

#----------------------------------------------- POST ------------------------------------------------------------
Cenário 9: POST Cadastrar Usuário 201
    [tags]      POST_USUARIO
    Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios e Armazenar Id
    Validar Status Code "201"
    Validar Mensagem "Cadastro realizado com sucesso"
    Validar Ter Criado Usuario
    DELETE Endpoint /usuarios

Cenário 10: POST Cadastrar Usuário Email Já Utilizado 400
    [tags]      USUARIO_EMAIL_UTILIZADO
    Pegar Dados Usuario Estatico "user_valido"
    POST Endpoint /usuarios e Armazenar Id
    Pegar Dados Usuario Estatico "user_invalido"
    POST Endpoint /usuarios Invalido
    Validar Mensagem "Este email já está sendo usado"
    Validar Status Code "400"
    DELETE Endpoint /usuarios

Cenário 11: POST Cadastrar Usuario sem Email 400
    [tags]      USUARIO_SEM_EMAIL
    Pegar Dados Usuario Estatico "user_sem_email"
    POST Endpoint /usuarios Invalido
    Validar Status Code "400"
    Printar Conteudo da Response

Cenário 12: POST Cadastrar Usuário sem Senha 400
    [tags]      USUARIO_SEM_PASSWORD
    Pegar Dados Usuario Estatico "user_sem_senha"
    POST Endpoint /usuarios Invalido
    Validar Status Code "400"
    Printar Conteudo da Response

Cenário 13: POST Cadastrar Usuário sem Nome 400
    [tags]      USUARIO_SEM_NOME
    Pegar Dados Usuario Estatico "user_sem_nome"
    POST Endpoint /usuarios Invalido
    Validar Status Code "400"
    Printar Conteudo da Response

Cenário 14: POST Cadastrar Usuário sem Administrador 400
    [tags]      USUARIO_SEM_ADM
    Pegar Dados Usuario Estatico "user_sem_adm"
    POST Endpoint /usuarios Invalido
    Validar Status Code "400" 
    Printar Conteudo da Response  

Cenário 15: POST Cadastrar Usuário Administrador False 200
    [tags]      USUARIO_ADM_FALSE
    Pegar Dados Usuario Estatico "user_adm_false"
    POST Endpoint /usuarios e Armazenar Id
    Validar Status Code "201"
    Validar Ter Criado Usuario
    Validar Mensagem "Cadastro realizado com sucesso"
    DELETE Endpoint /usuarios

#----------------------------------------------- PUT ------------------------------------------------------------
Cenário 16: PUT Editar Usuário 200
    [tags]      PUT_USUARIO
    Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios e Armazenar Id
    Pegar Dados Usuario Estatico "user_invalido"
    PUT Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem "Registro alterado com sucesso"
    DELETE Endpoint /usuarios
    
Cenário 17: PUT Editar Novo Usuário 201
    [tags]      PUT_USUARIO_NOVO
    Pegar Dados Usuario Estatico "user_valido"
    Gerar Id Invalido
    PUT Endpoint /usuarios Id Inexistente
    Validar Status Code "201"
    Validar Ter Criado Usuario
    DELETE Endpoint /usuarios

Cenário 18: PUT Editar Usuário Email Repetido 400
    [tags]      PUT_USUARIO_EMAIL_REPETIDO
    Pegar Dados Usuario Estatico "user_valido"
    POST Endpoint /usuarios e Armazenar Id
    Pegar Dados Usuario Estatico "user_invalido" 
    Gerar Id Invalido
    PUT Endpoint /usuarios Id Inexistente e Mesmo Email
    Validar Status Code "400"
    Validar Mensagem "Este email já está sendo usado"
    DELETE Endpoint /usuarios

#----------------------------------------------- DELETE ------------------------------------------------------------
Cenário 19: DELETE Deletar Usuário 200
    [tags]      DELETE_USUARIO
    Dados Dinamicos Usuario Valido
    POST Endpoint /usuarios e Armazenar Id
    DELETE Endpoint /usuarios
    Validar Status Code "200"
    Validar Mensagem "Registro excluído com sucesso"

Cenário 20: DELETE Deletar Usuário com Id Inexistente 200
    [tags]      DELETE_USUARIO_ID_INEXISTENTE
    Gerar Id Invalido
    DELETE Endpoint /usuarios Id Inexistente
    Validar Status Code "200"
    Validar Mensagem "Nenhum registro excluído"

Cenário 21: DELETE Deletar Usuário com Carrinho 400
    [tags]      DELETE_USUARIO_CARRINHO
    POST Endpoint /login e Armazenar Token
    Dados Dinamicos Produto
    POST Endpoint /produtos
    POST Endpoint /carrinhos
    DELETE Endpoint /usuarios
    Validar Status Code "400"
    Validar Mensagem "Não é permitido excluir usuário com carrinho cadastrado"
    DELETE Endpoint /carrinhos/cancelar-compra
    DELETE Endpoint /produtos
    DELETE Endpoint /usuarios
