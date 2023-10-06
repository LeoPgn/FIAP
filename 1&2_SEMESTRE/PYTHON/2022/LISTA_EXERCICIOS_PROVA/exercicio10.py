palavra = input("Digite uma palavra com 0's e 1's: ")
qtde_uns = 0

for letra in palavra:
    if (letra == '1'):
        qtde_uns += 1
print('=-' * 30)
print('Qtde de uns na string: ', qtde_uns)

