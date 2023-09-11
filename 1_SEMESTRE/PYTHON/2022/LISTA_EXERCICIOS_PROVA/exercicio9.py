frase = input("Digite a frase: ")
qtde_brancos = 0

for letra in frase:
    if (letra == ' '):
        qtde_brancos += 1
print('=-' * 30)
print("Qtde de espaços em braco: ", qtde_brancos)