lista_codigos = []
lista_nomes = []
lista_idades = []
lista_salarios = []

resp = "S"

while (resp != "N"):
    print("1-Inserir dados do funcionario")
    print("2-Exibir dados do funcionario")
    opc = int(input("Digite a opcao desejada (1-2): "))
    if (opc == 1):
        try:
            cod = int(input("Digite o codigo do funcionario: "))
            nome = input("Digite o nome do funcionario: ")
            idade = int(input("Digite a idade do funcionario: "))
            salario = float(input("Digite o salario do funcionario: "))
        except ValueError:
            print("Digite o valor numerico. Não digite letras!")
        else:
            lista_codigos.append(cod)
            lista_nomes.append(nome)
            lista_idades.append(idade)
            lista_salarios.append(salario)
        finally:
            print("Operação finalizada!")
    elif (opc == 2):
        print(lista_codigos)
        print(lista_nomes)
        print(lista_idades)
        print(lista_salarios)

    resp = input("Deseja continuar (S/N)? ")

