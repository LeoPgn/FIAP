palavras = input("Digite uma lista de 5 palavras separadas por virgula: ").split(',')

resultado = list(map(lambda palavra: 1 if palavra == palavra[::-1] else 0, palavras))

print(resultado)