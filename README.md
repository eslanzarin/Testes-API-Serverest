# Testes API Serverest
[![Badge ServeRest](https://img.shields.io/badge/API-ServeRest-green)](https://github.com/ServeRest/ServeRest/)

Repositório criado para armazenar os códigos com objetivo de automatizar os testes para a API Serverest, que simula uma loja virtual. Os testes permeiam todos os endpoints da API, sendo eles: login, usuarios, produtos e carrinho. 

### **Relatórios de Testes da API:** 

ENDPOINT /LOGIN

| CASO DE TESTE  | NOME DO TESTE | TAG | RESPOSTA RECEBIDA | RESPOSTA PREVISTA |
|---|---|---|---|---|
| **CT02**  | POST Login Com Senha Incorreta  | LOGIN_SENHA_INCORRETA  | Status Code: 401 Conteúdo: "Email e/ou senha inválidos" | Status Code: 400 Conteúdo: "Email e/ou senha inválidos"  |
| **CT03** | POST Login Com Usuario Inexistente  | LOGIN_USUARIO_INEXISTENTE  | Status Code: 401 Conteúdo: "Email e/ou senha inválidos"  | Status Code: 400 Conteúdo: "Email e/ou senha inválidos"  |
|**CT04**|POST Efetuar Login Email em Branco|LOGIN_SEM_EMAIL|Status Code: 400 Conteúdo: "email não pode ficar em branco"|Sem mensagem prevista em documentação|
|**CT05**|POST Efetuar Login Senha em Branco|LOGIN_SEM_SENHA|Status Code: 400 Conteúdo: "password não pode ficar em branco"|Sem mensagem prevista em documentação|

ENDPOINT /USUARIOS

| CASO DE TESTE  | NOME DO TESTE | TAG | RESPOSTA RECEBIDA | RESPOSTA PREVISTA |
|---|---|---|---|---|
| **CT11** |POST Cadastrar usuário com campo "e-mail" em branco|USUARIO_SEM_EMAIL|Status Code: 400 Conteúdo: "email não pode ficar em branco"|Sem mensagem prevista em documentação|
| **CT12**  |POST Cadastrar Usuário sem Senha |USUARIO_SEM_PASSWORD|Status Code: 400 Conteúdo: "password não pode ficar em branco" |Sem mensagem prevista em documentação|
| **CT13**  |POST Cadastrar Usuário sem Nome 400|USUARIO_SEM_NOME|Status Code: 400 Conteúdo: "nome não pode ficar em branco"|Sem mensagem prevista em documentação |
| **CT14**  | POST Cadastrar Usuário sem Administrador|USUARIO_SEM_ADM|Status Code: 400 Conteúdo: "administrador não pode ficar em branco"|Sem mensagem prevista em documentação  |
| **CT20**  |DELETE Deletar Usuário com Id Inexistente|DELETE_USUARIO_ID_INEXISTENTE|Status Code: 200 Conteúdo: "Nenhum registro excluído"|Status Code: 200 Conteúdo: "Registro excluído com sucesso / Nenhum registro excluído"|

ENDPOINT /PRODUTOS
| CASO DE TESTE  | NOME DO TESTE | TAG | RESPOSTA RECEBIDA | RESPOSTA PREVISTA |
|---|---|---|---|---|
| **CT27**  |POST Produto sem Preço|POST_PRODUTO_SEM_PRECO| Status Code: 400 Conteúdo: "preco deve ser um número"|Sem retorno previsto em documentação|
| **CT28** |POST Produto sem Descrição|POST_PRODUTO_SEM_DESCRICAO| Status Code: 400 Conteúdo: "descricao não pode ficar em branco|Sem retorno previsto em documentação|
| **CT29**  |POST Produto sem Quantidade|POST_PRODUTO_SEM_QUANTIDADE| Status Code: 400 Conteúdo: "quantidade deve ser um número"|Sem retorno previsto em documentação|
| **CT30**  | POST Produto sem Nome|POST_PRODUTO_SEM_NOME| Status Code: 400 Conteúdo: "nome não pode ficar em branco"|Sem retorno previsto em documentação|
| **CT31**  | POST Produto Preço Zero|POST_PRODUTO_PRECO_ZERO | Status Code: 400 Conteúdo: "preco deve ser um número positivo|Sem retorno previsto em documentação|
| **CT32**  | POST Produto Quantidade Zero|POST_PRODUTO_QUANTIDADE_ZERO | Status Code: 201 Conteúdo: {"message": "Cadastro realizado com sucesso", "_id": "kkpNayiWjDlWDbLs"}|Sem retorno previsto em documentação|


ENDPOINT /CARRINHOS

| CASO DE TESTE  | NOME DO TESTE | TAG | RESPOSTA RECEBIDA | RESPOSTA PREVISTA |
|---|---|---|---|---|
| **CT57** |POST Cadastrar Novo Carrinho Usuario Já com Carrinho|POST_CARRINHO_DUPLICADO|Status Code: 400 Conteúdo: "Não é permitido ter mais de 1 carrinho" |Status Code: 400 Conteúdo: "Não é permitido possuir produto duplicado / Não é permitido ter mais de 1 carrinho / Produto não encontrado / Produto não possui quantidade suficiente"  |
| **CT58**|POST Cadastrar Produto em Quantidade Insuficiente em Carrinho |POST_CARRINHO_PRODUTO_INSUFICIENTE|Status Code: 400 Conteúdo: "Produto não possui quantidade suficiente" e informações sobre o item em específico |Status Code: 400 Conteúdo: "Não é permitido possuir produto duplicado / Não é permitido ter mais de 1 carrinho / Produto não encontrado / Produto não possui quantidade suficiente" |
| **CT68** |DELETE Cancelar Compra|DELETE_CARRINHO_CANCELAR_COMPRA|Status Code: 200 Conteúdo: "Registro excluÍdo com sucesso. Estoque dos produtos reabastecido" |Status Code: 200 Conteúdo: "Registro excluído com sucesso | Não foi encontrado carrinho para esse usuário" |

----

### **Requirements**
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


### **Como rodar os testes no terminal:**
- Todos os testes: 
```sh
    robot -d ./reports /tests/nome_da_pasta.robot
```

- Testes individuais:
```sh
    robot -d ./reports -i NOME_DA_TAG /tests/nome_da_pasta.robot
```

### **Autor**
Emily Suzan Lanzarin

[![Linkedin](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/emily-lanzarin-a198bb1bb/)