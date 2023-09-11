#criação de uma tupla

dias_semana = ("Domingo","Segunda-feira","Terça-feira","Quarta-feira","Quinta-feira","Sexta-feira", "Sábado")
#índices:          0            1              2             3              4              5            6

print("Elementos nos índices 0 e 4, respectivamente: ", dias_semana[0],",",dias_semana[4])

#criação de tupla com 1 elemento

objeto_string = ("teste")
objeto_tupla = ("teste",)

print(type(objeto_string))
print(type(objeto_tupla))

#Intervalos

print("Elementos nos índices de 1 a 4: ", dias_semana[1:4])
print("3 primeiros elementos: ", dias_semana[:3])
print("4 últimos elementos: ", dias_semana[-4:])

#Verificar a inclusão de um elemento

print("Quinta-feira está na lista? ", "Quinta-feira" in dias_semana)
print("Janeiro está na lista? ", "Janeiro" in dias_semana)

#Obter posição (índice) de um elemento na lista

if ("Sexta-feira" in dias_semana):
    print("Posição (índice) onde o Sexta-feira está na tupla: ", dias_semana.index("Sexta-feira"))
else:
    print("Sexta-feira não está na tupla")
if ("Dezembro" in dias_semana):
    print(dias_semana.index("Dezembro"))
else:
    print("Dezembro não está na tupla")


