-=-=-=-=-=-=-=-=-=-=-=-=-=-=
Exercícios:

1.Validação de Dados Antes da Inserção:
   Crie um gatilho BEFORE INSERT FOR EACH ROW que valide se o salário de um novo
   funcionário está dentro de um intervalo específico, por exemplo, entre 1000 e 10000
   unidades monetárias.

2. Auditoria de Alterações:
   Implemente um gatilho AFTER INSERT OR UPDATE OR DELETE FOR EACH ROW que registre todas as alterações feitas em uma tabela de funcionários em uma tabela de auditoria, incluindo a data da alteração e o tipo de operação (inserção, atualização ou exclusão).

3. Cálculo de Valores Derivados:
   Crie um gatilho BEFORE INSERT OR UPDATE FOR EACH ROW que calcule automaticamente o
   salário anual de um funcionário com base em seu salário mensal e armazene-o em uma
   coluna separada na tabela.

4. Restrição de Integridade Referencial:
   Implemente um gatilho BEFORE DELETE FOR EACH ROW que impeça a exclusão de uma linha
   em uma tabela de departamentos se ainda houver funcionários associados a esse
   departamento em outra tabela.

5. Atualização de Contadores:
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
        RAISE_APPLICATION_ERROR(-20001, 'Salário menor que 1000 ou maior que 10000! Insira um valor entre esse intervalo!');
    END IF;
END;

INSERT INTO funcionario VALUES (2, 'Leonardo', 900);