alunos = {}

for c in range(0,2):
    nome = input('Nome: ')
    turno = input('Turno: ')
    idade = int(input('Idade: '))
    peso = float(input('Peso: '))
    altura = float(input('Altura: '))

    imc = peso / altura**2
    alunos[nome] = {'nome': nome, 'turno': turno, 'idade': idade,
                    'peso': peso, 'altura': altura}

for chave, subdic in alunos.items():
    if (subdic ['imc'] > 24.9):
        print(alunos[chave])