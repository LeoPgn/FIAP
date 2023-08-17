console.log('Teste de retorno no console') //apresentar como teste e retornar o resultado no console

//JS NÃO É UMA LINGUAGEM TIPADA, SENDO ASSIM, 
//O QUE QUISERMOS ARMAZENAR DENTRO DE UMA VARIAVEL, SERÁ ARMAZENADO

var num = 1;
var texto = 'Variável de texto =D'
var boolean = true;

console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')
console.log(num)
console.log(texto)
console.log(boolean)
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Ao colocarmos +, estaremos apenas concatenando os valores das variáveis

console.log(num + texto)
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Valores boolean tem como padrão 1, sendo true = 1, sendo false = 0. Exemplo:
console.log(1 - boolean)
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Neste caso abaixo, ele apresenta o erro "NAN", NOT A NUMBER!!  
console.log('Resultado: ' + 1 - boolean)
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Utilizando objetos
console.log({} + 1 + boolean)
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Formas de declarar variáveis

var num = 1 //utilizamos facilmente, mas se usarmos mais de uma vez, perdemos o valor
let text = 'texto de fora' //não podemos sobrescrever o valor e/ou reutilizar o mesmo nome da variável em outro lugar.
const verdadeiro = true; //Não e reutilizavel e nem alteravel, caso tente alterar o valor, dará erro
console.log(verdadeiro)   //Print da const fora do escopo
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Criando escopos para valores específicos

console.log(text)
{   
    const verdadeiro = false;
    console.log(verdadeiro)
    let text = 'Texto de dentro do escopo'
    console.log(text)
}
console.log(text)
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Agora criaremos uma função, e após cria-la, iremos atribuir os parâmetros
//Funções servem para reutilizar várias vezes
{
    function soma(a, b){
        console.log(a + b)
    }
    soma(5, 5)
    soma(20, '_Joaquin')
}
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Podemos utilizar um RETURN para retornar um valor especificado na função
function somando(a, b){
    return a - b
}
console.log(somando(5, 2))
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Utilizar uma função dentro do escopo e utilizar a mesma função, com o mesmo nome, causa um erro "undefined". 
//O correto, é NUNCA criar funções com o mesmo nome, pois ele tenta executar a função 2x e uma delas (que está
//dentro do escopo) não está exportando os valores das variáveis. Exemplo:

{
    function testeUndefined(a, b){
        return a + b
    }
    console.log(text + testeUndefined(5, 7))
}

function testeUndefined(a, b){
    return a + b
}
console.log(text + testeUndefined(5, 7))
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Temos dois tipos de funções!! ARROW FUNCTION/ Função Anônima e a função padrão no código acima!
//Ela deixa o código mais limpo. Exemplo:

const print = _ => {
    console.log("Leo")
}
print()
console.log('-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')

//Outra dica é utilizar virgula no lugar do sum (+) para concatenar
const teste = (a, b, c, d) => {
    console.log(a, b, c, d, `minha string é ${true} assim`)
}
teste(1, 2, 3, 4)
//Usamos ${} para concatenar os os valor com a string