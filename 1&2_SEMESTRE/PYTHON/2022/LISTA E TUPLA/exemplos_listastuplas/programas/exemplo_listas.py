#criação de uma lista

nomes = ["João", "Maria", "Pedro", "Ana", "Antônio", "José"]
#índices:   0       1        2       3        4         5

print("Elementos nos índices 0 e 4, respectivamente: ", nomes[0],",",nomes[4])

#Retorno do tamanho da lista: método len

print("Tamanho (quantidade de elementos) da lista: ", len(nomes))

#Intervalos

print("Elementos nos índices de 1 a 4: ", nomes[1:4])
print("3 primeiros elementos: ", nomes[:3])
print("4 últimos elementos: ", nomes[-4:])

#Verificar a inclusão de um elemento

print("Ana está na lista? ", "Ana" in nomes)
print("Daniel está na lista? ", "Daniel" in nomes)

#Obter posição (índice) de um elemento na lista

if ("Antônio" in nomes):
    print("Posição (índice) onde o Antônio está na lista: ", nomes.index("Antônio"))
else:
    print("Antônio não está na lista")
if ("Daniel" in nomes):
    print(nomes.index("Daniel"))
else:
    print("Daniel não está na lista")

#Inserção de elementos da lista

nomes.append("Rita")
print("Inserção do elemento Rita na lista: ", nomes)

nomes.insert(2,"Juma")
print("Inserção do elemento Juma na lista: ", nomes)

#Remoção de elementos da lista

nomes.remove("Pedro")
print("Remoção do elemento Pedro da lista: ", nomes)

nomes.pop(0)
print("Remoção do primeiro elemento da lista: ", nomes)

