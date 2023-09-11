def codifica_senha(matriz, linhas, colunas, senha):
    if len(senha) != linhas * colunas:
        print("Erro: senha deve ter", linhas * colunas, "caracteres")
        return matriz

    for i in range(linhas):
        for j in range(colunas):
            index = i * colunas + j
            codigo = ord(senha[index])
            matriz[i][j] = codigo

    return matriz

def decodifica_senha(matriz, linhas, colunas):
    senha = ""

    for i in range(linhas):
        for j in range(colunas):
            codigo = matriz[i][j]
            caractere = chr(codigo)
            senha += caractere

    return senha

def main():
    matriz_codificada = codifica_senha([[0, 0, 0], [0, 0, 0], [0, 0, 0]], 3, 3, "Fiap12345")

    print("Matriz codificada:")
    for linha in matriz_codificada:
        print(linha)

    senha_decodificada = decodifica_senha(matriz_codificada, 3, 3)

    print("Senha decodificada:", senha_decodificada)

if __name__ == "__main__":
    main()