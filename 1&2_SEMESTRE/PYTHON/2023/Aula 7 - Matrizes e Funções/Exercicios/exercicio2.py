def main():
    matriz = []
    carrega_matriz(matriz, 3, 3)
    exibe_matriz(matriz, 3)
    soma_diagonal(matriz, 3, 3)
    print("Soma da diagonal: ", soma_diagonal(matriz, 3, 3))

def carrega_matriz(matriz, nlin, ncol):
    for lin in range(0, nlin):
        linha = []
        for col in range(0, ncol):
            linha.append(int(input('Insira os números da matriz: ')))
        matriz.append(linha)

def exibe_matriz(matriz, nlin):
    for lin in range(0, nlin):
        print(matriz[lin])

def soma_diagonal(matriz, nlin, ncol):
    soma = 0
    for lin in range(0, nlin):
        for col in range(0, ncol):
            if(lin == col):
                soma+=matriz[lin][col]
    return (soma)

if __name__ == "__main__":
    main()