/*
 2TDSPS - Challenge Level Group - 3° Sprint - Grupo: AeroParts
 Integrantes:
 RM96562 - Leonardo Paganini
 RM97032 - Regina Pompeo
 RM97305 - Jhonn Brandon
*/

/*
Passo 1 - Rode da linha 14 até a 19 para excluir as tabelas e garantir que o projeto rode de forma linear
*/

DROP TABLE usuario CASCADE CONSTRAINTS;
DROP TABLE pedido CASCADE CONSTRAINTS;
DROP TABLE item_pedido CASCADE CONSTRAINTS;
DROP TABLE cotacao CASCADE CONSTRAINTS;
DROP TABLE produto CASCADE CONSTRAINTS;
DROP TABLE fornecedor CASCADE CONSTRAINTS;

/*
Passo 2 - Rode da linha 24 até a 91 para criar as tabelas e manter as solicitações feitas na Sprint 2
*/

CREATE TABLE usuario (
    usuario_id    NUMBER(10) NOT NULL,
    usuario_nome  VARCHAR2(50) NOT NULL,
    usuario_email VARCHAR2(50) NOT NULL,
    usuario_senha VARCHAR2(50) NOT NULL
);
ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( usuario_id );

CREATE TABLE pedido (
    pedido_id          NUMBER(10) NOT NULL,
    pedido_data        DATE NOT NULL,
    pedido_status      VARCHAR2(50) NOT NULL,
    usuario_usuario_id NUMBER(10) NOT NULL,
    cotacao_cotacao_id NUMBER(10) NOT NULL
);
ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( pedido_id );

CREATE TABLE item_pedido (
    item_id            NUMBER(10) NOT NULL,
    item_quantidade    NUMBER(10) NOT NULL,
    pedido_pedido_id   NUMBER(10) NOT NULL,
    produto_produto_id NUMBER(10) NOT NULL
);
ALTER TABLE item_pedido ADD CONSTRAINT itempedido_pk PRIMARY KEY ( item_id, produto_produto_id );

CREATE TABLE cotacao (
    cotacao_id     NUMBER(10) NOT NULL,
    cotacao_data   DATE NOT NULL,
    preco_unitario FLOAT(10) NOT NULL
);
ALTER TABLE cotacao ADD CONSTRAINT cotacao_pk PRIMARY KEY ( cotacao_id );

CREATE TABLE produto (
    produto_id               NUMBER(10) NOT NULL,
    produto_nome             VARCHAR2(50) NOT NULL,
    produto_descricao        VARCHAR2(120) NOT NULL,
    produto_preco            FLOAT(10) NOT NULL,
    fornecedor_fornecedor_id NUMBER(10) NOT NULL
);
ALTER TABLE produto ADD CONSTRAINT produto_pk PRIMARY KEY ( produto_id );

CREATE TABLE fornecedor (
    fornecedor_id       NUMBER(10) NOT NULL,
    fornecedor_nome     VARCHAR2(50) NOT NULL,
    fornecedor_endereco VARCHAR2(50) NOT NULL,
    fornecedor_contato  VARCHAR2(20) NOT NULL
);
ALTER TABLE fornecedor ADD CONSTRAINT fornecedor_pk PRIMARY KEY ( fornecedor_id );

ALTER TABLE item_pedido
    ADD CONSTRAINT itempedido_pedido_fk FOREIGN KEY ( pedido_pedido_id )
        REFERENCES pedido ( pedido_id );

ALTER TABLE item_pedido
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

/*
Passo 3 - Rode da linha 72 até a 111 para inserir dados nas tabelas criadas anteriormente
*/

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

-- Inserindo dados na tabela 'item_pedido'
INSERT INTO item_pedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (1, 87, 1, 5);
INSERT INTO item_pedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (2, 27, 2, 4);
INSERT INTO item_pedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (3, 72, 3, 3);
INSERT INTO item_pedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (4, 15, 4, 2);
INSERT INTO item_pedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id) VALUES (5, 65, 5, 1);

/*
Passo 4 - Criando as PROCEDURES conforme solicitado na Sprint 3 do projeto
*/

--criando as sequences que serão utilizadas para facilitar os inserts
CREATE SEQUENCE SEQ_ITEM_PEDIDO START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_PEDIDO START WITH 1 INCREMENT BY 1;

DROP SEQUENCE SEQ_ITEM_PEDIDO;
DROP SEQUENCE SEQ_PEDIDO;


CREATE OR REPLACE PROCEDURE proc_registrar_pedido (
    p_usuario_id IN NUMBER,
    p_produto_id IN NUMBER,
    p_quantidade IN NUMBER
) AS
    v_cotacao_id NUMBER;
BEGIN /* VERIFICANDO SE HÁ UMA COTAÇÃO DISPONIVEL PARA O PRODUTO */

    SELECT cotacao_id INTO v_cotacao_id FROM cotacao
        WHERE ROWNUM = 1 AND produto_produto_id = p_produto_id ORDER BY cotacao_data DESC;

    /* VERIFICANDO SE O USUARIO EXISTE */
    IF NOT EXISTS (SELECT 1 FROM usuario WHERE usuario_id = p_usuario_id) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Usuário não encontrado');
    end if;

    /* VERIFICANDO SE A COTACAO FOI ENCONTRADA */
    IF v_cotacao_id IS NULL THEN
        RAISE_APPLICATION_ERROR(-20002, 'Cotação não encontrada para o produto');

    /* INSERE O PEDIDO E O ITEM PEDIDO */
    ELSE
        INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id, cotacao_cotacao_id)
        VALUES (SEQ_PEDIDO.NEXTVAL, SYSDATE, 'PENDENTE', p_usuario_id, v_cotacao_id);

        INSERT INTO item_pedido (item_id, item_quantidade, pedido_pedido_id, produto_produto_id)
        VALUES (SEQ_ITEM_PEDIDO.NEXTVAL, p_quantidade, SEQ_PEDIDO.CURRVAL, p_produto_id);
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20003, 'Nenhuma cotação encontrada para o produto');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Erro ao registrar pedido');
END proc_registrar_pedido;
/