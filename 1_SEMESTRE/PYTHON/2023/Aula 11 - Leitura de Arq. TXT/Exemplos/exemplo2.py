# Escrita em um arquivo texto
# Criar o arquivo txt e disponibiliza-lo para escrita
texto = 'Sexta-feira é feriado'
with open('exemplo_texto.txt', 'w', encoding = 'UTF8') as arq:
    arq.write(texto)

# Abrir o arquivo texto e acrescentar uma linha
texto_novo = '\nDomingo comemora-se a Páscoa'
with open('exemplo_texto.txt', 'a', encoding = 'UTF8') as arq:
    arq.write(texto)