palavra = input("Digite uma palavra: ")
carac = input("Digite o caractere que deseja: ")

qtde_carac = 0

for letra in palavra:
    if (letra == carac):
        qtde_carac += 1
print('=-' * 30)
print('Qtde de ', carac, 'Qtde de carac na string é: ', qtde_carac)