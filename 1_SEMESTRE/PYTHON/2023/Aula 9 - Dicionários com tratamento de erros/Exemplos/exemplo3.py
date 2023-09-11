#Usando tratamento de erros em dicionarios

# ABAIXO USAMOS UM CRUD
usuarios ={}
resp = "S"

while (resp != "N"):
    print("1-Inserção")
    print("2-Alteração")
    print("3-Remoção")
    print("4-Exibição")
    opc = int(input("Digite a opção (1-4):"))
    if (opc == 1):
        try:
            cod = int(input("Digite o codigo do usuario: "))
            nome = input("Digite o nome do usuario: ")
            senha = input("Digite a senha do usuario: ")
        except ValueError:
            print("Digite valor numérico!")
        else:
            usuarios[cod] = {'cod': cod, 'nome': nome, 'senha': senha}
        finally:
            print("Operação finalizada")
    elif (opc == 2):
        try:
            cod = int(input("Digite o codigo a ser alterado: "))
        except ValueError:
            print("Digite valor numérico!")
        else:
            if (cod in usuarios):
                usuarios[cod]['nome'] = input("Digite o nome do usuario: ")
                usuarios[cod]['senha'] = input("Digite a senha do usuario: ")
            else:
                print("Código não encontrado!")
    elif (opc == 3):
        try:
            cod = int(input("Digite o codigo a ser removido: "))
        except ValueError:
            print("Digite valor numérico!")
        else:
            if (cod in usuarios):
                del usuarios[cod]
            else:
                print("Código não encontrado!")
    elif (opc == 4):
        print(usuarios)
    else:
        print("Opção inválida!")

    resp = input("Deseja continuar (S/N)? ")
