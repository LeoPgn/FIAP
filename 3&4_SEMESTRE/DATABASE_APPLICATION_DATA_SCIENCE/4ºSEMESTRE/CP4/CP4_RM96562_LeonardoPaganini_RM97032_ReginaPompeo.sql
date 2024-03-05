Checkpoint 1 - DataBase 04/03/2024
REGINA POMPEO - RM97032
LEONARDO PAGANINI - RM96562

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


SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
    v_id_departamento departamento.id_departamento%TYPE;
    v_id_funcionario funcionario.id_funcionario%TYPE;
    v_id_salario salario.id_salario%TYPE;
BEGIN
    -- Inserindo dados na tabela de departamento
    INSERT INTO departamento (id_departamento, nome_departamento) VALUES (&id_departamento, '&nome_departamento');
    INSERT INTO departamento (id_departamento, nome_departamento) VALUES (&id_departamento, '&nome_departamento');

    -- Inserindo dados na tabela de funcionário
    INSERT INTO funcionario (id_funcionario, nome_funcionario, id_departamento, salario_atual) VALUES (&id_funcionario, '&nome_funcionario', &id_departamento, &salario_atual);
    INSERT INTO funcionario (id_funcionario, nome_funcionario, id_departamento, salario_atual) VALUES (&id_funcionario, '&nome_funcionario', &id_departamento, &salario_atual);

    -- Inserindo dados na tabela de salários usando o ID gerado pela sequência
    INSERT INTO salario (id_salario, id_funcionario, data_alteracao, salario_anterior, novo_salario)
    VALUES (seq_salario.nextval, v_id_funcionario, SYSDATE, &salario_anterior, &novo_salario);
    
    INSERT INTO salario (id_salario, id_funcionario, data_alteracao, salario_anterior, novo_salario)
    VALUES (seq_salario.nextval, v_id_funcionario, SYSDATE, &salario_anterior, &novo_salario);

    DBMS_OUTPUT.PUT_LINE('Dados inseridos com sucesso.');
END;
/

-- Criando a função calcular_novo_salario
CREATE OR REPLACE FUNCTION calcular_novo_salario(
    p_id_funcionario IN funcionario.id_funcionario%TYPE,
    p_percentual_aumento IN NUMBER
) RETURN NUMBER
IS
    v_salario_atual funcionario.salario_atual%TYPE;
    v_novo_salario NUMBER;
BEGIN
    -- Obtendo o salário atual do funcionário
    SELECT salario_atual INTO v_salario_atual
    FROM funcionario
    WHERE id_funcionario = p_id_funcionario;

    -- Calculando o novo salário com base no aumento percentual
    v_novo_salario := v_salario_atual + (v_salario_atual * p_percentual_aumento / 100);

    RETURN v_novo_salario;
END calcular_novo_salario;
/

-- Executando a função calcular_novo_salario para o funcionário com ID 1
DECLARE
    v_id_funcionario funcionario.id_funcionario%TYPE := 1;
    v_percentual_aumento NUMBER := 10; -- Exemplo de percentual de aumento
    v_novo_salario NUMBER;
BEGIN
    -- Chamar a função calcular_novo_salario
    v_novo_salario := calcular_novo_salario(v_id_funcionario, v_percentual_aumento);

    -- Exibir o novo salário
    DBMS_OUTPUT.PUT_LINE('Novo salário para o funcionário com ID ' || v_id_funcionario || ': ' || v_novo_salario);
END;
/

-- Criando o procedimento exibir_salarios
CREATE OR REPLACE PROCEDURE exibir_salarios AS
    CURSOR c_funcionarios IS
        SELECT f.nome_funcionario, s.salario_anterior, s.novo_salario
        FROM funcionario f
        JOIN salario s ON f.id_funcionario = s.id_funcionario;

    v_nome_funcionario funcionario.nome_funcionario%TYPE;
    v_salario_anterior salario.salario_anterior%TYPE;
    v_novo_salario salario.novo_salario%TYPE;
BEGIN
    -- Abrindo o cursor para recuperar os dados dos funcionários
    OPEN c_funcionarios;
    
    -- Loop para exibir os dados de cada funcionário
    LOOP
        FETCH c_funcionarios INTO v_nome_funcionario, v_salario_anterior, v_novo_salario;
        EXIT WHEN c_funcionarios%NOTFOUND;
        
        -- Exibir os dados do funcionário
        DBMS_OUTPUT.PUT_LINE('Funcionário: ' || v_nome_funcionario || ', Salário Anterior: ' || v_salario_anterior || ', Novo Salário: ' || v_novo_salario);
    END LOOP;
    
    -- Fechando o cursor
    CLOSE c_funcionarios;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao exibir os salários dos funcionários.');
END exibir_salarios;
/