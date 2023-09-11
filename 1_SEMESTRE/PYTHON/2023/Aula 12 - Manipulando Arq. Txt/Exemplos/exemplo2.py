import json

with open("alunos_idade.json","r") as arqlog:
    arqJson = arqlog.read()
    lista = json.loads(arqJson)
    #print(lista)

print(lista[1]['idade'])