funcionario = {}

opc = 1

while (opc != 0):
    print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-==")
    print("1-Inserção")
    print("2-Alteração")
    print("3-Exibir")
    print("4-Deletar")
    opc = int(input("Digite a opção (1-4):"))
    if (opc == 1):
        try:
            cod = int(input("Digite o código do usuário: "))
            if (cod in funcionario):
                print("Usuário já cadastrado!")
            else:

                nome = input("Digite o nome do usuário: ")

                try:
                    idade = input("Digite a idade: ")
                except ValueError:
                    print("Digite valor númerico!")
                try:
                    salario = input("Digite o salário: ")
                except ValueError:
                    print("Digite valor númerico!")

                funcionario[cod] = {"cod": cod, "nome": nome, "idade": idade, "salario": salario}
        except ValueError:
            print("Digite valor númerico!")
    elif (opc == 2):
        try:
            cod = int(input("Digite o codigo a ser alterado: "))
        except ValueError:
            print("Digite valor numérico!")
        else:
            if (cod in funcionario):

                funcionario[cod]['nome'] = input("Digite o nome do usuario: ")

                try:
                    funcionario[cod]['idade'] = int(input("Digite a idade do funcionario: "))
                except ValueError:
                    print("Digite valor numérico!")
                try:
                    funcionario[cod]['salario'] = float(input("Digite o salário do funcionario: "))
                except ValueError:
                    print("Digite valor numérico!")

            else:
                print("Código não encontrado!")
    elif (opc == 3):
        try:
            cod = int(input("Digite o código a ser alterado: "))
            if (cod in funcionario):
                print(funcionario[cod])
        except:
            print("Usuário não encontrado")

    elif (opc == 4):
        try:
            cod = int(input("Digite o codigo a ser alterado: "))
            if (cod in funcionario):
                del funcionario[cod]
                print("Usuário deletado")
            else:
                print("Código não encontrado!")
        except:
            print("Usuário não encontrado")

    opc = int(input("Deseja continuar (1-SIM / 0-NÃO)? "))

