DROP TABLE cotacao CASCADE CONSTRAINTS;
DROP TABLE fornecedor CASCADE CONSTRAINTS;
DROP TABLE pedido CASCADE CONSTRAINTS;
DROP TABLE produto CASCADE CONSTRAINTS;
DROP TABLE usuario CASCADE CONSTRAINTS;
DROP TABLE itempedido CASCADE CONSTRAINTS;

CREATE TABLE cotacao (
    cotacao_id     NUMBER(10) NOT NULL,
    cotacao_data   DATE NOT NULL,
    preco_unitario FLOAT(10) NOT NULL
);

ALTER TABLE cotacao ADD CONSTRAINT cotacao_pk PRIMARY KEY ( cotacao_id );

CREATE TABLE fornecedor (
    fornecedor_id       NUMBER(10) NOT NULL,
    fornecedor_nome     VARCHAR2(50) NOT NULL,
    fornecedor_endereco VARCHAR2(50) NOT NULL,
    fornecedor_contato  VARCHAR2(20) NOT NULL
);

ALTER TABLE fornecedor ADD CONSTRAINT fornecedor_pk PRIMARY KEY ( fornecedor_id );

CREATE TABLE itempedido (
    item_id            NUMBER(10) NOT NULL,
    item_quantidade    NUMBER(10) NOT NULL,
    pedido_pedido_id   NUMBER(10) NOT NULL,
    produto_produto_id NUMBER(10) NOT NULL
);

ALTER TABLE itempedido ADD CONSTRAINT itempedido_pk PRIMARY KEY ( item_id,
                                                                  produto_produto_id );

CREATE TABLE pedido (
    pedido_id          NUMBER(10) NOT NULL,
    pedido_data        DATE NOT NULL,
    pedido_status      VARCHAR2(50) NOT NULL,
    usuario_usuario_id NUMBER(10) NOT NULL,
    cotacao_cotacao_id NUMBER(10) NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( pedido_id );

CREATE TABLE produto (
    produto_id               NUMBER(10) NOT NULL,
    produto_nome             VARCHAR2(50) NOT NULL,
    produto_descricao        VARCHAR2(120) NOT NULL,
    produto_preco            FLOAT(10) NOT NULL,
    fornecedor_fornecedor_id NUMBER(10) NOT NULL
);

ALTER TABLE produto ADD CONSTRAINT produto_pk PRIMARY KEY ( produto_id );

CREATE TABLE usuario (
    usuario_id    NUMBER(10) NOT NULL,
    usuario_nome  VARCHAR2(50) NOT NULL,
    usuario_email VARCHAR2(50) NOT NULL,
    usuario_senha VARCHAR2(50) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( usuario_id );

ALTER TABLE itempedido
    ADD CONSTRAINT itempedido_pedido_fk FOREIGN KEY ( pedido_pedido_id )
        REFERENCES pedido ( pedido_id );

ALTER TABLE itempedido
    ADD CONSTRAINT itempedido_produto_fk FOREIGN KEY ( produto_produto_id )
        REFERENCES produto ( produto_id );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_cotacao_fk FOREIGN KEY ( cotacao_cotacao_id )
        REFERENCES cotacao ( cotacao_id );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_usuario_fk FOREIGN KEY ( usuario_usuario_id )
        REFERENCES usuario ( usuario_id );

ALTER TABLE produto
    ADD CONSTRAINT produto_fornecedor_fk FOREIGN KEY ( fornecedor_fornecedor_id )
        REFERENCES fornecedor ( fornecedor_id );
        
        
-- Inserindo dados na tabela 'usuario'
INSERT INTO usuario (usuario_id, usuario_nome, usuario_email, usuario_senha) VALUES (1, 'João', 'joao@email.com', 'senha123');
INSERT INTO usuario (usuario_id, usuario_nome, usuario_email, usuario_senha) VALUES (2, 'Maria', 'maria@email.com', 'senha456');
INSERT INTO usuario (usuario_id, usuario_nome, usuario_email, usuario_senha) VALUES (3, 'Pedro', 'pedro@email.com', 'senha789');
INSERT INTO usuario (usuario_id, usuario_nome, usuario_email, usuario_senha) VALUES (4, 'Ana', 'ana@email.com', 'senha101');
INSERT INTO usuario (usuario_id, usuario_nome, usuario_email, usuario_senha) VALUES (5, 'Carlos', 'carlos@email.com', 'senha202');

-- Inserindo dados na tabela 'fornecedor'
INSERT INTO fornecedor (fornecedor_id, fornecedor_nome, fornecedor_endereco, fornecedor_contato)VALUES (1, 'PartsBase', 'Rua Miguel Cervantes Rodrigues', '(123) 456-7890');
INSERT INTO fornecedor (fornecedor_id, fornecedor_nome, fornecedor_endereco, fornecedor_contato)VALUES (2, 'Boeing', 'Travessa Helma', '(555) 987-6543');
INSERT INTO fornecedor (fornecedor_id, fornecedor_nome, fornecedor_endereco, fornecedor_contato)VALUES (3, 'Airbus', 'Avenida Nove de Julho', '(321) 789-0123');
INSERT INTO fornecedor (fornecedor_id, fornecedor_nome, fornecedor_endereco, fornecedor_contato)VALUES (4, 'Honeywell Aerospace', 'Rua Nossa Senhora de Lourdes', '(888) 234-5678');
INSERT INTO fornecedor (fornecedor_id, fornecedor_nome, fornecedor_endereco, fornecedor_contato)VALUES (5, 'GE Aviation', 'Rua Sim?o Carlos Pimenta', '(555) 123-4567');

-- Inserindo dados na tabela 'cotacao'
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario) VALUES (1, TO_DATE('2023-10-23', 'YYYY-MM-DD'), 100.0);
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario) VALUES (2, TO_DATE('2023-10-22', 'YYYY-MM-DD'), 90.0);
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario) VALUES (3, TO_DATE('2023-10-21', 'YYYY-MM-DD'), 80.0);
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario) VALUES (4, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 70.0);
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario) VALUES (5, TO_DATE('2023-10-19', 'YYYY-MM-DD'), 60.0);

