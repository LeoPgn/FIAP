# Utilizando o metodo try except para inserir os valores em listas

lista_cod = []
lista_nome = []
lista_senha = []

resp = 'S'

while (resp!='N'):
    print("1 - Inserir usuário")
    print('2 - Exibir dados do usuário')
    opc = int(input('Digite a opção: '))
    if (opc==1):
        try:
            cod = int(input('Digite o codigo do usuario: '))
            nome = input('Digite o codigo do nome: ')
            senha = int(input('Digite o codigo da senha: '))
        except ValueError:
            print("Digite um valor numérico!")
        else:
            lista_cod.append(cod)
            lista_nome.append(nome)
            lista_senha.append(senha)
        finally:
            print('Operação finalizada')
    elif (opc==2):
        print(lista_cod)
        print(lista_nome)
        print(lista_senha)

    resp = input('Deseja continuar?(S/N): ')