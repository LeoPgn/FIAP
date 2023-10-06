#Inserir a main dentro acima dessas duas funções



def carrega_lista(lista):
    for i in range(0,10):
        lista.append(int(input("Digite um número: ")))
    return lista
lista = []
carrega_lista(lista)

def find_max(lista):
    return max(lista)

minha_lista = carrega_lista(lista)
maior_elemento = find_max(lista)
print("O maior elemento da lista é:", maior_elemento)