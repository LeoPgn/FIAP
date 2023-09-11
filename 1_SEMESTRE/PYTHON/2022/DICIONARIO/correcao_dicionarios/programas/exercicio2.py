funcionarios = {}

for i in range (0,3):
    nome = input("Nome: ")
    cargo = input("Cargo: ")
    salario = float(input("Salário: "))
    funcionarios[nome] = {'nome': nome, 'cargo': cargo, 'salario': salario}

print(funcionarios)

print("\n")

nome = input("Nome a ser procurado: ")
if (nome in funcionarios):
    print(funcionarios[nome])
else:
    print("Funcionário não cadastrado!")