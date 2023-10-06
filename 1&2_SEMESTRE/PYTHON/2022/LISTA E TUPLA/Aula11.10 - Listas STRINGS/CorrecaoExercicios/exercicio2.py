matriz = []
k = int(input("Digite o valor de k: "))

for lin in range (0,3):
    linha = []
    for col in range (0,3):
        num = int(input("Digite um elemento: "))
        linha.append(num)
    matriz.append(linha)

for lin in range(0,3):
    for col in range(0,3):
        if (lin == col):
            matriz[lin][col] = k * matriz