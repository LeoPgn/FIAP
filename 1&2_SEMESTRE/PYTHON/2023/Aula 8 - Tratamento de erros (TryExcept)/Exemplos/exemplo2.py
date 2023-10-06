# Usaremos isso na entregavel 3 de python no challenge, validando os dados antes de chegar no insert do banco,
# o professor já comentou que não irá chegar em banco ainda, mas a validação será em uma lista

try:
    num1 = int(input("Digite um número: "))
    num2 = int(input("Digite outro número: "))
    divisao = num1 / num2
except ValueError:
    print("Digite um valor numérico")
except ZeroDivisionError:
    print("Não podemos dividir por zero, insira um valor maior")
# Podemos usar um else também para retornar e também para armazenar o valor caso ele tenha sido aceito no try
else:
    print(f"Divisão: {divisao: .2f}")
# usamos o finally para finalizar a estrutura do try
finally:
    print('Try finalizado')


#print(f'Divisão: {divisao: .2f}')