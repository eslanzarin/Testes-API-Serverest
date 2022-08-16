# Testes API Serverest
[![Badge ServeRest](https://img.shields.io/badge/API-ServeRest-green)](https://github.com/ServeRest/ServeRest/)

Repositório criado para armazenar os códigos com objetivo de automatizar os testes para a API Serverest, que simula uma loja virtual. Os testes permeiam todos os endpoints da API, sendo eles: login, usuarios, produtos e carrinho. 

<br>

### <b> Relatórios de Testes da API: </b> 

<br>

ENDPOINT /LOGIN


| CASO DE TESTE  | NOME DO TESTE | TAG | RESPOSTA RECEBIDA | RESPOSTA PREVISTA |
|---|---|---|---|---|
| <b>CT02</b>  | POST Login Com Senha Incorreta  | LOGIN_SENHA_INCORRETA  | Status Code: 401 Conteúdo: "Email e/ou senha inválidos" | Status Code: 400 Conteúdo: "Email e/ou senha inválidos"  |
| <b>CT03</b>  | POST Login Com Usuario Inexistente  | LOGIN_USUARIO_INEXISTENTE  | Status Code: 401 Conteúdo: "Email e/ou senha inválidos"  | Status Code: 400 Conteúdo: "Email e/ou senha inválidos"  |
|<b>CT04</b>|POST Efetuar Login Email em Branco|LOGIN_SEM_EMAIL|Status Code: 400 Conteúdo: "email não pode ficar em branco"|Sem mensagem prevista em documentação|
|<b>CT05</b>|POST Efetuar Login Senha em Branco|LOGIN_SEM_SENHA|Status Code: 400 Conteúdo: "password não pode ficar em branco"|Sem mensagem prevista em documentação|

ENDPOINT /USUARIOS

| CASO DE TESTE  | NOME DO TESTE | TAG | RESPOSTA RECEBIDA | RESPOSTA PREVISTA |
|---|---|---|---|---|
| <b>CT11</b>  |POST Cadastrar usuário com campo "e-mail" em branco|USUARIO_SEM_EMAIL|Status Code: 400 Conteúdo: "email não pode ficar em branco"|Sem mensagem prevista em documentação|
| <b>CT12</b>  |POST Cadastrar Usuário sem Senha |USUARIO_SEM_PASSWORD|Status Code: 400 Conteúdo: "password não pode ficar em branco" |Sem mensagem prevista em documentação|
| <b>CT13</b>  |POST Cadastrar Usuário sem Nome 400|USUARIO_SEM_NOME|Status Code: 400 Conteúdo: "nome não pode ficar em branco"|Sem mensagem prevista em documentação |
| <b>CT14</b>  | POST Cadastrar Usuário sem Administrador|USUARIO_SEM_ADM|Status Code: 400 Conteúdo: "administrador não pode ficar em branco"|Sem mensagem prevista em documentação  |
| <b>CT20</b>  |DELETE Deletar Usuário com Id Inexistente|DELETE_USUARIO_ID_INEXISTENTE|Status Code: 200 Conteúdo: "Nenhum registro excluído"|Status Code: 200 Conteúdo: "Registro excluído com sucesso / Nenhum registro excluído"|

ENDPOINT /PRODUTOS
| CASO DE TESTE  | NOME DO TESTE | TAG | RESPOSTA RECEBIDA | RESPOSTA PREVISTA |
|---|---|---|---|---|
| <b>CT27</b>  |POST Produto sem Preço|POST_PRODUTO_SEM_PRECO| Status Code: 400 Conteúdo: "preco deve ser um número"|Sem retorno previsto em documentação|
| <b>CT28</b>  |POST Produto sem Descrição|POST_PRODUTO_SEM_DESCRICAO| Status Code: 400 Conteúdo: "descricao não pode ficar em branco|Sem retorno previsto em documentação|
| <b>CT29</b>  |POST Produto sem Quantidade|POST_PRODUTO_SEM_QUANTIDADE| Status Code: 400 Conteúdo: "quantidade deve ser um número"|Sem retorno previsto em documentação|
| <b>CT30</b>  | POST Produto sem Nome|POST_PRODUTO_SEM_NOME| Status Code: 400 Conteúdo: "nome não pode ficar em branco"|Sem retorno previsto em documentação|
| <b>CT31</b>  | POST Produto Preço Zero|POST_PRODUTO_PRECO_ZERO | Status Code: 400 Conteúdo: "preco deve ser um número positivo|Sem retorno previsto em documentação|
| <b>CT32</b>  | POST Produto Quantidade Zero|POST_PRODUTO_QUANTIDADE_ZERO | Status Code: 201 Conteúdo: {"message": "Cadastro realizado com sucesso", "_id": "kkpNayiWjDlWDbLs"}|Sem retorno previsto em documentação|


ENDPOINT /CARRINHOS

| CASO DE TESTE  | NOME DO TESTE | TAG | RESPOSTA RECEBIDA | RESPOSTA PREVISTA |
|---|---|---|---|---|
| <b>CT57</b> |POST Cadastrar Novo Carrinho Usuario Já com Carrinho|POST_CARRINHO_DUPLICADO|Status Code: 400 Conteúdo: "Não é permitido ter mais de 1 carrinho" |Status Code: 400 Conteúdo: "Não é permitido possuir produto duplicado / Não é permitido ter mais de 1 carrinho / Produto não encontrado / Produto não possui quantidade suficiente"  |
| <b>CT58</b>|POST Cadastrar Produto em Quantidade Insuficiente em Carrinho |POST_CARRINHO_PRODUTO_INSUFICIENTE|Status Code: 400 Conteúdo: "Produto não possui quantidade suficiente" e informações sobre o item em específico |Status Code: 400 Conteúdo: "Não é permitido possuir produto duplicado / Não é permitido ter mais de 1 carrinho / Produto não encontrado / Produto não possui quantidade suficiente" |
| <b>CT68</b> |DELETE Cancelar Compra|DELETE_CARRINHO_CANCELAR_COMPRA|Status Code: 200 Conteúdo: "Registro excluÍdo com sucesso. Estoque dos produtos reabastecido" |Status Code: 200 Conteúdo: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário" |

----

### <b>Requirements</b>
- Python versão 3.10.5 ou anteriores

- Pip 22.1.2

- NodeJS 1.65.2

- Visual Studio Code ou IDE de preferência para visualização dos arquivos

- Robot Framework

- API ServeRest rodando localmente

- Libraries de Robot:

1. Requests Library: 

```sh
    pip install robotframework-requests
```

2. Faker library

```sh
    pip install robotframework-faker
```

2. RPA.JSON library

```sh
    pip install rpaframework
```


### <b> Como rodar os testes no terminal: </b>
- Todos os testes: 
```sh
    robot -d ./reports /tests/nome_da_pasta.robot
```

- Testes individuais:
```sh
    robot -d ./reports -i NOME_DA_TAG /tests/nome_da_pasta.robot
```

### <b> Autor </b>
Emily Suzan Lanzarin

[![Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/emily-lanzarin-a198bb1bb/)