


let numeroSorteado = 0;
let imgDado = document.getElementById('imgDado');
let btnSortear = document.getElementById('#btnSortear');

let sorteado = document.getElementById('')















// FUNCAO que gera numero randomico inteiro
// incluindo o minimo e o maximo
function getRandomInt(min, max) {
    min = Math.ceil(min)  // arredonda para cima  ceil  = teto
    max = Math.floor(max) // arredonda para baixo floor = piso
    return Math.floor(Math.random() * (max - min + 1)) + min
}