def main():
    exibe_pares(10)
    print("Fatorial: ", calcula_fatorial (5))
    exibe_tabuada(8)

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