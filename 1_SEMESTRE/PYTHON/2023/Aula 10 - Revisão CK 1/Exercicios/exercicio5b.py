lista_numeros = [4, 3, 2, 1, 5, 8]

lista_numeros_nova = list(map(lambda num : num + 5 if (num % 2 == 0) else num - 2,lista_numeros))

print(lista_numeros_nova)