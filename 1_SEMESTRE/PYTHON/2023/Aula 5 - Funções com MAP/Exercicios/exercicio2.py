# Faça uma função comum que calcule 20% de desconto para a próxima black Friday. Utilize-a numa lista que tem os preços
# dos itens que você planeja comprar. Faça isso primeiro sem MAP e depois com MAP.
# OBS: o programa deve ter, obrigatoriamente, a função “main”.

def main():
        lista_precos = [300,250.30,150,400.20,730.10]
        print('=-=-=-=-=-- Função sem o uso do MAP -=-=-=-=-=-=')
        lista_descontos = calcula_desconto (lista_precos)
        print(lista_descontos)
        print('=-=-=-=-=-=-- Função com o uso do MAP -=-=-=-=-=')
        lista_descontos = list(map(calcula_desconto_simples,lista_precos))
        print(lista_descontos)

#Função sem o uso do MAP
def calcula_desconto(lista_precos):
        lista_descontos = []
        for i in range(0, len(lista_precos)):
                lista_descontos.append(lista_precos[i] - (lista_precos[i] * 0.20))
        return (lista_descontos)

#Função com o uso de MAP
def calcula_desconto_simples(preco):
        preco_desconto = preco - (preco * 0.20)
        return (preco_desconto)


if (__name__ == "__main__"):
        main()