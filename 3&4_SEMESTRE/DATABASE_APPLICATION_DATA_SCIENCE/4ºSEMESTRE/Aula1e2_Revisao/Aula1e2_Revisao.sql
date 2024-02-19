create table vendedor(
id_vendedor number(4) primary key,
nome_vendedor varchar(30) unique not null,
salario_vendedor number(10,2)
);

create table venda(
num_venda number(4) primary key,
dt_venda date not null,
total_venda number(10,2) not null,
fk_vendedor references vendedor not null
);

create table 



set serveroutput on;

BEGIN
    insert into vendedor (&Codigo, '&Nome', &salario);
    commit;
    dbms_output.put_line('Dados inseridos com sucesso');
    exception
        when dup_val_on_index then 
            dbms_output.put_line('Código já cadastrado');
        when others then
            dbms_output.put_line('Cadastro incompleto');
END;
        