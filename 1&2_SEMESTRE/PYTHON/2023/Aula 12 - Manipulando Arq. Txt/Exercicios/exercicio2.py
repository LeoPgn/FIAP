import json

with open("produtos_estoque.json","r") as arqEstoque:
    arqJson = arqEstoque.read()
    lista = json.loads(arqJson)

print("Produtos com quantidade superior a 100 unidades \n")
for i in range (len(lista)):
    if (lista[i]['quantidade'] > 100):
        print(f"Descricao do produto com quantidade superior a 100: {lista[i]['produto']}")

print("\nProdutos com preço entre R$5.00 e R$20.00\n")
for i in range (len(lista)):
    if (lista[i]['valor'] >= 5.00 and lista[i]['valor'] <= 20.00):
        print(f"Descricao do produto com preco entre R$5.00 e R$20.00: {lista[i]['produto']}")