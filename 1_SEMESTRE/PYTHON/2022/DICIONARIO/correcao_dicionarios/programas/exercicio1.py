alunos = {}

for i in range (0,15):
    nome = input("Nome: ")
    disc = input("Disciplina: ")
    curso = input("Curso: ")
    faltas = int(input("Faltas: "))
    checks = []
    for j in range (0,3):
        checks.append(float(input("Checkpoint: ")))
    alunos[nome] = {
        'nome': nome, 'disciplina': disc, 'curso': curso,
        'faltas': faltas, 'checkpoints':checks}

print(alunos)
