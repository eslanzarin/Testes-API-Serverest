#Sessão para configuração, documentação imports de arquivos e libraries
* Settings *
Documentation       Arquivo de Testes para Endpoint /login
Resource            ../keywords/login_keywords.robot
Resource            ../keywords/usuarios_keywords.robot
Suite Setup         Criar Sessão
Suite Teardown      DELETE Endpoint /usuarios

#Sessão para criação dos cenários de teste
* Test Cases *
#----------------------------------------------- POST ------------------------------------------------------------
Cenário 1: POST Efetuar Login Usuario Valido 200
    [tags]      POST_LOGIN
    POST Endpoint /login e Armazenar Token
    Validar Status Code "200"
    Validar Mensagem "Login realizado com sucesso"
    DELETE Endpoint /usuarios

Cenário 2: POST Efetuar Login Senha Incorreta 400
    [tags]      LOGIN_SENHA_INCORRETA
    POST Endpoint /login Senha Invalida
    Validar Mensagem "Email e/ou senha inválidos"
    Printar Status Code

Cenário 3: POST Efetuar Login Usuario Inexistente 400
    [tags]      LOGIN_USUARIO_INEXISTENTE
    Pegar Dados Login Estatico "user_inexistente"
    POST Endpoint /login Usuario Estatico
    Validar Mensagem "Email e/ou senha inválidos"
    Printar Status Code

Cenário 4: POST Efetuar Login Email em Branco 400
    [tags]      LOGIN_SEM_EMAIL
    Pegar Dados Login Estatico "user_sem_email"
    POST Endpoint /login Usuario Estatico
    Validar Status Code "400"
    Printar Conteudo da Response

Cenário 5: POST Efetuar Login Senha em Branco 400
    [tags]      LOGIN_SEM_SENHA
    Pegar Dados Login Estatico "user_sem_senha"
    POST Endpoint /login Usuario Estatico
    Validar Status Code "400"
    Printar Conteudo da Response