import json

with open("log.json","r") as arqLog:
    arqJson = arqLog.read()
    lista = json.loads(arqJson)

for i in range(len(lista)):
    try:
        print(f"Operation name: {lista[i]['operationName']}")
    except:
        print("Operation name: NC")
    try:
        print(f"Table name: {lista[i]['tableName']}")
    except:
        print("Table name: NC")
    try:
        print(f"Fields: {lista[i]['fields']}")
    except:
        print("Fields: NC")