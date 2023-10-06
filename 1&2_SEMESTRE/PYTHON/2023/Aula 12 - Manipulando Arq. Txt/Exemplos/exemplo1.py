import json

with open("log.json","r") as arqlog:
    arqJson = arqlog.read()
    lista = json.loads(arqJson)
    #print(lista)

#print(lista[1])
print(lista[0]['dataLen'])