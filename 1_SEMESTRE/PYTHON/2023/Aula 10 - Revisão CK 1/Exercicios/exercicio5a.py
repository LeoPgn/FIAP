lista_precos = [250, 350.32, 400.50, 730.45, 1000]
lista_qtdes = [10, 4, 6, 2, 1]
lista_desc = [0.04, 0.12, 0.30, 0.40, 0.50]

lista_precos_finais = list(map(lambda preco, qtde, desc :  (preco * qtde) - ((preco * qtde)*desc),lista_precos,lista_qtdes,lista_desc))
print(lista_precos_finais)

