#Faça um programa em Python que solicite a data de nascimento (dd/mm/aaaa) do usuário e imprima a data com o nome do mês por extenso.

data = input("Digite a data de nascimento do usuário no formato dd/mm/aaaa: ")

data_split = data.split("/")
mes = data_split[1]

if (mes=='01'):
    mes_extenso = "Janeiro"
elif (mes=='2'):
    mes_extenso = 'Fevereiro'
elif (mes=='3'):
    mes_extenso = 'Março'
elif (mes=='4'):
    mes_extenso = 'Abril'
elif (mes=='5'):
    mes_extenso = 'Maio'
elif (mes=='6'):
    mes_extenso = 'Junho'
elif (mes=='7'):
    mes_extenso = 'Julho'
elif (mes=='8'):
    mes_extenso = 'Agosto'
elif (mes=='9'):
    mes_extenso = 'Setembro'
elif (mes=='10'):
    mes_extenso = 'Outubro'
elif (mes=="11"):
    mes_extenso = 'Novembro'
elif (mes=='12'):
    mes_extenso = 'Dezembro'

data_extenso = data_split[0] + " de " + mes_extenso + " de " + data_split[2]
print("A data é: ", data_extenso)