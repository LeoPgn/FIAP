let lampadaLigar = document.getElementById('lampadaLigar');

let lampada = document.getElementById('lampada');

let lampadaDesligar = document.getElementById('lampadaDesligar');

lampadaLigar.addEventListener('click', ligarLampada);
lampadaDesligar.addEventListener('click', desligarLampada);
lampadaQuebrada.addEventListener('dblclick', lampadaQuebrada);

function ligarLampada (){
    lampada.src = "img/ligada.jpg";
}

function desligarLampada(){
    lampada.src = "img/desligada.jpg";
}

function lampadaQuebrada(){
    lampada.src = "img/quebrada.jpg";
}

lampada.addEventListener('mouseover',ligarLampada);
lampada.addEventListener('mouseleave',desligarLampada);