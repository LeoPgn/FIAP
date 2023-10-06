#Escreva um programa em Python que, considerando uma string digitada pelo usuário, converta-a em letras minúsculas e, em seguida, exiba
# os caracteres na vertical (um debaixo do outro).

palavra = input("Digite a string: ")
palavra_min = palavra.lower() #Automaticamente alterna tudo da string em minúsculo

for letra in palavra_min:
    print(letra)
#----------------------- OUTRA FORMA DE FAZER -----------------------------

print("\n")
tam = len(palavra_min)
for i in range (0,tam):
    print(palavra_min[i])