-- Inserindo dados na tabela 'pedido'
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id, cotacao_cotacao_id) VALUES (1, TO_DATE('2023-10-23', 'YYYY-MM-DD'), 'Em andamento', 1, 5);
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id, cotacao_cotacao_id) VALUES (2, TO_DATE('2023-10-22', 'YYYY-MM-DD'), 'Concluído', 2, 4);
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id, cotacao_cotacao_id) VALUES (3, TO_DATE('2023-10-21', 'YYYY-MM-DD'), 'Em andamento', 3, 3);
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id, cotacao_cotacao_id) VALUES (4, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'Concluído', 4, 2);
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id, cotacao_cotacao_id) VALUES (5, TO_DATE('2023-10-19', 'YYYY-MM-DD'), 'Em andamento', 5, 1);

-- Inserindo dados na tabela 'produto'
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, fornecedor_fornecedor_id) VALUES (1, 'Parafusos de Aeronave', 'Parafusos de alta resist?ncia usados na montagem e manuteção de aeronaves.', 2.30, 1);
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, fornecedor_fornecedor_id) VALUES (2, 'Filtros de Combust?vel', 'Filtros que removem impurezas do combustível antes que ele entre no motor da aeronave.', 25.0, 2);
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, fornecedor_fornecedor_id) VALUES (3, 'Baterias de Avião', 'Baterias de aeronaves para fornecer energia elétrica a sistemas e componentes eletrénicos.', 150.0, 3);
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, fornecedor_fornecedor_id) VALUES (4, 'Velas de Ignição', 'Velas de ignição especiais para motores de aeronaves a pistão.', 10.0, 4);
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, fornecedor_fornecedor_id) VALUES (5, 'Luzes de Navegação', 'Luzes de navegação usadas para indicar a posição e direção de uma aeronave durante o voo.', 30.0, 5);

-- Inserindo dados na tabela 'itempedido'

INSERT INTO itempedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (1, 87, 1, 5);
INSERT INTO itempedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (2, 27, 2, 4);
INSERT INTO itempedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (3, 72, 3, 3);
INSERT INTO itempedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (4, 15, 4, 2);
INSERT INTO itempedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (5, 65, 5, 1);

commit;

--Criar uma consulta com pelo menos 2 Joins mostrando os dados inseridos.

--Esse join retorna o nome do produto, pre?o e o fornecedor
SELECT p.produto_nome, p.produto_preco, f.fornecedor_nome
FROM produto p
JOIN fornecedor f ON p.fornecedor_fornecedor_id = f.fornecedor_id;

--ESSE JOIN RETORNA O PEDIDO ID E DATA, USUARIO NOME, COTACAO DATA, PREÇO, PRODUTO NOME E DESCRIÇÃO 

SELECT 
    p.pedido_id,
    p.pedido_data,
    p.pedido_status,
    u.usuario_nome,
    c.cotacao_data,
    c.preco_unitario,
    pr.produto_nome,
    pr.produto_descricao
FROM pedido p
JOIN usuario u ON p.usuario_usuario_id = u.usuario_id
JOIN cotacao c ON p.cotacao_cotacao_id = c.cotacao_id
JOIN itempedido ip ON p.pedido_id = ip.pedido_pedido_id
JOIN produto pr ON ip.produto_produto_id = pr.produto_id;



