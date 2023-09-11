lista_salarios = []
lista_totalVendas = []

for i in range(10):
    lista_salarios.append(float(input('Digite o salario do funcionario: ')))
    lista_totalVendas.append(float(input('Digite o total de vendas do funcionario: ')))

lista_bonus = list(map(lambda sal, tot_venda:sal * 1.10 if tot_venda <=5000 else sal*1.20, lista_salarios, lista_totalVendas))
print(lista_bonus)