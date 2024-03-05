Checkpoint 1 - DataBase 04/03/2024
REGINA POMPEO - RM97032
LEONARDO PAGANINI - RM96562

-- PARA INICIAR, RODE O CÓDIGO DA LINHA 7 ATÉ A LINHA 30

drop table departamento cascade constraints;
CREATE TABLE departamento (
id_departamento NUMBER PRIMARY KEY,
nome_departamento VARCHAR2(50)
);

drop table funcionario cascade constraints;
CREATE TABLE funcionario (
id_funcionario NUMBER PRIMARY KEY,
nome_funcionario VARCHAR2(50),
id_departamento NUMBER,
salario_atual NUMBER,
FOREIGN KEY (id_departamento) REFERENCES departamento (id_departamento)
);

drop table salario cascade constraints;
CREATE TABLE salario (
id_salario NUMBER PRIMARY KEY,
id_funcionario NUMBER,
data_alteracao DATE,
salario_anterior NUMBER,
novo_salario NUMBER,
FOREIGN KEY (id_funcionario) REFERENCES funcionario (id_funcionario)
);

-- INICIANDO OS INSERTS NAS TABELAS

SET SERVEROUTPUT ON;
SET VERIFY OFF;
DECLARE
    v_id_departamento departamento.id_departamento%TYPE;
BEGIN
    INSERT INTO departamento (id_departamento, nome_departamento) VALUES (1, 'Tecnologia da Informação');
    INSERT INTO departamento (id_departamento, nome_departamento) VALUES (2, 'Financeiro');
    
    INSERT INTO funcionario (id_funcionario, nome_funcionario, id_departamento, salario_atual) VALUES (1, 'Amanda', 1, 7000);
    INSERT INTO funcionario (id_funcionario, nome_funcionario, id_departamento, salario_atual) VALUES (2, 'Bruno', 2, 6000);
    INSERT INTO funcionario (id_funcionario, nome_funcionario, id_departamento, salario_atual) VALUES (3, 'Carlos', 1, 9000);
    
    INSERT INTO salario (id_salario, id_funcionario, data_alteracao, salario_anterior, novo_salario) VALUES (1, 1, SYSDATE, 3000, 0);
    INSERT INTO salario (id_salario, id_funcionario, data_alteracao, salario_anterior, novo_salario) VALUES (2, 2, SYSDATE, 3500, 0);
    INSERT INTO salario (id_salario, id_funcionario, data_alteracao, salario_anterior, novo_salario) VALUES (3, 3, SYSDATE, 4000, 0);
END;
/

-- FUNCAO DE CALCULAR NOVO SALARIO

CREATE OR REPLACE FUNCTION calcular_novo_salario(
p_id_funcionario IN NUMBER, p_percentual_aumento IN NUMBER) RETURN NUMBER AS
    v_salario_atual salario.salario_anterior%TYPE;
    v_novo_salario salario.novo_salario%TYPE;
BEGIN
    SELECT salario_anterior INTO v_salario_atual FROM salario WHERE id_funcionario = p_id_funcionario;
        v_novo_salario := v_salario_atual * (1 + (p_percentual_aumento / 100));
    RETURN v_novo_salario;
END;
/

-- PROCEDURE DE EXIBIR OS SALARIOS DE TODOS OS FUNCIONARIOS
