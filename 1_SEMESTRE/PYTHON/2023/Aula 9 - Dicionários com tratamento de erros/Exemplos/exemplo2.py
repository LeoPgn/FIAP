#Conceito de dicionario grande com subdicionarios

pessoa = {}
# Fazendo um dicionario de tres pessoas
for i in range(0,3):
    nome = input("Digite o nome: ")
    idade = int(input("Digite a idade: "))
    endereco = input("Digite o endereço: ")
    pessoa[nome] = {'nome': nome, 'idade': idade, 'endereco': endereco}

print(pessoa)