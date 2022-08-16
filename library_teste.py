from tkinter import W
import requests as req
from faker import Faker
import json

fake = Faker()


def Pegar_Dados_Usuario_Estatico(especifico):
    with open("./support/fixtures/static/json_usuarios.json", encoding="utf-8") as json_normal:
        usableJson = json.load(json_normal)
    #print(usableJson[especifico])
    return usableJson[especifico]


def Pegar_Dados_Produto_Estatico(especifico):
    with open("./support/fixtures/static/json_produtos.json", encoding="utf-8") as json_normal:
        usableJson = json.load(json_normal)
    #print(usableJson[especifico])
    return usableJson[especifico]


def Pegar_Dados_Token_Estatico(especifico):
    with open("./support/fixtures/static/token_invalido.json", encoding="utf-8") as json_normal:
        usableJson = json.load(json_normal)
    print(usableJson[especifico]['Authorization'])
    return usableJson[especifico]['Authorization']


def Pegar_Dados_Login_Estatico(especifico):
    with open("./support/fixtures/static/json_login.json", encoding="utf-8") as json_normal:
        usableJson = json.load(json_normal)
    return usableJson[especifico]


def Criar_e_Deletar_Usuario(vezes):
    # grande help da Amanda aqui <3 muito obrigada
    info_usuario = {}
    for i in range(0, vezes):
        info_usuario[i] = {}
        info_usuario[i]['nome'] = fake.name()
        info_usuario[i]['email'] = fake.unique.email()
        info_usuario[i]['password'] = fake.password()
        info_usuario[i]['administrador'] = str(fake.boolean()).lower()

    with open ("./support/fixtures/static/usuarios_gerados.json", "w") as fp:
        json.dump(info_usuario, fp, indent=4)

    with open ("./support/fixtures/static/usuarios_gerados.json") as json_info:
        json_info_usuario = json.load(json_info)
    
    id_usuarios = []

    for usuario in range(vezes):
        r=req.post("http://localhost:3000/usuarios", data=json_info_usuario[str(usuario)], headers={'monitor':'false'})
        request_json = r.json()
        print(request_json)
        id_usuarios.append(request_json["_id"])
  
    for id in id_usuarios:
        r = req.delete(F"http://localhost:3000/usuarios/{id}", headers={'monitor':'false'})
        request_json = r.json()
        print(request_json)


def Criar_Info(vezes):
    info_usuario = {}

    for i in range(0, vezes):
        info_usuario[i] = {}
        info_usuario[i]['nome'] = fake.name()
        info_usuario[i]['email'] = fake.unique.email()
        info_usuario[i]['password'] = fake.password()
        info_usuario[i]['administrador'] = str(fake.boolean()).lower()

    with open ("./support/fixtures/static/usuarios_gerados.json", "w") as fp:
        json.dump(info_usuario, fp, indent=4)

    return vezes


def Criar_Usuarios(vezes):
    with open ("./support/fixtures/static/usuarios_gerados.json") as json_info:
        json_info_usuario = json.load(json_info)
    
    id_usuarios = []

    for usuario in range(vezes):
        r=req.post("http://localhost:3000/usuarios", data=json_info_usuario[str(usuario)], headers={'monitor':'false'})
        request_json = r.json()
        print(request_json)
        id_usuarios.append(request_json["_id"])

    return id_usuarios


def Info_Logar_Usuarios(lista_logar):
    email_e_senha = {}

    for id in lista_logar:
        r = req.get(F"http://localhost:3000/usuarios/{id}", headers={'monitor':'false'})
        request_json = r.json()
        print(request_json)
        for i in range(len(lista_logar)):
            email_e_senha[i] = {}
            email_e_senha[i]['email'] = request_json["email"]
            email_e_senha[i]['password'] = request_json["password"]
            
    with open ("./support/fixtures/static/info_logar.json", "w") as fp:
        json.dump(email_e_senha, fp, indent=4)


def Logar_Usuarios(vezes):
    with open ("./support/fixtures/static/info_logar.json") as json_info:
        json_info_login = json.load(json_info)

    for usuario in range(vezes):
        r=req.post("http://localhost:3000/login", data=json_info_login[str(usuario)], headers={'monitor':'false'})
        request_json = r.json()
        print(request_json)


def Deletar_Usuarios(lista_delete):
    for id in lista_delete:
        r = req.delete(F"http://localhost:3000/usuarios/{id}", headers={'monitor':'false'})
        request_json = r.json()
        print(request_json)


#Info_Logar_Usuarios((Criar_Usuarios(Criar_Info(2))))
#Logar_Usuarios(2)

#Criar_e_Deletar_Usuario()
#Pegar_Dados_Id_Estatico('id_invalido')
