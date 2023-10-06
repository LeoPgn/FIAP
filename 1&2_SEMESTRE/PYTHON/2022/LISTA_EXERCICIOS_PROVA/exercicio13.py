pets = {}

for c in range(0,2):
    nome = input('Nome: ')
    especie = input('Espécie: ')
    raca = input('Raça: ')
    porte = input('Porte: ')
    peso = float(input('Peso: '))

    pets[nome] = {'nome': nome, 'especie': especie, 'raca': raca,
                    'porte': porte, 'peso': peso}

raca = input("Digite a raça desejada: ")

for chave, subdic in pets.items():
    if (subdic ['raca'] == raca and subdic['peso'] > 4):
        print(pets[chave])