-- FUNÇÃO PARA VALIDAR O FORMARTO DE E-MAIL
CREATE OR REPLACE FUNCTION validar_email(p_email IN VARCHAR2) RETURN BOOLEAN IS
BEGIN
    IF REGEXP_LIKE(p_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}$') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END validar_email;


-- FUNÇÃO PARA VALIDAR A SENHA (EXEMPLO: DEVE TER PELO MENOS 8 CARACTERES)

CREATE OR REPLACE FUNCTION validar_senha(p_senha IN VARCHAR2) RETURN BOOLEAN IS
BEGIN
    IF LENGTH(p_senha) >= 8 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END validar_senha;

SET SERVEROUTPUT ON
SET VERIFY OFF

--INSERINDO DADOS NA TABELA 'USUARIO' COM VALIDAÇÃO DE E-MAIL E SENHA.

DECLARE
    v_email VARCHAR2(100) := 'thiago@gmail.com';
    v_senha VARCHAR2(50) := 'senha123';
BEGIN
    IF validar_email(v_email) AND validar_senha(v_senha) THEN
        INSERT INTO usuario (usuario_id, usuario_nome, usuario_email, usuario_senha)
        VALUES (6, 'thiago', v_email, v_senha);
        DBMS_OUTPUT.PUT_LINE('Dados de usuário inseridos com sucesso.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Dados de usuário inválidos.');
    END IF;
END;

SELECT * FROM usuario;

--PROCEDURE INSERT USUARIO

CREATE OR REPLACE PROCEDURE inserir_usuario(
    p_id IN NUMBER,
    p_nome IN VARCHAR2,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2
) AS
BEGIN
    IF validar_email(p_email) AND validar_senha(p_senha) THEN
        INSERT INTO usuario (usuario_id, usuario_nome, usuario_email, usuario_senha)
        VALUES (p_id, p_nome, p_email, p_senha);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Usuário inserido com sucesso.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Dados de usuário inválidos.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir usuário: ' || SQLERRM);
END inserir_usuario;

--INSERINDO DADOS NO USUÀRIO NO METODO INSERT_USUARIO

BEGIN
    inserir_usuario(7, 'João', 'joao@email.com', 'senha123');
END;

--PROCEDURE UPDATE USUARIO

CREATE OR REPLACE PROCEDURE atualizar_usuario(
    p_id IN NUMBER,
    p_nome IN VARCHAR2,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2
) AS
BEGIN
    IF validar_email(p_email) AND validar_senha(p_senha) THEN
        UPDATE usuario
        SET usuario_nome = p_nome, usuario_email = p_email, usuario_senha = p_senha
        WHERE usuario_id = p_id;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Usuário atualizado com sucesso.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Dados de usuário inválidos.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar usuário: ' || SQLERRM);
END atualizar_usuario;

--ATUALIZANDO OS DADOS DO USUARIO NO METODO ATUALIZAR_USUARIO

BEGIN
    atualizar_usuario(7, 'Felipe', 'felipe@email.com', 'senha123');
END;

--PROCEDURE DELETE USUARIO

CREATE OR REPLACE PROCEDURE excluir_usuario(p_id IN NUMBER) AS
BEGIN
    DELETE FROM usuario WHERE usuario_id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Usuário excluído com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao excluir usuário: ' || SQLERRM);
END excluir_usuario;

--DELETANDO DADOS DO USUARIO NO METODO EXCLUIR_USUARIO 

BEGIN
    excluir_usuario(7);
END;


--PROCEDURE INSERT FORNECEDOR

SET SERVEROUTPUT ON
SET VERIFY OFF

CREATE OR REPLACE PROCEDURE inserir_fornecedor(
    p_id IN NUMBER,
    p_nome IN VARCHAR2,
    p_endereco IN VARCHAR2,
    p_contato IN VARCHAR2
) AS
BEGIN
    INSERT INTO fornecedor (fornecedor_id, fornecedor_nome, fornecedor_endereco, fornecedor_contato)
    VALUES (p_id, p_nome, p_endereco, p_contato);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Fornecedor inserido com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir fornecedor: ' || SQLERRM);
END inserir_fornecedor;

--INSERINDO DADOS NO FORNECEDOR NO METODO INSERT_FORNECEDOR

BEGIN
    inserir_fornecedor(6, 'Embraer', 'Avenida Santos Dumont', '(987) 654-3210');
END;

--PROCEDURE UPDATE FORNECEDOR

CREATE OR REPLACE PROCEDURE atualizar_fornecedor(
    p_id IN NUMBER,
    p_nome IN VARCHAR2,
    p_endereco IN VARCHAR2,
    p_contato IN VARCHAR2
) AS
BEGIN
    UPDATE fornecedor
    SET fornecedor_nome = p_nome, fornecedor_endereco = p_endereco, fornecedor_contato = p_contato
    WHERE fornecedor_id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Fornecedor atualizado com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar fornecedor: ' || SQLERRM);
