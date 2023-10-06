def main():
    lista = []
    carrega_lista(lista, 10)
    print("Quantidade de palindromas: ", conta_palindromas (lista, 10))

def carrega_lista (lista, tam):
    for i in range (0,tam):
        lista.append(input("Digite uma palavra: "))

def conta_palindromas (lista, tam):
    cont = 0
    for i in range (0,tam):
        if (lista[i] == lista[i][::-1]):
            cont+=1

    return (cont)

if (__name__ == "__main__"):
    main()