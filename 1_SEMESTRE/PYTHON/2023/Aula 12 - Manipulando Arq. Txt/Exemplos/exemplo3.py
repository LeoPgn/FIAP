import json

with open("aluno_pedro.json", "w") as arq:
    linha = {'nome': 'Pedro', 'idade': 20, 'altura': 1.80}
    json.dump(linha,arq,indent='\t',separators=(',',':'))