END atualizar_fornecedor;

-- ATUALIZANDO OS DADOS DO USUARIO NO METODO ATUALIZAR_FORNECEDOR

BEGIN
    atualizar_fornecedor(6, 'Embraer S.A.', 'Avenida Santos Dumont, 1700', '(987) 654-3229');
END;

--PROCEDURE DELETE FORNECEDOR

CREATE OR REPLACE PROCEDURE excluir_fornecedor(p_id IN NUMBER) AS
BEGIN
    DELETE FROM fornecedor WHERE fornecedor_id = p_id;
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Fornecedor excluído com sucesso.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao excluir fornecedor: ' || SQLERRM);
END excluir_fornecedor;

-- DELETANDO DADOS DE FORNECEDOR COM O METODO EXCLUIR_FORNECEDOR

BEGIN
    excluir_fornecedor(6);
END;

-- BLOCO ANÔNIMO COM CURSOR PARA PELO UMA CONSULTA NO BANCO DE DADOS COM JOIN.

SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    CURSOR c_pedido_produto_fornecedor IS
        SELECT
            p.pedido_id,
            p.pedido_data,
            pr.produto_nome,
            pr.produto_preco,
            f.fornecedor_nome
        FROM
            pedido p
            JOIN itempedido ip ON p.pedido_id = ip.pedido_pedido_id
            JOIN produto pr ON ip.produto_produto_id = pr.produto_id
            JOIN fornecedor f ON pr.fornecedor_fornecedor_id = f.fornecedor_id;

    v_pedido_id pedido.pedido_id%TYPE;
    v_pedido_data pedido.pedido_data%TYPE;
    v_produto_nome produto.produto_nome%TYPE;
    v_produto_preco produto.produto_preco%TYPE;
    v_fornecedor_nome fornecedor.fornecedor_nome%TYPE;
BEGIN
    OPEN c_pedido_produto_fornecedor;

    LOOP
        FETCH c_pedido_produto_fornecedor INTO v_pedido_id, v_pedido_data, v_produto_nome, v_produto_preco, v_fornecedor_nome;
        EXIT WHEN c_pedido_produto_fornecedor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Pedido ID: ' || v_pedido_id || ', Data: ' || v_pedido_data || ', Produto: ' || v_produto_nome || ', Preço: ' || v_produto_preco || ', Fornecedor: ' || v_fornecedor_nome);
    END LOOP;

    CLOSE c_pedido_produto_fornecedor;
END;


-- procedure que imprima um relatório com pelo menos um regra de negócio, que contenha funções, inner Join, order by, sum ou count.

-- ESTE MODELO DE NEGOCIO FACILITA NA GERAÇAO DE RALATORIOS DETALHADOS PARA PEDIDOS ESPECIFICOS.

    --FORNECE UMA VISÃO DETALHADA DOS PRODUTORS INCLUIDOS EM UM PEDIDO, FACILITANDO A ANALISE.
    --POSSIBILITA A IDENTIFICAÇÃO RAPIDA DE VALORES TOTAIS PARA CADA ITEM DO PEDIDO.

CREATE OR REPLACE PROCEDURE relatorio_pedido(
    p_pedido_id IN NUMBER
) AS
BEGIN
    FOR r IN (
        SELECT 
            ip.item_id,
            p.produto_nome,
            f.fornecedor_nome,
            ip.item_quantidade,
            p.produto_preco,
            ip.item_quantidade * p.produto_preco AS valor_total
        FROM 
            itempedido ip
            JOIN produto p ON ip.produto_produto_id = p.produto_id
            JOIN fornecedor f ON p.fornecedor_fornecedor_id = f.fornecedor_id
        WHERE 
            ip.pedido_pedido_id = p_pedido_id
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE('Item ID: ' || r.item_id);
        DBMS_OUTPUT.PUT_LINE('Produto: ' || r.produto_nome);
        DBMS_OUTPUT.PUT_LINE('Fornecedor: ' || r.fornecedor_nome);
        DBMS_OUTPUT.PUT_LINE('Quantidade: ' || r.item_quantidade);
        DBMS_OUTPUT.PUT_LINE('Preço Unitário: ' || r.produto_preco);
        DBMS_OUTPUT.PUT_LINE('Valor Total: ' || r.valor_total);
        DBMS_OUTPUT.PUT_LINE('----------------------------------------');
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Nenhum registro encontrado para o pedido ' || p_pedido_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao gerar relatório: ' || SQLERRM);
END relatorio_pedido;

--GERACAO DE RELATORIO DE ACORDO COM O ID DO PEDIDO.

SET SERVEROUTPUT ON
SET VERIFY OFF

BEGIN
    relatorio_pedido(1);
END;