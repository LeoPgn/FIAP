import sys

def main():
    if (len(sys.argv)==4):
        opc = int(sys.argv[1])
        nlin = int(sys.argv[2])
        ncol = int(sys.argv[3])

        if (opc == 1):
            matriz = []
            carrega_matriz(matriz, nlin, ncol)
        elif (opc == 2):
            matriz = []
            carrega_matriz(matriz, nlin, ncol)
            print("Soma dos pares: ", soma_pares (matriz, nlin, ncol))
        elif (opc == 3):
            matriz = []
            carrega_matriz(matriz, nlin, ncol)
            exibe_diagonal_sec(matriz, nlin, ncol)
        else:
            print("Opcao invalida")
    else:
        print("Numero de argumento invalido")


def carrega_matriz (matriz, nlin, ncol):
    for lin in range (0,nlin):
        linha = []
        for col in range (0,ncol):
            linha.append(int(input("Digite um elemento: ")))
        matriz.append(linha)

def soma_pares (matriz, nlin, ncol):
    soma = 0
    for lin in range (0,nlin):
        for col in range (0,ncol):
            if (matriz[lin][col] % 2 == 0):
                soma+=matriz[lin][col]

    return (soma)

def exibe_diagonal_sec (matriz, nlin, ncol):
    for lin in range (0,nlin):
        print(matriz[lin][ncol-1-lin])

if (__name__ == "__main__"):
    main()