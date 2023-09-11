def main():
    matriz = []
    carrega_matriz(matriz, 3, 6)
    exibe_matriz(matriz, 3)
    print("Lista da soma - colunas indice impar: ", calcula_soma_indice_impar (matriz, 3, 6))

def carrega_matriz (matriz, nlin, ncol):
    for lin in range (0,nlin):
        linha = []
        for col in range (0,ncol):
            linha.append(int(input("Digite um elemento: ")))
        matriz.append(linha)

def exibe_matriz (matriz, nlin):
    for lin in range (0,nlin):
        print(matriz[lin])

def calcula_soma_indice_impar (matriz, nlin, ncol):
    listaB = []

    for col in range (0,ncol):
        soma = 0
        for lin in range (0,nlin):
            if (col % 2 != 0):
                soma+=matriz[lin][col]
        if (col % 2 != 0): #if (soma != 0)
            listaB.append(soma)

    return (listaB)

if (__name__ == "__main__"):
    main()