-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Exerc�cios:

1.Valida��o de Dados Antes da Inser��o:
   Crie um gatilho BEFORE INSERT FOR EACH ROW que valide se o sal�rio de um novo
   funcion�rio est� dentro de um intervalo espec�fico, por exemplo, entre 1000 e 10000
   unidades monet�rias.

2. Auditoria de Altera��es:
   Implemente um gatilho AFTER INSERT OR UPDATE OR DELETE FOR EACH ROW que registre todas as altera��es feitas em uma tabela de funcion�rios em uma tabela de auditoria, incluindo a data da altera��o e o tipo de opera��o (inser��o, atualiza��o ou exclus�o).

3. C�lculo de Valores Derivados:
   Crie um gatilho BEFORE INSERT OR UPDATE FOR EACH ROW que calcule automaticamente o
   sal�rio anual de um funcion�rio com base em seu sal�rio mensal e armazene-o em uma
   coluna separada na tabela.

4. Restri��o de Integridade Referencial:
   Implemente um gatilho BEFORE DELETE FOR EACH ROW que impe�a a exclus�o de uma linha
   em uma tabela de departamentos se ainda houver funcion�rios associados a esse
   departamento em outra tabela.

5. Atualiza��o de Contadores:
   Crie um gatilho AFTER INSERT FOR EACH ROW que atualize um contador de pedidos em uma
   tabela de produtos sempre que um novo pedido for inserido na tabela de pedidos,
   vinculando os produtos aos pedidos.
   
create table funcionario(
id_funcionario NUMBER(3),
nome_funcionario VARCHAR(40),
salario NUMBER(10)
);
   
CREATE OR REPLACE TRIGGER valida_salario
BEFORE INSERT ON funcionario FOR EACH ROW
BEGIN 
    IF :NEW.salario < 1000 OR :NEW.salario > 10000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Sal�rio menor que 1000 ou maior que 10000! Insira um valor entre esse intervalo!');
    END IF;
END;

INSERT INTO funcionario VALUES (2, 'Leonardo', 900);