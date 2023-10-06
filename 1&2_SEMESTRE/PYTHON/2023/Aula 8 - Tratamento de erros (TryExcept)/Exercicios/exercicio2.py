lista_codigos = []
lista_descr = []
lista_qtde = []
lista_valor = []

resp = "S"

while (resp != "N"):
    print("1-Inserir dados do produto")
    print("2-Exibir dados do produto")
    opc = int(input("Digite a opcao desejada (1-2): "))
    if (opc == 1):
        try:
            cod = int(input("Digite o codigo do produto: "))
            descr = input("Digite a descrição do produto: ")
            qtde = int(input("Digite a quantidade do produto: "))
            valor = float(input("Digite o valor do produto: "))
        except ValueError:
            print("Digite o valor numerico. Não digite letras!")
        else:
            lista_codigos.append(cod)
            lista_descr.append(descr)
            lista_qtde.append(qtde)
            lista_valor.append(valor)
        finally:
            print("Operação finalizada!")
    elif (opc == 2):
        print(lista_codigos)
        print(lista_descr)
        print(lista_qtde)
        print(lista_valor)

    resp = input("Deseja continuar (S/N)? ")

