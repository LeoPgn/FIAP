def main():
    matriz = []
    senha = input('Digite uma senha com até 9 caracteres: ')
    codifica(matriz, 3, 3, senha)
    print(matriz)
    print(f'Senha decodificada: {decodifica(matriz, 3, 3)}')

def codifica (matriz, nlin, ncol, senha):
    i = 0
    for lin in range (0, nlin):
        linha = []
        for col in range (0, ncol):
            linha.append(ord(senha[i]))
            i+=1
        matriz.append(linha)

def decodifica (matriz, nlin, ncol):
    senha = ''
    for lin in range (0, nlin):
        for col in range (0, ncol):
            senha = senha + chr(matriz[lin][col])

    return (senha)

if __name__ == "__main__":
    main()