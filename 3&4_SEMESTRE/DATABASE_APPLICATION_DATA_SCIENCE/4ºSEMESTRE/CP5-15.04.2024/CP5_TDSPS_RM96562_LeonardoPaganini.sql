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

DROP SEQUENCE SEQ_ID_USUARIO;
DROP SEQUENCE SEQ_ID_MSC;
DROP SEQUENCE SEQ_ID_COMPRA;

CREATE SEQUENCE SEQ_ID_USUARIO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_MSC START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_COMPRA START WITH 1 INCREMENT BY 1;

INSERT INTO USUARIO (id_usuario, nome_usuario) VALUES (SEQ_ID_USUARIO.nextval, 'João');
INSERT INTO USUARIO (id_usuario, nome_usuario) VALUES (SEQ_ID_USUARIO.nextval, 'Maria');

INSERT INTO MUSICA (id_musica, titulo_musica) VALUES (SEQ_ID_MSC.nextval, 'Musica A');
INSERT INTO MUSICA (id_musica, titulo_musica) VALUES (SEQ_ID_MSC.nextval, 'Musica B');

INSERT INTO CTR_PRECO (id_musica, preco_antigo, preco_novo) VALUES (SEQ_ID_MSC.currval, NULL, NULL);
INSERT INTO CTR_PRECO (id_musica, preco_antigo, preco_novo) VALUES (SEQ_ID_MSC.currval, NULL, NULL);

SET SERVEROUTPUT ON;
SET VERIFY OFF;


DECLARE
    v_id_compra NUMBER(10) := 1;
    v_data_compra DATE := SYSDATE;
    v_total_compra NUMBER := 

BEGIN
    INSERT INTO COMPRA (id_compra, data_compra, total_compra, id_usuario) VALUES (1, SYSDATE, 10000, 1);
    INSERT INTO COMPRA (id_compra, data_compra, total_compra, id_usuario) VALUES (2, SYSDATE, 5000, 2);
END;

-- As tabelas compra e item deverão ser alimentadas por um bloco de programação anônimo;