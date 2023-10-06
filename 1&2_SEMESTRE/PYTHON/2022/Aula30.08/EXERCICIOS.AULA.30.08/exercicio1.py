media_anual = float(input("Qual a sua média anual?: "))

if (media_anual>=6.0):
    print("Aprovado")
elif (media_anual>=3.0 and media_anual<=5.9):
    print("Estudante está de exame")
elif (media_anual<3.0):
    print("Reprovado")
else:
    print("Digite um número válido!")