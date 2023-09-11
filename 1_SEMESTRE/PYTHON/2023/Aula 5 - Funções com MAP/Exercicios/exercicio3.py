#Dada as listas abaixo, faça uma função que calcule o preço final de cada item dado os descontos para cada um deles.
# OBS: o programa deve ter, obrigatoriamente, a função “main”.

# listaOriginal = [234, 64, 13467, 45.89, 23]
# listaDescontos = [0.3, 0.004, 0.5, 0.03, 0.8

def main():
        lista_precos = [300, 250.30, 150, 400.20, 730.10]
        lista_descontos = [0.30,0.4,0.08,0.10,0.20]
        print('=-=-=-=-=-- Função sem o uso do MAP -=-=-=-=-=-=')
        lista_preco_descontos = calcula_desconto(lista_precos, lista_descontos)
        print(lista_preco_descontos)
        print('=-=-=-=-=-=-- Função com o uso do MAP -=-=-=-=-=')
        lista_preco_descontos = list(map(calcula_desconto_simples, lista_precos, lista_preco_descontos))
        print(lista_preco_descontos)


        # Função sem o uso do MAP
def calcula_desconto(lista_precos, lista_descontos):
        lista_precos_descontos = []
        for i in range(0, len(lista_precos)):
                lista_descontos.append(lista_precos[i] - (lista_precos[i] * lista_descontos[i]))
        return (lista_precos_descontos)

        # Função com o uso de MAP
def calcula_desconto_simples(preco, desc):
        preco_desconto = preco - (preco * desc)
        return (preco_desconto)




















if (__name__ == "__main__"):
        main()