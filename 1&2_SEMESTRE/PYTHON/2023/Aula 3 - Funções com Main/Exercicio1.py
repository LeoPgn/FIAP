#Uma função que carregue uma lista com 10 elementos;

def main():
    resp = "S"

    while (resp != "N"):
        print("1-Carrega lista")
        print("2-Encontra maior elemento da lista")
        print("3-Exibe lista")
        opc = int(input("Digite a opção (1 a 3): "))
        if (opc == 1):
            lista = []
            carrega_lista(lista)
        elif (opc == 2):
            print("Maior da lista: ", encontra_maior(lista))
        elif (opc == 3):
            exibe_lista(lista)
        else:
            print("Opção inválida!")

        resp = input("Deseja continuar (S/N)? ")


def carrega_lista(lista):
    for i in range(0, 10):
        lista.append(int(input("Digite o elemento: ")))

    return (lista)


def encontra_maior(lista):
    maior = lista[0]

    for i in range(1, 10):
        if (lista[i] > maior):
            maior = lista[i]

    return (maior)


def exibe_lista(lista):
    for i in range(0, 10):
        print(lista[i])


if (__name__ == "__main__"):
    main()