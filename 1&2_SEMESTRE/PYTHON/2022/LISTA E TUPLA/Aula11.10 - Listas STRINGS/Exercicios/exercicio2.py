#Dada uma string digitada pelo usuário, crie um programa em Python que faça a contagem de vogais existentes nessa string.

palavra = input("Digite uma string: ")
qtde_vogais = 0

palavra_min = palavra.lower()

for letra in palavra_min:
    if (letra=="a" or letra=="e" or letra=="i" or letra=="o" or letra=="u"):
        qtde_vogais+=1
print("Qtde de vogais: ", qtde_vogais)