# FakerLibrary = library para criação de massas de dados dinâmicas (p cadastros e cenários semelhantes)
* Settings *
Documentation           Keywords e variáveis para Geração de Dados Dinâmicos
Library                 FakerLibrary 

* Variables *
#variáveis criadas dentro dessa sessão, mesmo que com a sintaxe correta, serão lidas como strings e não criadas aleatoriamente

* Keywords *
Dados Dinamicos Usuario Valido
    ${nome}                     FakerLibrary.Name
    ${email}                    FakerLibrary.Email
    ${payload}                  Create Dictionary       nome=${nome}    email=${email}      password=teste   administrador=true
    Set Global Variable         ${payload}
    Set Global Variable         ${email}

Gerar Id Invalido
    ${invalid_id}               FakerLibrary.RandomNumber
    Set Global Variable         ${invalid_id}

Dados Dinamicos Produto
    ${nome_produto}             FakerLibrary.Word   
    ${preco}                    FakerLibrary.RandomNumber       digits=3        fix_len==true
    ${descricao}                FakerLibrary.Text               max_nb_chars=5
    ${quantidade}               FakerLibrary.RandomNumber       digits=2        fix_len==true
    ${payload}                  Create Dictionary       nome=${nome_produto}    preco=${preco}      descricao=${descricao}   quantidade=${quantidade}
    Set Global Variable         ${payload} 
    Set Global Variable         ${nome_produto} 

Dados Dinamicos Produto Mesmo Nome
    ${preco}                    FakerLibrary.RandomNumber       digits=3        fix_len==true
    ${descricao}                FakerLibrary.Text               max_nb_chars=5
    ${quantidade}               FakerLibrary.RandomNumber       digits=2        fix_len==true
    ${payload}                  Create Dictionary       nome=${nome_produto}    preco=${preco}      descricao=${descricao}   quantidade=${quantidade}
    Set Global Variable         ${payload} 
    Set Global Variable         ${nome_produto} 