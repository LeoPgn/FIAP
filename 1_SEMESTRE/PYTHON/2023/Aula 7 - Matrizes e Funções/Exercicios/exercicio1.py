# Uma função para carregar uma matriz 3x4 de números inteiros com a matriz sendo um parâmetro

def main():
    matriz = []
    carrega_matriz(matriz, 3, 4)
    exibe_matriz(matriz, 3)
    exibe_parImpares(matriz, 3, 4)
    print('Quantidade de pares: ', pares)
    print('Quantidade de impares: ', impares)

def carrega_matriz(matriz, nlin, ncol):
    for lin in range (0, nlin):
        linha = []
        for col in range (0, ncol):
            linha.append(int(input('Insira os números da matriz: ')))
        matriz.append(linha)

def exibe_matriz(matriz, nlin):
    for lin in range(0, nlin):
        print(matriz[lin])

def exibe_parImpares (matriz, nlin, ncol):
    pares = 0
    impares = 0
    for lin in range(0, nlin):
        for col in range(0, ncol):
            if (matriz[lin][col] % 2 == 0):
                pares += 1
            else:
                impares += 1
    return (pares,impares)

if __name__ == "__main__":
    main()