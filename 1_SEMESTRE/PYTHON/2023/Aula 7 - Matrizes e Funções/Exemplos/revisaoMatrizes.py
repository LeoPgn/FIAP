# Trabalhando com uma matriz sem o usuario digitar os valores

# 2 4 5 = Sublista da matriz
# 6 3 2 = Outra sublista da matriz

# Matriz é uma lista grande com listas pequenas dentro
matriz = [[2, 4, 5], [6, 3, 2]]
print(matriz)

# Imprimindo apenas a primeira linha
print(f'Primeira linha da matriz: ', matriz[0])

# Imprimindo apenas a segunda linha
print('Segunda linha da matriz: ', matriz[1])

# Imprimindo segundo elemento da primeira linha
# O primeiro conchetes é selecionar a sublista, o segundo é o elemento dentro da sublista, chama-se acessando indices
print('Segundo elemento da primeira linha: ', matriz[0][1])

# Imprimindo terceiro elemento da segunda linha
print('Terceiro elemento da segunda linha: ', matriz[1][2])

# Imprimir a matriz no formato original
# Usaremos for para imprimir primeiro a primeira linha e depois a segunda
# Neste caso, colocamos o 0 pois é o começo do indice e usamos 2 pois é a quantidade de linhas
for lin in range(0,2):
    print(matriz[lin])

# Exemplo quando queremos exibir somente numeros maiores que dois
for lin in range(0,2):
    for col in range (0, 3):
        if (matriz[lin][col] > 2):
            print(matriz[lin][col])

