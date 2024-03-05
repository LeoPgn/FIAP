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

    -- Inserindo dados na tabela de funcion�rio
    INSERT INTO funcionario (id_funcionario, nome_funcionario, id_departamento, salario_atual) VALUES (&id_funcionario, '&nome_funcionario', &id_departamento, &salario_atual);
    INSERT INTO funcionario (id_funcionario, nome_funcionario, id_departamento, salario_atual) VALUES (&id_funcionario, '&nome_funcionario', &id_departamento, &salario_atual);

    -- Inserindo dados na tabela de sal�rios usando o ID gerado pela sequ�ncia
    INSERT INTO salario (id_salario, id_funcionario, data_alteracao, salario_anterior, novo_salario)
    VALUES (seq_salario.nextval, v_id_funcionario, SYSDATE, &salario_anterior, &novo_salario);
    
    INSERT INTO salario (id_salario, id_funcionario, data_alteracao, salario_anterior, novo_salario)
    VALUES (seq_salario.nextval, v_id_funcionario, SYSDATE, &salario_anterior, &novo_salario);

    DBMS_OUTPUT.PUT_LINE('Dados inseridos com sucesso.');
END;
/

-- Criando a fun��o calcular_novo_salario
CREATE OR REPLACE FUNCTION calcular_novo_salario(
    p_id_funcionario IN funcionario.id_funcionario%TYPE,
    p_percentual_aumento IN NUMBER
) RETURN NUMBER
IS
    v_salario_atual funcionario.salario_atual%TYPE;
    v_novo_salario NUMBER;
BEGIN
    -- Obtendo o sal�rio atual do funcion�rio
    SELECT salario_atual INTO v_salario_atual
    FROM funcionario
    WHERE id_funcionario = p_id_funcionario;

    -- Calculando o novo sal�rio com base no aumento percentual
    v_novo_salario := v_salario_atual + (v_salario_atual * p_percentual_aumento / 100);

    RETURN v_novo_salario;
END calcular_novo_salario;
/

-- Executando a fun��o calcular_novo_salario para o funcion�rio com ID 1
DECLARE
    v_id_funcionario funcionario.id_funcionario%TYPE := 1;
    v_percentual_aumento NUMBER := 10; -- Exemplo de percentual de aumento
    v_novo_salario NUMBER;
BEGIN
    -- Chamar a fun��o calcular_novo_salario
    v_novo_salario := calcular_novo_salario(v_id_funcionario, v_percentual_aumento);

    -- Exibir o novo sal�rio
    DBMS_OUTPUT.PUT_LINE('Novo sal�rio para o funcion�rio com ID ' || v_id_funcionario || ': ' || v_novo_salario);
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
    -- Abrindo o cursor para recuperar os dados dos funcion�rios
    OPEN c_funcionarios;
    
    -- Loop para exibir os dados de cada funcion�rio
    LOOP
        FETCH c_funcionarios INTO v_nome_funcionario, v_salario_anterior, v_novo_salario;
        EXIT WHEN c_funcionarios%NOTFOUND;
        
        -- Exibir os dados do funcion�rio
        DBMS_OUTPUT.PUT_LINE('Funcion�rio: ' || v_nome_funcionario || ', Sal�rio Anterior: ' || v_salario_anterior || ', Novo Sal�rio: ' || v_novo_salario);
    END LOOP;
    
    -- Fechando o cursor
    CLOSE c_funcionarios;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao exibir os sal�rios dos funcion�rios.');
END exibir_salarios;
/