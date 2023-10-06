# Criar uma função que vai exibir uma matriz e usar os elementos da matriz individualmente

def main():
    matriz = []
    carrega_matriz(matriz, 3, 4)
    exibe_matriz(matriz, 3)
    print('Soma dos elementos da matriz: ', soma_matriz(matriz, 3, 4))

def carrega_matriz(matriz, nro_linhas, nro_col):
    for lin in range (0, nro_linhas):
        linha = []      #toda vez que vamos para a nova linha, criamos uma nova linha do zero
        for col in range (0, nro_col):
            linha.append(int(input("Digite os elementos: ")))
        matriz.append(linha)

def exibe_matriz(matriz, nro_linhas):
    for lin in range(0, nro_linhas):
        print(matriz[lin])

def soma_matriz(matriz, nro_linhas, nro_col):
    soma = 0
    for lin in range (0, nro_linhas):
        for col in range (0 , nro_col):
            soma += matriz[lin][col]
    return (soma)

if __name__ == "__main__":
    main()