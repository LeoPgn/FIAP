DROP TABLE cotacao CASCADE CONSTRAINTS;
DROP TABLE fornecedor CASCADE CONSTRAINTS;
DROP TABLE pedido CASCADE CONSTRAINTS;
DROP TABLE produto CASCADE CONSTRAINTS;
DROP TABLE usuario CASCADE CONSTRAINTS;

CREATE TABLE cotacao (
    cotacao_id         NUMBER(5) NOT NULL,
    cotacao_data       DATE,
    preco_unitario     FLOAT(10),
    usuario_usuario_id NUMBER(5) NOT NULL
);

ALTER TABLE cotacao ADD CONSTRAINT cotacao_pk PRIMARY KEY ( cotacao_id );

CREATE TABLE fornecedor (
    fornecedor_id       NUMBER(5) NOT NULL,
    fornecedor_nome     VARCHAR2(50),
    fornecedor_endereco VARCHAR2(100),
    fornecedor_contato  VARCHAR2(30)
);

ALTER TABLE fornecedor ADD CONSTRAINT fornecedor_pk PRIMARY KEY ( fornecedor_id );

CREATE TABLE pedido (
    pedido_id          NUMBER(5) NOT NULL,
    pedido_data        DATE,
    pedido_status      VARCHAR2(50),
    usuario_usuario_id NUMBER(5) NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( pedido_id );

CREATE TABLE produto (
    produto_id               NUMBER(5) NOT NULL,
    produto_nome             VARCHAR2(50),
    produto_descricao        VARCHAR2(100),
    produto_preco            FLOAT(10),
    pedido_pedido_id         NUMBER(5) NOT NULL,
    fornecedor_fornecedor_id NUMBER(5) NOT NULL,
    cotacao_cotacao_id       NUMBER(5) NOT NULL
);

ALTER TABLE produto ADD CONSTRAINT produto_pk PRIMARY KEY ( produto_id );

CREATE TABLE usuario (
    usuario_id    NUMBER(5) NOT NULL,
    usuario_nome  VARCHAR2(50),
    usuario_email VARCHAR2(100),
    usuario_senha VARCHAR2(50)
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( usuario_id );

ALTER TABLE cotacao
    ADD CONSTRAINT cotacao_usuario_fk FOREIGN KEY ( usuario_usuario_id )
        REFERENCES usuario ( usuario_id );

ALTER TABLE pedido
    ADD CONSTRAINT pedido_usuario_fk FOREIGN KEY ( usuario_usuario_id )
        REFERENCES usuario ( usuario_id );

ALTER TABLE produto
    ADD CONSTRAINT produto_cotacao_fk FOREIGN KEY ( cotacao_cotacao_id )
        REFERENCES cotacao ( cotacao_id );

ALTER TABLE produto
    ADD CONSTRAINT produto_fornecedor_fk FOREIGN KEY ( fornecedor_fornecedor_id )
        REFERENCES fornecedor ( fornecedor_id );

ALTER TABLE produto
    ADD CONSTRAINT produto_pedido_fk FOREIGN KEY ( pedido_pedido_id )
        REFERENCES pedido ( pedido_id );
        
        
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
INSERT INTO fornecedor (fornecedor_id, fornecedor_nome, fornecedor_endereco, fornecedor_contato)VALUES (5, 'GE Aviation', 'Rua Simão Carlos Pimenta', '(555) 123-4567');

-- Inserindo dados na tabela 'pedido'
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id) VALUES (1, TO_DATE('2023-10-23', 'YYYY-MM-DD'), 'Em andamento', 1);
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id) VALUES (2, TO_DATE('2023-10-22', 'YYYY-MM-DD'), 'Concluído', 2);
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id) VALUES (3, TO_DATE('2023-10-21', 'YYYY-MM-DD'), 'Em andamento', 3);
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id) VALUES (4, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'Concluído', 4);
INSERT INTO pedido (pedido_id, pedido_data, pedido_status, usuario_usuario_id) VALUES (5, TO_DATE('2023-10-19', 'YYYY-MM-DD'), 'Em andamento', 5);

-- Inserindo dados na tabela 'cotacao'
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario, usuario_usuario_id) VALUES (1, TO_DATE('2023-10-23', 'YYYY-MM-DD'), 100.0, 1);
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario, usuario_usuario_id) VALUES (2, TO_DATE('2023-10-22', 'YYYY-MM-DD'), 90.0, 2);
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario, usuario_usuario_id) VALUES (3, TO_DATE('2023-10-21', 'YYYY-MM-DD'), 80.0, 3);
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario, usuario_usuario_id) VALUES (4, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 70.0, 4);
INSERT INTO cotacao (cotacao_id, cotacao_data, preco_unitario, usuario_usuario_id) VALUES (5, TO_DATE('2023-10-19', 'YYYY-MM-DD'), 60.0, 5);

-- Inserindo dados na tabela 'produto'
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, pedido_pedido_id, fornecedor_fornecedor_id, cotacao_cotacao_id) VALUES (1, 'Parafusos de Aeronave', 'Parafusos de alta resistência usados na montagem e manutenção de aeronaves.', 2.30, 1, 1, 1);
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, pedido_pedido_id, fornecedor_fornecedor_id, cotacao_cotacao_id) VALUES (2, 'Filtros de Combustível', 'Filtros que removem impurezas do combustível antes que ele entre no motor da aeronave.', 25.0, 2, 2, 2);
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, pedido_pedido_id, fornecedor_fornecedor_id, cotacao_cotacao_id) VALUES (3, 'Baterias de Aviação', 'Baterias de aeronaves para fornecer energia elétrica a sistemas e componentes eletrônicos.', 150.0, 3, 3, 3);
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, pedido_pedido_id, fornecedor_fornecedor_id, cotacao_cotacao_id) VALUES (4, 'Velas de Ignição', 'Velas de ignição especiais para motores de aeronaves a pistão.', 10.0, 4, 4, 4);
INSERT INTO produto (produto_id, produto_nome, produto_descricao, produto_preco, pedido_pedido_id, fornecedor_fornecedor_id, cotacao_cotacao_id) VALUES (5, 'Luzes de Navegação', 'Luzes de navegação usadas para indicar a posição e direção de uma aeronave durante o voo.', 30.0, 5, 5, 5);

commit;

--Criar uma consulta com pelo menos 2 Joins mostrando os dados inseridos.

--Esse join retorna o nome do produto, preço e o fornecedor
SELECT p.produto_nome, p.produto_preco, f.fornecedor_nome
FROM produto p
JOIN fornecedor f ON p.fornecedor_fornecedor_id = f.fornecedor_id;

--Esse join retorna o data e preço da cotação e o nome do usuario que crio a cotação
SELECT c.cotacao_data, c.preco_unitario, u.usuario_nome
FROM cotacao c
JOIN usuario u ON c.usuario_usuario_id = u.usuario_id;

--Esse join retorna o Id, data e status do pedido o nome de que fez o pedido e o preço unitario
SELECT p.pedido_id, p.pedido_data, p.pedido_status, u.usuario_nome, c.preco_unitario
FROM pedido p
JOIN usuario u ON p.usuario_usuario_id = u.usuario_id
JOIN cotacao c ON p.pedido_id = c.usuario_usuario_id;





        