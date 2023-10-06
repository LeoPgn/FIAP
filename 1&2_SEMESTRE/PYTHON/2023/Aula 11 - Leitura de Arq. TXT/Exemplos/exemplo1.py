# Leitura do arquivo de texto
# Exibe o conteudo do arquivo linha por linha

with open('produtos_livraria.txt', 'r', encoding = 'UTF8') as arq:
    for linha in arq:
        print(linha)

print('\n')
# Exibe somente o conteudo de UMA linha do arquivo
with open('produtos_livraria.txt', 'r', encoding = 'UTF8') as arq:
    linha = arq.readline()
    print(linha)
    arq.close()

print('\n')
# Exibe o conteudo do arquivo como uma lista
with open('produtos_livraria.txt', 'r', encoding = 'UTF8') as arq:
    texto = arq.readline()
    print(texto)
    arq.close()