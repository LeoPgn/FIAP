
import sys # primeira coisa que precisa fazer quando se usa argumentos, importar a biblioteca

def main():
    if (len(sys.argv)==3): #Usamos quatro argumentos pois o primeiro é SEMPRE A BIBLIOTECA QUE BAIXAMOS (import sys)
        opc = int(sys.argv[1]) #Criamos uma váriável para movimentá-la a partir da 1, pois a 0 é a biblioteca
        tam = int(sys.argv[2])

        if (opc == 1):
            lista = []
            carrega_lista(lista,tam)
        elif (opc == 2):
             lista == []
             carrega_lista(lista,tam)
             print("Lista - triplo: ", calcula_triplo(lista,tam))
        elif (opc == 3):
            lista == []
            carrega_lista(lista, tam)
            exibe_pares(lista,tam)
        else:
            print("Opção inválida")


def carrega_lista(lista,tam):
    for i in range (0, tam):
        lista.append(int(input("Digite o elemento da lista: ")))

def calcula_triplo (lista, tam):
    lista_triplo = []
    for i in range (0, tam):
        lista_triplo.append(lista[i] * 3)
    return (lista_triplo)

def exibe_pares(lista, tam):
    for i in range(0, tam):
        if (lista[i] % 2 == 0):
            print(lista[i])


