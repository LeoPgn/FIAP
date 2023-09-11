# Utilizando o conceito do número indeterminado de argumentos chave, crie uma função que imprima o nome, sobrenome e
# idade de uma pessoa desde que ela tenha mais de 20 anos. #dica use chaves pnome, psobrenome, pidade.
# OBS: o programa deve ter, obrigatoriamente, a função “main”.

def main():
        exibe_pessoa(pnome = 'joão', psobrenome = 'Silva', pidade=25)
def exibe_pessoa(**pessoa):
        if (pessoa['pidade'] > 20):
                print(f"{pessoa['pnome']} {pessoa['psobrenome']} tem {pessoa['pidade']} anos")


if (__name__ == "__main__"):
        main()