Introdu��o a linguagem SQL
DDL - Linguagem de defini��o de dados - Estrutura
Criando tabelas
Sintaxe:
    create table nome_tabela
    (nome_coluna1 tipo_dados(tamanho) [regra],
    ,,,,,,,
    nome_colunaN tipo_dados(tamanho) [regra]);
    
Tipo de dados: char(n), campo alfanum�rico de tamanho fixo
               varchar(n), campo alfanum�rico de tamanho variavel
               number(x,y), campo num�rico inteiro ou real
               date, campo tipo data
n = tamanho
x = parte inteira
y = parte real, casas decimais

Regras/Constraints
Pk - primary key, campo unico, preenchimento obrigat�rio, relacionamento
FK - foreign key, relacionamento lado n da cardinalidade, recebe dados
     previamente cadastrados na Pk
Nn - not null, campo de preenchimento obrigatorio
Uk - unique, campo com restri�ao a dados repetidos
Ck - check, campo com lista de dados para valida��o

Exemplificando

1- criando uma tabela sem regras:

create table cargo10
(cd_cargo number(3),
nm_cargo varchar2(25),
salario number(8,2));

visualizando a estrutura de uma tabela
desc nome_tabela
exemplo: desc cargo10

deletando uma tabela
drop table nome_tabela
exemplo: drop table cargo10

2- criando uma tabela com regras, sem personaliza��o:
create table cargo10
(cd_cargo number(3) primary key,
nm_cargo varchar2(25)not null unique,
salario number(8,2));

desc cargo10

visualizando constraints
select constraint_name, constraint_type from user_constraints
where table_name = 'CARGO10'

2- criando uma tabela com regras, com personaliza��o:

drop table cargo10

create table cargo10
(cd_cargo number(3) constraint cargo_cd_pk primary key,
nm_cargo varchar2(25)constraint cargo_nome_nn not null 
                     constraint cargo_nome_uk unique,
salario number(8,2));

desc cargo10

visualizando constraints
select constraint_name, constraint_type from user_constraints
where table_name = 'CARGO10'

criando o relacionamento

1 - 1 - Pk + FK_Uk
1 - N - Pk + FK
N - N - n�o existe em c�digo sql

desc cargo10
create table funcionario10
(cd_fun number(3) constraint fun_cd_pk primary key,
nm_fun varchar(30) constraint fun_nm_nn not null,
dt_adm date constraint fun_dt_nn not null,
uf_fun char(2) constraint fun_uf_nn not null,
cargo_fk number(3) constraint fun_cargo_fk references cargo)

desc funcionario10

create table funcionario11
(cd_fun number(3) constraint fun_cd_pk1 primary key,
nm_fun varchar(30) constraint fun_nm_nn1 not null,
dt_adm date constraint fun_dt_nn1 not null,
uf_fun char(2) constraint fun_uf_nn1 not null,
cargo_fk references cargo)

Cria��o das tabelas: n_fiscal e produto

15/02/2023

create table n_fiscal
(n_nf number(5) primary key,
dt_nf date not null,
total_nf number(10,2));

desc n_fiscal
select constraint_name from user_constraints where table_name = 'N_FISCAL'

desc n_fiscal

create table produto
(cd_pro number(5) constraint prod_cd_pk primary key,
nm_prod varchar2(30) constraint prod_mn_nn not null
constraint prod_nm_uk unique,
preco number(10,2))

select constraint_name from user_constraints where table_name = 'PRODUTO'

create table tem
(fk_nota number(5) constraint tem_nf_fk references n_fiscal,
fk_prod number(5) constraint tem_prod_fk references produto)

Inserindo dados
Comando DML - Data Manipulation Language
Novas linhas:
insert into nome_tabela values
(valor1, valor2,,,,,, valorN)

Obs: campos: char, varchar ou varchar2 e date precisam de ap�strofe

Exemplo 1
conhecendo ou visualizando a estrutura
desc n_fiscal
inserindo uma linha
insert into n_fiscal values (1,'10-Jan-00',5000);
insert into n_fiscal values (2,'10-dec-00',5000);
verificando a inser��o
select * from n_fiscal
descobrindo o padr�o da data
select sysdate from dual
gravando dados fisicamente
commit;

