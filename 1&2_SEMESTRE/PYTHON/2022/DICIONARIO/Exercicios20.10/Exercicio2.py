produtos = {}
resp = 1

while (resp != 0):
    print('1-Incluir')
    print('2-Alterar')
    print('3-Exibir')
    print('4-Excluir')
    opcao = int(input("Digite a opção desejada: "))
    if (opcao == 1):
        descricao = input("Descrição: ")
        qtde = int(input('Quantidade: '))
        marca = input('Marca: ')
        valor = float(input('Endereço: '))
        produtos[descricao] = {'Descrição:':descricao, 'quantidade': qtde, 'marca':marca, 'valor:':valor}
    elif (opcao ==2):
        descricao = input("Descrição: ")
        if (descricao in produtos):
            produtos [descricao]['Quantidade']=int(input('Nova quantidade: '))
            produtos [descricao]['Marca']=input('Marca: ')
            produtos [descricao]['valor']=float(input('Novo valor: '))
        else:
            print("Produto não encontrado")
    elif (opcao==3):
        print(produtos)
    elif (opcao==4):
        descricao = input('Descrição: ')
        if (descricao in produtos):
            del produtos[descricao]
        else:
            print('Produto não encontrado')
    resp = int(input('Deseja continuar (1-SIM / 0-NAO): '))

print('\n')
marca = input('Digite a marca desejada: ')
for chave, subdic in produtos.items():
    if (subdic['marca'] == marca and subdic ['quantidade'] > 50):
        print(produtos[chave])