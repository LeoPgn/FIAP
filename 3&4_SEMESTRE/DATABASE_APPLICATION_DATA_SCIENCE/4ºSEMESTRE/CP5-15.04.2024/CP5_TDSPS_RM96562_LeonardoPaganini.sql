--Checkpoint 5 - 2TDSPS - RM96562, Leonardo Paganini

/*
 Instruções
Projeto: Compra de músicas online
Tabelas:
usuario - id_usuario, nome_usuario
musica - id_musica, titulo_musica
compra - id_compra, data_compra, total_compra, id_usuario
item_compra - id_compra, id_musica
ctr_Preco: id_musica, preco_antigo, preco_novo

- Alimentar as tabelas: usuario, musica, ctr_preco sem preco_novo com no mínimo 2 linhas de dados;
- As tabelas compra e item deverão ser alimentadas por um bloco de programação anônimo;
- Para calcular o total da compra, crie uma função, o resultado deverá ser gravado na tabela compra;
- Para exibir os clientes com suas compras e as músicas compradas, crie uma procedure;
- Para controlar a atualização de preços das músicas crie um gatilho e armazene as atualização na tabela ctr_preco;
 */

--Passo 1 - Criar tabelas

DROP TABLE USUARIO CASCADE CONSTRAINTS;
DROP TABLE MUSICA CASCADE CONSTRAINTS;
DROP TABLE COMPRA CASCADE CONSTRAINTS;
DROP TABLE ITEM_COMPRA CASCADE CONSTRAINTS;
DROP TABLE CTR_PRECO CASCADE CONSTRAINTS;

CREATE TABLE USUARIO(
    id_usuario NUMBER(9) primary key,
    nome_usuario VARCHAR2(40)
);

CREATE TABLE MUSICA(
    id_musica NUMBER(10) primary key,
    titulo_musica VARCHAR2(40)
);

CREATE TABLE COMPRA(
    id_compra NUMBER(10) primary key,
    data_compra DATE,
    total_compra NUMBER(5,2),
    id_usuario references USUARIO
);

CREATE TABLE ITEM_COMPRA(
    id_compra references COMPRA,
    id_musica references MUSICA
);

CREATE TABLE CTR_PRECO(
    id_musica references MUSICA,
    preco_antigo NUMBER(5,2),
    preco_novo NUMBER(5,2)
);
CREATE SEQUENCE 

INSERT INTO USUARIO VALUES ();