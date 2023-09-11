#Estamos aprendendo como chamar uma função main para chamar outras funções já criadas.
#Servem para estrutura organizada de código apenas

def main ():
    #chamada das demais funções
    exibe_mensagem()
    x = 10
    y = 5
    print(soma_numeros(x,y))

def exibe_mensagem():
    print("Eai! Beleza? Se liga nessa soma: ")

def soma_numeros (x,y):
    soma = x + y
    return soma

if __name__ == "__main__":
    main()