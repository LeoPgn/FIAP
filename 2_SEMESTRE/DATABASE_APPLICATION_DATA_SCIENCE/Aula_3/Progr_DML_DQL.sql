set serveroutput on

declare
    V_N NUMBER(2) := 15;
begin
    if mod(v_n,2)=0 then dbms_output.put_line('O n�mero '||v_n||' � par');
    else
    dbms_output.put_line('O n�mero '||v_n||' � �mpar');
    end if;
end;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Exercicio 1:
Exerc�cio estrutura de decis�o: Criar um bloco PL/Sql para analisar a entrada de dados do sexo de um cliente, o bloco dever� receber 
o dado sobre o sexo: para masculino � M ou m, para feminino -  F ou f, qualquer dado fora desta configura��o dever� ser exibido �Outros�, 
para M ou m �Masculino�, para F ou f �Feminino�.

set verify off;
declare
    sexo char(1) := '&sexo';
begin 
    if (sexo)='M' then dbms_output.put_line('O sexo � MASCULINO');
    elsif (sexo)='F' then dbms_output.put_line('O sexo � FEMININO');
    else dbms_output.put_line('O sexo n�o deseja ser especificado');
    end if;
end;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Exercicio 2:

Criar um bloco PL-SQL para calcular o valor de cada parcela de uma compra de um carro, nas seguintes condi��es:
- Parcelas para aquisi��o em 6 pagamentos.
- Parcelas para aquisi��o em 12 pagamentos.
- Parcelas para aquisi��o em 18 pagamentos.
OBS:
1 - Devera ser dada uma entrada de 20% do valor da compra.
2 - Devera ser aplicada uma taxa de juros, no saldo restante, nas seguintes condi��es:
3 - No final informar o valor das parcelas para as 3 formas de pagamento, com o valor de aquisi��o de 10.000 e o mesmo com entrada de dados via
teclado( em tempo de execu��o).
A - Pagamento de 6 parcelas: 10%.
B - Pagamento de 12 parcelas: 15%.
C - Pagamento de 18 parcelas: 20%. 

declare 
    v_carro number(10,2) := 50000*0.8;
    v_presta v_carro%type;
    n_parcelas number(2) := &valor;
begin
    if n_parcelas = 6 then
    v_presta :=(v_carro*1.1)/6;
    dbms_output.put_line('Valor da presta��o em 6x:'||v_presta);
    elsif n_parcelas = 12 then
    v_presta :=(v_carro*1.15)/12;
    dbms_output.put_line('Valor da presta��o em 12x:'||v_presta);
    elsif n_parcelas = 18 then
    v_presta :=(v_carro*1.2)/18;
    dbms_output.put_line('Valor da presta��o em 18x:'||v_presta);
    else
    dbms_output.put_line('Valor de descontos indispon�vel para a quantidade de parcelas desejada');
    end if;
end;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Instru��es DML e DQL no bloco (Unindo banco com opera��es) -  21/08/2023

create table Aluno(
ra varchar2(5) primary key,
nome varchar(50));

desc aluno;
delete from aluno;
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Usando bloco de c�digo para fazer os inserts de uma vez:

begin
    insert into aluno values('12345', 'Antonio Alves');
    insert into aluno values('54321', 'Beatriz Bernardes');
    insert into aluno values('12354', 'Claudio Cardoso');
    insert into aluno values('96562', 'Leonardo Paganini');
end;
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Usando bloco de c�digo para select:

declare
    v_ra varchar2(5):='12354';
    v_nome varchar2(50);
begin
    select nome into v_nome from aluno where ra = v_ra;
    dbms_output.put_line('O nome do aluno �: '||v_nome);
end;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Inserindo dados na tabela com bloco de codigo:

declare
    v_ra varchar2(5):='98765';
    v_nome varchar2(50):= 'Gabriel Dorales';
begin
    insert into aluno (RA,NOME) values (v_ra, v_nome);
end;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Realizando update na tabela com bloco de c�digo:

declare
    v_ra varchar2(9) := '16285';
    v_nome varchar2(50) := 'Antonio Rodrigues';
begin
    update aluno set nome = v_nome where ra = v_ra;
end;

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Realizando delete na tabela com bloco de c�digo:

declare 
    v_ra varchar2(5) := '12345';
begin
    delete from aluno where ra = v_ra;
end;

select * from aluno