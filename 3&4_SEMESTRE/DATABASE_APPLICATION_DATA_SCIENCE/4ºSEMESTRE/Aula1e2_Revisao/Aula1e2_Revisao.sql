CREATE TABLE vendedor (
    id_vendedor      NUMBER(4) PRIMARY KEY,
    nome_vendedor    VARCHAR(30) UNIQUE NOT NULL,
    salario_vendedor NUMBER(10, 2)
);

CREATE TABLE venda (
    num_venda   NUMBER(4) PRIMARY KEY,
    dt_venda    DATE NOT NULL,
    total_venda NUMBER(10, 2) NOT NULL,
    fk_vendedor
        REFERENCES vendedor
    NOT NULL
);

CREATE TABLE produto(
cd_produto number(4) primary key,
dscr_produto varchar(30) not null unique,
);

create table ItemVenda(
fk_produto references produto not null,
fk_venda references venda not null,
qtde_produto number(10,2) not null,
total_item number(10,2) not null
);



set serveroutput on;
set  verify off;

BEGIN
    insert into vendedor (&Codigo, '&Nome', &salario);
    commit;
    dbms_output.put_line('Dados inseridos com sucesso'); 
    EXCEPTION
    WHEN dup_val_on_index THEN
        dbms_output.put_line('Código já cadastrado');
    WHEN OTHERS THEN
dbms_output.put_line('Cadastro incompleto');

end;

BEGIN
    UPDATE vendedor
    SET
        nm_vendedor = '&nome'
    WHERE
        id_vendedor = &código;

    COMMIT;
    dbms_output.put_line('Dados atualizados com sucesso');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Atualização não realizada');
END;

BEGIN
    DELETE FROM vendedor
    WHERE
        id_vendedor = &código;

    COMMIT;
    dbms_output.put_line('Dados atualizados com sucesso');
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Atualização não realizada');
END;
        