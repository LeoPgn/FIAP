import sys

def main():
    if (len(sys.argv)==3):
        opc = int(sys.argv[1])
        n = int(sys.argv[2])

        if (opc == 1):
            exibe_pares (n)
        elif (opc == 2):
            print("Fatorial: ", calcula_fatorial (n))
        elif (opc == 3):
            exibe_tabuada(n)
        else:
            print("Opcao invalida")
    else:
        print("Numero de argumento invalido")


def exibe_pares (n):
    for i in range (1,n+1):
        if (i % 2 == 0):
            print(i)

def calcula_fatorial (n):
    fat = 1
    for i in range (1,n+1):
        fat = fat * i

    return(fat)

def exibe_tabuada (n):
    for i in range (0,11):
        tabuada = n * i
        print(f"{n} x {i} = {tabuada}")

if (__name__ == "__main__"):
    main()