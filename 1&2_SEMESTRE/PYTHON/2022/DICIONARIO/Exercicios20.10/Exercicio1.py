resp = 1

lista_clientes = {}

while (resp != 0):
    print('1-Incluir')
    print('2-Alterar')
    print('3-Exibir')
    print('4-Excluir')
    opcao = int(input("Digite a opção desejada: "))
    if (opcao == 1):
        nome = input("Nome: ")
        cpf = input('CPF: ')
        idade = int(input('Idade: '))
        endereco = input('Endereço: ')
        limite_credito = float(input('Digite o limite de crédito: '))
        lista_clientes[nome] = {'nome': nome, 'cpf': cpf, 'idade': idade, 'endereco': endereco, 'limite_credito': limite_credito}
    elif (opcao ==2):
        nome = input("Nome: ")
        if (nome in lista_clientes):
            lista_clientes [nome]['cpf']=input('Digite o novo CPF: ')
            lista_clientes [nome]['idade']=input('Digite a idade: ')
            lista_clientes [nome]['endereco']=input('Digite o novo endereço: ')
            limite_credito [nome]['limite_credito']=input('Digite o novo limite de crédito: ')
        else:
            print("Cliente não encontrado")
