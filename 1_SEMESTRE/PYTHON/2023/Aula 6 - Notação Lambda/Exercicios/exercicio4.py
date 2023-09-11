lista_precos = [250, 350.30, 700.25, 120, 650.87]

lista_desc = list(map(lambda preco : preco - (preco * 0.20), lista_precos))
print(lista_desc)
