def main():
    exibe_produto(descr = "Caneta", qtde = 250, valor = 1.50)
    exibe_bonus (1000, "João", "Pedro", "Maria", "Antônio")

def exibe_produto (**dados_produto):
    if (dados_produto['qtde'] > 100):
        print(f"Descricao do produto: {dados_produto['descr']}")
        print(f"Quantidade do produto: {dados_produto['qtde']}")
        print(f"Valor do produto: R${dados_produto['valor']:.2f}")

def exibe_bonus (valor_bonus, *nomes_func):
    for func in nomes_func:
        print(f"{func} - bonus: {valor_bonus:.2f}")

if (__name__ == "__main__"):
    main()