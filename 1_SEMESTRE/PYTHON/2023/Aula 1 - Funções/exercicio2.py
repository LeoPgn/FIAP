#uma função chamada somaImposto, que possua dois parâmetros: taxaImposto, que é a quantia de imposto
# sobre vendas expressa em porcentagem e custo, que é o custo de um item antes do imposto.
# A função “altera” o valor de custo para incluir o imposto sobre vendas.

def somaImposto (taxaImposto, custo):
    novo_custo = custo + (custo*(taxaImposto / 100))
    return (novo_custo)

custo = 100
taxaImposto = 20

print ("Valor total do produto: ", somaImposto(taxaImposto, custo))