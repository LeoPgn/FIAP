08/07/2023

Aula 1 - Blocos Anonimos
         Introdução a programação

Estrutura
Declare - opcional
begin - obrigatória
exception - opcional
end - obrigatória

-- comentário

ativando a saída de dados
1o comando a ser executado

set serveroutput on (saída de dados interna)

begin
     dbms_output.put_line('Bloco ok!'); 
     --(dbms significa DATA BASE MANAGEMENT SYSTEM) dizendo ao nosso software que haverá uma saída, 
     --por isso ele escreve put line (que é só para ver o que escreverá antes de enviar, como um Sysou)
end;

begin
     dbms_output.put_line(12+45); 
end;

declare --utiliza para declarar as váriaveis
    n1 number(2) := 10;
    n2 number(2) := 10; -- este dois pontos e igual := é como ==, ===
    re number(2); -- criando e utilizando uma váriavel para utilizá-la depois
begin
--processamento
    re := n1 + n2;
-- saída de dados
    dbms_output.put_line('Resultado: '||re);
-- finalizando
end;
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
UTILIZANDO OUTRA FORMA QUE OTIMIZA PROCESSAMENTO:

declare 
    n1 number(2) := 10;
    n2 number(2) := 10; 
    re number(2) := n1 + n2; 
begin
    dbms_output.put_line('Resultado: '||re);
end;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
UTILIZANDO MÉTODO HERANÇA
--%type faz com que eu reutilize o valor nas demais váriaveis, é melhor para manutenção EXEMPLO ABAIXO:
declare 
    n1 number(2) := 10;
    n2 n1%type := 20; 
    re n1%type := n1 + n2; 
-- SE EU MODIFICO A VARIAVEL N1 NESTE CASO NUMBER, AUTOMATICAMENTE AS DEMAIS UTILIZANDO %TYPE DA VARÁVEL ATUALIZAM TAMBÉM
begin
    dbms_output.put_line('Resultado: '||re);
end;
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
TRABALHANDO DADOS VIA TECLADO
--UTILIZANDO UMA INPUT BOX PARA DIGITAR O VALOR QUE SERÁ ATRIBUÍDO PARA DENTRO DAS VARIÁVEIS
declare 
    n1 number(2) := &valor1;
    n2 n1%type := &valor2; 
    re n1%type := n1 + n2; 

begin
    dbms_output.put_line('Resultado: '||re);
end;