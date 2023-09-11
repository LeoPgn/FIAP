import sys # primeira coisa que precisa fazer quando se usa argumentos, importar a biblioteca

def main():
    if (len(sys.argv)==4): #Usamos quatro argumentos pois o primeiro é SEMPRE A BIBLIOTECA QUE BAIXAMOS (import sys)
        opc = int(sys.argv[1]) #Criamos uma váriável para movimentá-la a partir da 1, pois a 0 é a biblioteca
        x = int(sys.argv[2])
        y = int(sys.argv[3])

        if (opc ==1):
            print("Menor número: ", retorna_menor(x, y))
        elif (opc ==2):
            print("Multiplicação: ", calcula_mult(x, y))
        elif (opc == 3):
            exibe_numeros(x, y)
        else:
            print("Opção inválida")


def retorna_menor(x, y):
    if (x < y):
        return (x)
    else:
        return (y)

def calcula_mult (x, y):
    mult = x * y
    return (mult)

def exibe_numeros (x,y):
    #y é o inicio e x é o fim
    if (x > y):
        cont = y
        while (cont <= x):
            print(cont)
            cont+=1
    else:
        print("Não é possível exibir os números!")

if (__name__ == "__main__"):
        main()