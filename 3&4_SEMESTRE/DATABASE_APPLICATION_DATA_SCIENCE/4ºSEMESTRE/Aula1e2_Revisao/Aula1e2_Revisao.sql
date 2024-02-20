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

create table produto(
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
END;
        