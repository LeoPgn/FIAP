08/07/2023

Aula 1 - Blocos Anonimos
         Introdu��o a programa��o

Estrutura
Declare - opcional
begin - obrigat�ria
exception - opcional
end - obrigat�ria

-- coment�rio

ativando a sa�da de dados
1o comando a ser executado

set serveroutput on (sa�da de dados interna)

begin
     dbms_output.put_line('Bloco ok!'); 
     --(dbms significa DATA BASE MANAGEMENT SYSTEM) dizendo ao nosso software que haver� uma sa�da, 
     --por isso ele escreve put line (que � s� para ver o que escrever� antes de enviar, como um Sysou)
end;

begin
     dbms_output.put_line(12+45); 
end;

declare --utiliza para declarar as v�riaveis
    n1 number(2) := 10;
    n2 number(2) := 10; -- este dois pontos e igual := � como ==, ===
    re number(2); -- criando e utilizando uma v�riavel para utiliz�-la depois
begin
--processamento
    re := n1 + n2;
-- sa�da de dados
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
UTILIZANDO M�TODO HERAN�A
--%type faz com que eu reutilize o valor nas demais v�riaveis, � melhor para manuten��o EXEMPLO ABAIXO:
declare 
    n1 number(2) := 10;
    n2 n1%type := 20; 
    re n1%type := n1 + n2; 
-- SE EU MODIFICO A VARIAVEL N1 NESTE CASO NUMBER, AUTOMATICAMENTE AS DEMAIS UTILIZANDO %TYPE DA VAR�VEL ATUALIZAM TAMB�M
begin
    dbms_output.put_line('Resultado: '||re);
end;
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
TRABALHANDO DADOS VIA TECLADO
--UTILIZANDO UMA INPUT BOX PARA DIGITAR O VALOR QUE SER� ATRIBU�DO PARA DENTRO DAS VARI�VEIS
declare 
    n1 number(2) := &valor1;
    n2 n1%type := &valor2; 
    re n1%type := n1 + n2; 

begin
    dbms_output.put_line('Resultado: '||re);
end;