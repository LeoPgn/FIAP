

CREATE OR REPLACE PACKAGE teste1
AS
disciplina VARCHAR2(20) :='DB Application';
unidade VARCHAR2(30) :='FIAP - Paulista - Noite';
END teste1;

DECLARE
concatena VARCHAR2(100);
BEGIN
concatena := teste1.disciplina || ', on FIAP';
dbms_output.put_line(concatena);
END;



drop table emp cascade constraints;
create table emp (empno number(3),
                  sal number(8,2));
insert into emp values (1,1000);



CREATE OR REPLACE PACKAGE rh
as
    FUNCTION descobrir_salario (p_id IN emp.empno%TYPE)
        RETURN NUMBER;
    PROCEDURE reajuste(v_codigo_emp IN emp.empno%type,
                   v_porcentagem IN number DEFAULT 25);
END rh;




CREATE OR REPLACE PACKAGE BODY rh
AS
    FUNCTION descobrir_salario(p_id IN emp.empno%TYPE)
        RETURN NUMBER
        IS
            v_salario emp.sal%TYPE := 0;
        BEGIN
            SELECT sal INTO v_salario FROM emp WHERE empno = p_id;
            RETURN v_salario;
        END descobrir_salario;

    PROCEDURE reajuste(v_codigo_emp IN emp.empno%type,
                   v_porcentagem IN number DEFAULT 25)
    IS
    BEGIN
        UPDATE emp SET sal = sal + (sal *( v_porcentagem / 100 ) )
        where empno = v_codigo_emp;
    COMMIT;
    END reajuste;
END rh;




DECLARE
    v_sal NUMBER(8,2);
BEGIN
    v_sal := rh.descobrir_salario(1);
    DBMS_OUTPUT.PUT_LINE(v_sal);
END;




select * from emp;




SELECT rh.descobrir_salario(1)FROM dual;




DECLARE
    v_sal NUMBER(8,2);
BEGIN
-- chamando a função
    v_sal := rh.descobrir_salario(1);
    DBMS_OUTPUT.PUT_LINE ('Salario atual - ' || v_sal);
--chamando o procedimento
    rh.reajuste(1);
    v_sal := rh.descobrir_salario(1);
    DBMS_OUTPUT.PUT_LINE ('Salario atualizado - ' || v_sal);
END;