def calcular_ipva(nome, marca, quilometragem, tempo_fabricacao, valor):
    if tempo_fabricacao < 20:
        ipva = valor * 0.04
        return f"O carro {nome} da marca {marca} fabricado há {tempo_fabricacao} anos, com {quilometragem} km rodados, tem um valor de IPVA de R${ipva:.2f}."
    else:
        return f"O carro {nome} da marca {marca} fabricado há {tempo_fabricacao} anos, com {quilometragem} km rodados, está isento do IPVA."

def main():
    carro1 = {"nome": "Gol", "marca": "Volkswagen", "quilometragem": 50000, "tempo_fabricacao": 5, "valor": 30000}
    carro2 = {"nome": "Civic", "marca": "Honda", "quilometragem": 80000, "tempo_fabricacao": 15, "valor": 80000}
    carro3 = {"nome": "Fiesta", "marca": "Ford", "quilometragem": 100000, "tempo_fabricacao": 25, "valor": 20000}
    carro4 = {"nome": "Corolla", "marca": "Toyota", "quilometragem": 60000, "tempo_fabricacao": 18, "valor": 100000}
    carro5 = {"nome": "Onix", "marca": "Chevrolet", "quilometragem": 20000, "tempo_fabricacao": 2, "valor": 50000}

    carros = [carro1, carro2, carro3, carro4, carro5]

    for carro in carros:
        print(calcular_ipva(**carro))

if __name__ == '__main__':
    main()