Aula 03 - 01/03/2023

Ainda trabalhando com estrutura das tabelas

DDL

Create - Ok

Alterando ou corrigindo uma estrutura
alter table nome_tabela
op��es
add column      - nova coluna
add constraint  - nova regra
modify          - modifica tipo e/ou tamanho de uma coluna
drop column     - elimina uma coluna
drop constraint - elimina uma regra

create table tb_teste
(codigo number(2),
nome number(10));

incluindo uma nova coluna
alter table tb_teste add dt_nasc date
incluindo uma coluna com regra
alter table tb_teste add cep char(8) not null
incluindo a pk na coluna codigo
alter table tb_teste add constraint pk_cod primary key (codigo)
modificando apenas o tipo de dados
alter table tb_teste modify nome varchar(10)
modificando apenas o tamanho da coluna
alter table tb_teste modify nome varchar(50)
modificando tamanho e tipo ao mesmo tempo
alter table tb_teste modify nome number(10)
eliminando uma regra
alter table tb_teste drop constraint pk_cod
desc tb_teste
desc user_constraints
select constraint_name from user_constraints where table_name = 'TB_TESTE'
eliminando uma coluna
alter table tb_teste drop column nome
renomeando uma coluna
alter table tb_teste rename column codigo to cod_cliente
renomeando uma constraint
alter table tb_teste rename constraint sys_c003509437 to fiap
eliminando uma tabela
drop table nome_tabela
drop table tb_teste

create table tb_teste1
(codigo number(1) primary key)
create table tb_teste2
(codigo number(1) references tb_teste1)
insert into tb_teste1 values(1)
insert into tb_teste2 values(1)
drop table tb_teste1 cascade constraints
uso do cascade permite eliminar o relacionamento e depois dropar a tabela

Atualizando dados

Update 

operadores: aritm�ticos: + - * / ()
            relacionais: > >= < <= = != ou <>
            l�gicos: and or not
            
update nome_tabela set nome_coluna = novo_valor

update nome_tabela set nome_coluna = novo_valor
where condi��o

drop table produto_tb

create table produto_tb
(cod_prod number(4) constraint prod_cod_pk primary key, 
unidade varchar2(3),descricao varchar2(20),val_unit number(10,2))

insert into produto_tb values (25,'KG','Queijo','0,97');
insert into produto_tb values (31,'BAR','Chocolate','0,87');
insert into produto_tb values (78,'L','Vinho','2,00');
insert into produto_tb values (22,'M','Linho','0,11');
insert into produto_tb values (30,'SAC','Acucar','0,30');
insert into produto_tb values (53,'M','Linha','1,80');
insert into produto_tb values (13,'G','Ouro','6,18');
insert into produto_tb values (45,'M','Madeira','0,25');
insert into produto_tb values (87,'M','Cano','1,97');
insert into produto_tb values (77,'M','Papel','1,05');
commit;

select * from produto_tb

atualizando os dados do pre�o do produto para R$1,00
update produto_tb set val_unit = 1

atualizando os dados do pre�o do produto para R$1,5
apenas dos produtos de unidade de medida igual a metro
update produto_tb set val_unit = 1,5
where unidade = 'M'
select * from produto_tb order by 1

atualizar em 15% o pre�o dos produtos de c�digo maior que 30,
atualizar o nome do produto queijo para queijo de minas,
para os produtos A�ucar, madeira e Linha zerar o seu pre�o,

desc produto_tb



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
AULA 08/03 - CRIAR TABLES DO EXERCICIO BAIXADO

create table filme
(CodFilme number(4) constraint cd_filme_pk primary key,
titulo varchar(70) not null);

create table categoria
(Codcateg number(4) constraint cod_cat_pk primary key, descricao varchar(50) not null);

create table dvd
(numDVD number(4) constraint num_dvd_pk primary key, tipo char(1));

create table cliente
(CodCli number(4) constraint cd_clie_pk primary key, prenome varchar(50) not null, sobrenome varchar (50),
endereco varchar(70), telefone varchar(20));

create table ator
(codator number(4) constraint cod_ator_pk primary key,
nome_popular varchar(50) not null,
nome_artistico varchar(50), datanasc date);
