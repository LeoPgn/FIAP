
def saudacao(periodo, *nome):
    for n in nome:
        if (periodo == "m"):
            print(f"Bom dia, {n}!")
        elif (periodo == "t"):
            print(f"Boa tarde, {n}!")
        elif (periodo == "n"):
            print(f"Boa noite, {n}")
        else:
            print("Valor indevido")


periodoDesejado = input("Escreva o período atual em que você se encontra (m/t/n): ")
saudacao(periodoDesejado, "Leo", "Shima")


#Utilizando o conceito do número desconhecido de parâmetros de uma função, crie
#uma função que faça a conversão e extenso de uma data no formato "DD/MM/AAAA".
#OBS: não deve ser utilizado if...elif...else no corpo da função.
    
def converte_data (data):
    data = "25/25/2000"
    lista = []
    lista.append(data)
    lista.split('/')
    print(lista)
    


# In[24]:


def data_por_extenso(data):
    meses = ['', 'janeiro', 'fevereiro', 'março', 'abril', 'maio', 'junho', 'julho', 'agosto', 'setembro', 'outubro', 'novembro', 'dezembro']
    dia, mes, ano = data.split('/')
    dia = int(dia)
    ano = int(ano)
    mes_extenso = meses[int(mes)]
    return f'{dia} de {mes_extenso} de {ano}'


def saudacao (periodo, **nome):
    if (periodo == "m"):
        print (f"Bom dia, {nome['sobrenome']}")
    elif (periodo=="t"):
        print (f"Boa tarde, {nome['sobrenome']}")
    else:
        print(f"Boa noite, {nome['sobrenome']}!")

saudacao("g", nome = "Leonardo", sobrenome = "Paganini")

#Funções MAP

def calcula_dobro (x):
    dobro = x * 2
    return (dobro)

lista = [1,2,3,4,5,6]
lista_dobro = list(map(calcula_dobro, lista))

print(lista_dobro)




