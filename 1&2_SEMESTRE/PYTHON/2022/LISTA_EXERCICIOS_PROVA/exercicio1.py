lista = []
valor = 0

for c in range(0,10):
    valor = int(input('Digite o valor: '))
    if valor % 2 == 0:
        lista += 1
    else:
        lista[1].append(valor)
print('-=' * 30)
print(f'Valores pares: {lista[0]}')
print(f'Valores ímpares: {lista[1]}')


