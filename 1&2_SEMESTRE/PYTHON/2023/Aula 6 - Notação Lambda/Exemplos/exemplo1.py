# Forma tradicional de usarmos funções:
def soma_numeros(x, y):
    soma = x + y
    return soma
x = 7
y = 7
print("A soma com função simples é: ", soma_numeros(x , y))

#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

# Para usarmos da forma lambda, já atribuimos o nome da função,
# após, já colocamos "lambda" e os parametros e em seguida, o que devemos fazer com eles.
soma_numeros_lambda = lambda x, y: x + y
x = 7
y = 7

print("Soma: ", soma_numeros_lambda(x,y))
#-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# lambda com if


# lambda com MAP
calcula_dobro = lambda num: num * 2
print("Dobro: ", calcula_dobro(6))

lista = [3,5,6,2,4,10]
# map faz o mapeamento da lista que eu quero.
lista_dobro = list(map(calcula_dobro, lista))

# Com lambda, já passamos direto sem fazer uma função que faça o dobro.
lista_dobro_nova = list(map(lambda num: num * 2,lista))
print(lista_dobro_nova)
