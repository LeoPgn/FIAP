salarios = []
for i in range(10):
  vendas = float(input("Digite o total vendido pelo funcionário %d nos últimos 3 meses: " % (i+1)))
  salario = float(input("Digite o salário do funcionário %d: " % (i+1)))
  bonus = (salario * 0.1) if vendas <= 5000 else (salario * 0.2)
  salarios.append(salario + bonus)

salarios_com_bonus = list(map(lambda x: x, salarios))
print(salarios_com_bonus)