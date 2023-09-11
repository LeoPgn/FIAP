#uma função que necessite de três parâmetros (números reais) e que retorne a soma desses três parâmetros.


def numeros_reais (num1, num2, num3):
    soma = num1 + num2 + num3
    return soma

num1 = int(input("Digite o numero 1: "))
num2 = int(input("Digite o numero 2: "))
num3 = int(input("Digite o numero 3: "))

soma_total = numeros_reais(num1, num2, num3)
print("A soma dos três numeros é de: ", soma_total)