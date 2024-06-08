--GLOBAL SOLUTION 4 | Turma: 2TDSPS | GRUPO: ECORAL
--INTEGRANTES: RM96562 - Leonardo Paganini | RM97305 - Jhonn Brandon | RM97032 - Regina Pompeo


-- IMPORTANTE: SIGA AS INSTRUÇÕES DE EXECUÇÃO PARA UMA MELHOR EXECUÇÃO DO CÓDIGO! --

-- Neste capitulo abaixo, criaremos as tabelas conforme a necessidade do software
-- Execute da linha *** até a linha *** para executar as tabelas

CREATE TABLE alerta_equipamento (
    id_alerta                      NUMBER(10) NOT NULL,
    dt_alerta                      DATE NOT NULL,
    nivel_alerta                   VARCHAR2(40) NOT NULL,
    descr_alerta                   VARCHAR2(400) NOT NULL,
    status_alerta                  VARCHAR2(40) NOT NULL,
    parceiros_id_parceiro          NUMBER(10) NOT NULL,
    leitura_equipamento_id_leitura NUMBER(10) NOT NULL,
    usuario_id_user                NUMBER(10) NOT NULL
);

CREATE TABLE equipamento (
    id_equip              NUMBER(10) NOT NULL,
    tipo_equip            VARCHAR2(40) NOT NULL,
    dt_equip              DATE NOT NULL,
    parceiros_id_parceiro NUMBER(10) NOT NULL
);

ALTER TABLE equipamento ADD CONSTRAINT equipamento_pk PRIMARY KEY (id_equip);

CREATE TABLE funcionario (
    id_func               NUMBER(10) NOT NULL,
    nome_func             VARCHAR2(100) NOT NULL,
    email_func            VARCHAR2(100) NOT NULL,
    senha_func            VARCHAR2(40) NOT NULL,
    parceiros_id_parceiro NUMBER(10) NOT NULL
);

ALTER TABLE funcionario ADD CONSTRAINT funcionario_pk PRIMARY KEY (id_func);

CREATE TABLE leitura_equipamento (
    id_leitura                 NUMBER(10) NOT NULL,
    dt_leitura                 DATE NOT NULL,
    tipo_leitura               VARCHAR2(40) NOT NULL,
    valor_leitura              NUMBER(3, 2) NOT NULL,
    local_equipamento_id_local NUMBER(10) NOT NULL,
    parceiros_id_parceiro      NUMBER(10) NOT NULL,
    usuario_id_user            NUMBER(10) NOT NULL,
    equipamento_id_equip       NUMBER(10) NOT NULL
);

ALTER TABLE leitura_equipamento ADD CONSTRAINT leitura_equipamento_pk PRIMARY KEY (id_leitura);

CREATE TABLE local_equipamento (
    id_local        NUMBER(10) NOT NULL,
    nome_local      VARCHAR2(100) NOT NULL,
    latitude_local  VARCHAR2(40) NOT NULL,
    longitude_local VARCHAR2(40) NOT NULL
);

ALTER TABLE local_equipamento ADD CONSTRAINT local_equipamento_pk PRIMARY KEY (id_local);

CREATE TABLE manutencao_equipamento (
    id_manut               NUMBER(10) NOT NULL,
    dt_manut               DATE NOT NULL,
    tipo_manut             VARCHAR2(40) NOT NULL,
    responsavel_manut      VARCHAR2(100) NOT NULL,
    equipamento_id_equip   NUMBER(10) NOT NULL,
    funcionario_id_func    NUMBER(10) NOT NULL,
    relatorio_id_relatorio NUMBER(10) NOT NULL,
    parceiros_id_parceiro  NUMBER(10) NOT NULL
);

CREATE UNIQUE INDEX manutencao_equipamento__idx ON manutencao_equipamento (relatorio_id_relatorio ASC);

CREATE TABLE parceiros (
    id_parceiro   NUMBER(10) NOT NULL,
    nome_parc     VARCHAR2(100) NOT NULL,
    cnpj_parc     CHAR(14) NOT NULL,
    endereco_parc VARCHAR2(100) NOT NULL,
    contato_parc  VARCHAR2(20) NOT NULL,
    tipo_parc     VARCHAR2(40) NOT NULL
);

ALTER TABLE parceiros ADD CONSTRAINT parceiros_pk PRIMARY KEY (id_parceiro);

CREATE TABLE relatorio (
    id_relatorio         NUMBER(10) NOT NULL,
    descr_relatorio      VARCHAR2(500) NOT NULL,
    dt_relatorio         DATE NOT NULL,
    imagem_relatorio     BLOB,
    funcionario_id_func  NUMBER(10) NOT NULL,
    equipamento_id_equip NUMBER(10) NOT NULL
);

ALTER TABLE relatorio ADD CONSTRAINT relatorio_pk PRIMARY KEY (id_relatorio);

CREATE TABLE usuario (
    id_user    NUMBER(10) NOT NULL,
    nome_user  VARCHAR2(100) NOT NULL,
    email_user VARCHAR2(100) NOT NULL,
    senha_user VARCHAR2(40) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY (id_user);

CREATE SEQUENCE SEQ_ID_USER START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_PARC START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_LEITURA_EQUIP START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_LOCAL_EQUIP START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_EQUIP START WITH 1 INCREMENT BY 1;

--Neste capitulo abaixo, criaremos as chaves estrangeiras conforme a necessidade dos relacionamentos entre as tabelas
-- Execute da linha *** até a linha *** para executar as chaves estrangeiras

ALTER TABLE alerta_equipamento
    ADD CONSTRAINT alerta_leitura_fk FOREIGN KEY (leitura_equipamento_id_leitura)
        REFERENCES leitura_equipamento (id_leitura);

ALTER TABLE alerta_equipamento
    ADD CONSTRAINT alerta_parceiro_fk FOREIGN KEY (parceiros_id_parceiro)
        REFERENCES parceiros (id_parceiro);

ALTER TABLE alerta_equipamento
    ADD CONSTRAINT alerta_usuario_fk FOREIGN KEY (usuario_id_user)
        REFERENCES usuario (id_user);

ALTER TABLE equipamento
    ADD CONSTRAINT equip_parceiro_fk FOREIGN KEY (parceiros_id_parceiro)
        REFERENCES parceiros (id_parceiro);

ALTER TABLE funcionario
    ADD CONSTRAINT func_parceiro_fk FOREIGN KEY (parceiros_id_parceiro)
        REFERENCES parceiros (id_parceiro);

ALTER TABLE leitura_equipamento
    ADD CONSTRAINT leitura_equip_fk FOREIGN KEY (equipamento_id_equip)
        REFERENCES equipamento (id_equip);

ALTER TABLE leitura_equipamento
    ADD CONSTRAINT leitura_local_fk FOREIGN KEY (local_equipamento_id_local)
        REFERENCES local_equipamento (id_local);

ALTER TABLE leitura_equipamento
    ADD CONSTRAINT leitura_parceiro_fk FOREIGN KEY (parceiros_id_parceiro)
        REFERENCES parceiros (id_parceiro);

ALTER TABLE leitura_equipamento
    ADD CONSTRAINT leitura_usuario_fk FOREIGN KEY (usuario_id_user)
        REFERENCES usuario (id_user);

ALTER TABLE manutencao_equipamento
    ADD CONSTRAINT manut_equip_fk FOREIGN KEY (equipamento_id_equip)
        REFERENCES equipamento (id_equip);

ALTER TABLE manutencao_equipamento
    ADD CONSTRAINT manut_func_fk FOREIGN KEY (funcionario_id_func)
        REFERENCES funcionario (id_func);

ALTER TABLE manutencao_equipamento
    ADD CONSTRAINT manut_parceiro_fk FOREIGN KEY (parceiros_id_parceiro)
        REFERENCES parceiros (id_parceiro);

ALTER TABLE manutencao_equipamento
    ADD CONSTRAINT manut_relatorio_fk FOREIGN KEY (relatorio_id_relatorio)
        REFERENCES relatorio (id_relatorio);

ALTER TABLE relatorio
    ADD CONSTRAINT relatorio_equip_fk FOREIGN KEY (equipamento_id_equip)
        REFERENCES equipamento (id_equip);

ALTER TABLE relatorio
    ADD CONSTRAINT relatorio_func_fk FOREIGN KEY (funcionario_id_func)
        REFERENCES funcionario (id_func);

-- Nos dados abaixo, foram encapsuladas as procedures dentro de seu respectivo package (por tabela) para melhor organização manutenção do código
-- Execute da linha *** até a linha *** para executar os packages e suas procedures

-- Pacote para a tabela ALERTA_EQUIPAMENTO

CREATE OR REPLACE PACKAGE pkg_alerta_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA ALERTA_EQUIPAMENTO
    PROCEDURE inserir_alerta_equipamento (
        p_id_alerta                      NUMBER,
        p_dt_alerta                      DATE,
        p_nivel_alerta                   VARCHAR2,
        p_descr_alerta                   VARCHAR2,
        p_status_alerta                  VARCHAR2,
        p_parceiros_id_parceiro          NUMBER,
        p_leitura_equipamento_id_leitura NUMBER,
        p_usuario_id_user                NUMBER
    );
END pkg_alerta_equipamento;
/

CREATE OR REPLACE PACKAGE BODY pkg_alerta_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA ALERTA_EQUIPAMENTO
    PROCEDURE inserir_alerta_equipamento (
        p_id_alerta                      NUMBER,
        p_dt_alerta                      DATE,
        p_nivel_alerta                   VARCHAR2,
        p_descr_alerta                   VARCHAR2,
        p_status_alerta                  VARCHAR2,
        p_parceiros_id_parceiro          NUMBER,
        p_leitura_equipamento_id_leitura NUMBER,
        p_usuario_id_user                NUMBER
    ) IS
    BEGIN
        INSERT INTO alerta_equipamento (
            id_alerta, dt_alerta, nivel_alerta, descr_alerta, status_alerta, parceiros_id_parceiro, leitura_equipamento_id_leitura, usuario_id_user
        ) VALUES (
            p_id_alerta, p_dt_alerta, p_nivel_alerta, p_descr_alerta, p_status_alerta, p_parceiros_id_parceiro, p_leitura_equipamento_id_leitura, p_usuario_id_user
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Erro ao inserir alerta_equipamento: ' || SQLERRM);
    END inserir_alerta_equipamento;
END pkg_alerta_equipamento;
/

-- Pacote para a tabela EQUIPAMENTO

CREATE OR REPLACE PACKAGE pkg_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA EQUIPAMENTO
    PROCEDURE inserir_equipamento (
        p_id_equip              NUMBER,
        p_tipo_equip            VARCHAR2,
        p_dt_equip              DATE,
        p_parceiros_id_parceiro NUMBER
    );
END pkg_equipamento;
/

CREATE OR REPLACE PACKAGE BODY pkg_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA EQUIPAMENTO
    PROCEDURE inserir_equipamento (
        p_id_equip              NUMBER,
        p_tipo_equip            VARCHAR2,
        p_dt_equip              DATE,
        p_parceiros_id_parceiro NUMBER
    ) IS
    BEGIN
        INSERT INTO equipamento (
            id_equip, tipo_equip, dt_equip, parceiros_id_parceiro
        ) VALUES (
            p_id_equip, p_tipo_equip, p_dt_equip, p_parceiros_id_parceiro
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Erro ao inserir equipamento: ' || SQLERRM);
    END inserir_equipamento;
END pkg_equipamento;
/

-- Pacote para a tabela FUNCIONARIO

CREATE OR REPLACE PACKAGE pkg_funcionario AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA FUNCIONARIO
    PROCEDURE inserir_funcionario (
        p_id_func               NUMBER,
        p_nome_func             VARCHAR2,
        p_email_func            VARCHAR2,
        p_senha_func            NUMBER,
        p_parceiros_id_parceiro NUMBER
    );
END pkg_funcionario;
/

CREATE OR REPLACE PACKAGE BODY pkg_funcionario AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA FUNCIONARIO
    PROCEDURE inserir_funcionario (
        p_id_func               NUMBER,
        p_nome_func             VARCHAR2,
        p_email_func            VARCHAR2,
        p_senha_func            NUMBER,
        p_parceiros_id_parceiro NUMBER
    ) IS
    BEGIN
        INSERT INTO funcionario (
            id_func, nome_func, email_func, senha_func, parceiros_id_parceiro
        ) VALUES (
            p_id_func, p_nome_func, p_email_func, p_senha_func, p_parceiros_id_parceiro
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Erro ao inserir funcionario: ' || SQLERRM);
    END inserir_funcionario;
END pkg_funcionario;
/

-- Pacote para a tabela LEITURA_EQUIPAMENTO

CREATE OR REPLACE PACKAGE pkg_leitura_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA LEITURA EQUIPAMENTO
    PROCEDURE inserir_leitura_equipamento (
        p_id_leitura                 NUMBER,
        p_dt_leitura                 DATE,
        p_tipo_leitura               VARCHAR2,
        p_valor_leitura              NUMBER,
        p_local_equipamento_id_local NUMBER,
        p_parceiros_id_parceiro      NUMBER,
        p_usuario_id_user            NUMBER,
        p_equipamento_id_equip       NUMBER
    );
END pkg_leitura_equipamento;
/

CREATE OR REPLACE PACKAGE BODY pkg_leitura_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA LEITURA EQUIPAMENTO
    PROCEDURE inserir_leitura_equipamento (
        p_id_leitura                 NUMBER,
        p_dt_leitura                 DATE,
        p_tipo_leitura               VARCHAR2,
        p_valor_leitura              NUMBER,
        p_local_equipamento_id_local NUMBER,
        p_parceiros_id_parceiro      NUMBER,
        p_usuario_id_user            NUMBER,
        p_equipamento_id_equip       NUMBER
    ) IS
    BEGIN
        INSERT INTO leitura_equipamento (
            id_leitura, dt_leitura, tipo_leitura, valor_leitura, local_equipamento_id_local, parceiros_id_parceiro, usuario_id_user, equipamento_id_equip
        ) VALUES (
            p_id_leitura, p_dt_leitura, p_tipo_leitura, p_valor_leitura, p_local_equipamento_id_local, p_parceiros_id_parceiro, p_usuario_id_user, p_equipamento_id_equip
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20004, 'Erro ao inserir leitura_equipamento: ' || SQLERRM);
    END inserir_leitura_equipamento;
END pkg_leitura_equipamento;
/

-- Pacote para a tabela LOCAL_EQUIPAMENTO

CREATE OR REPLACE PACKAGE pkg_local_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA LOCAL_EQUIPAMENTO
    PROCEDURE inserir_local_equipamento (
        p_id_local        NUMBER,
        p_nome_local      VARCHAR2,
        p_latitude_local  VARCHAR2,
        p_longitude_local VARCHAR2
    );
END pkg_local_equipamento;
/

CREATE OR REPLACE PACKAGE BODY pkg_local_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA LOCAL_EQUIPAMENTO
    PROCEDURE inserir_local_equipamento (
        p_id_local        NUMBER,
        p_nome_local      VARCHAR2,
        p_latitude_local  VARCHAR2,
        p_longitude_local VARCHAR2
    ) IS
    BEGIN
        INSERT INTO local_equipamento (
            id_local, nome_local, latitude_local, longitude_local
        ) VALUES (
            p_id_local, p_nome_local, p_latitude_local, p_longitude_local
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20005, 'Erro ao inserir local_equipamento: ' || SQLERRM);
    END inserir_local_equipamento;
END pkg_local_equipamento;
/

-- Pacote para a tabela MANUTENCAO_EQUIPAMENTO

CREATE OR REPLACE PACKAGE pkg_manutencao_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA MANUTENCAO_EQUIPAMENTO
    PROCEDURE inserir_manutencao_equipamento (
        p_id_manut               NUMBER,
        p_dt_manut               DATE,
        p_tipo_manut             VARCHAR2,
        p_responsavel_manut      VARCHAR2,
        p_equipamento_id_equip   NUMBER,
        p_funcionario_id_func    NUMBER,
        p_relatorio_id_relatorio NUMBER,
        p_parceiros_id_parceiro  NUMBER
    );
END pkg_manutencao_equipamento;
/

CREATE OR REPLACE PACKAGE BODY pkg_manutencao_equipamento AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA MANUTENCAO_EQUIPAMENTO
    PROCEDURE inserir_manutencao_equipamento (
        p_id_manut               NUMBER,
        p_dt_manut               DATE,
        p_tipo_manut             VARCHAR2,
        p_responsavel_manut      VARCHAR2,
        p_equipamento_id_equip   NUMBER,
        p_funcionario_id_func    NUMBER,
        p_relatorio_id_relatorio NUMBER,
        p_parceiros_id_parceiro  NUMBER
    ) IS
    BEGIN
        INSERT INTO manutencao_equipamento (
            id_manut, dt_manut, tipo_manut, responsavel_manut, equipamento_id_equip, funcionario_id_func, relatorio_id_relatorio, parceiros_id_parceiro
        ) VALUES (
            p_id_manut, p_dt_manut, p_tipo_manut, p_responsavel_manut, p_equipamento_id_equip, p_funcionario_id_func, p_relatorio_id_relatorio, p_parceiros_id_parceiro
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20006, 'Erro ao inserir manutencao_equipamento: ' || SQLERRM);
    END inserir_manutencao_equipamento;
END pkg_manutencao_equipamento;
/

-- Pacote para a tabela PARCEIROS

CREATE OR REPLACE PACKAGE pkg_parceiros AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA PARCEIROS
    PROCEDURE inserir_parceiros (
        p_id_parceiro   NUMBER,
        p_nome_parc     VARCHAR2,
        p_cnpj_parc     CHAR,
        p_endereco_parc VARCHAR2,
        p_contato_parc  VARCHAR2,
        p_tipo_parc     VARCHAR2
    );
END pkg_parceiros;
/

CREATE OR REPLACE PACKAGE BODY pkg_parceiros AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA MANUTENCAO_EQUIPAMENTO
    PROCEDURE inserir_parceiros (
        p_id_parceiro   NUMBER,
        p_nome_parc     VARCHAR2,
        p_cnpj_parc     CHAR,
        p_endereco_parc VARCHAR2,
        p_contato_parc  VARCHAR2,
        p_tipo_parc     VARCHAR2
    ) IS
    BEGIN
        INSERT INTO parceiros (
            id_parceiro, nome_parc, cnpj_parc, endereco_parc, contato_parc, tipo_parc
        ) VALUES (
            p_id_parceiro, p_nome_parc, p_cnpj_parc, p_endereco_parc, p_contato_parc, p_tipo_parc
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20007, 'Erro ao inserir parceiros: ' || SQLERRM);
    END inserir_parceiros;
END pkg_parceiros;
/

-- Realizando TESTES com a procedure de INSERIR ALERTA_EQUIPAMENTO
BEGIN
    pkg_alerta_equipamento.inserir_alerta_equipamento(
        p_id_alerta => 1,
        p_dt_alerta => SYSDATE,
        p_nivel_alerta => 'Urgente',
        p_descr_alerta => 'Teste de inserção',
        p_status_alerta => 'Temperatura acima de 25 C',
        p_parceiros_id_parceiro => 1,
        p_leitura_equipamento_id_leitura => 1,
        p_usuario_id_user => 1
    );
END;
/
-- Verificar a inserção
SELECT * FROM alerta_equipamento WHERE id_alerta = 1;

-- Realizando TESTES com a procedure de INSERIR EQUIPAMENTO
BEGIN
    pkg_equipamento.inserir_equipamento(
        p_id_equip => 1,
        p_tipo_equip => 'Tipo1',
        p_dt_equip => SYSDATE,
        p_parceiros_id_parceiro => 101
    );
END;
/
-- Verificar a inserção
SELECT * FROM equipamento WHERE id_equip = 1;

-- Realizando TESTES com a procedure de INSERIR FUNCIONARIO
BEGIN
    pkg_funcionario.inserir_funcionario(
        p_id_func => 1,
        p_nome_func => 'João Silva',
        p_email_func => 'joao.silva@example.com',
        p_senha_func => 123456,
        p_parceiros_id_parceiro => 1001
    );
END;
/
-- Verificar a inserção
SELECT * FROM funcionario WHERE id_func = 1;

-- Realizando TESTES com a procedure de INSERIR LEITURA_EQUIPAMENTO
BEGIN
    pkg_leitura_equipamento.inserir_leitura_equipamento(
        p_id_leitura                 => 1,
        p_dt_leitura                 => SYSDATE,
        p_tipo_leitura               => 'Temperatura',
        p_valor_leitura              => 25.5,
        p_local_equipamento_id_local => 101,
        p_parceiros_id_parceiro      => 202,
        p_usuario_id_user            => 303,
        p_equipamento_id_equip       => 404
    );
END;
/
-- Verificar a inserção
SELECT * FROM leitura_equipamento WHERE id_leitura = 1;

-- Realizando TESTES com a procedure de INSERIR LOCAL_EQUIPAMENTO
BEGIN
    pkg_local_equipamento.inserir_local_equipamento(
        p_id_local => 1,
        p_nome_local => 'Local A',
        p_latitude_local => '12.3456',
        p_longitude_local => '65.4321'
    );
END;
/
-- Verificar a inserção
SELECT * FROM local_equipamento WHERE id_local = 1;

-- Realizando TESTES com a procedure de INSERIR MANUTENCAO_EQUIPAMENTO
BEGIN
    pkg_manutencao_equipamento.inserir_manutencao_equipamento(
        p_id_manut               => 1,
        p_dt_manut               => SYSDATE,
        p_tipo_manut             => 'Preventiva',
        p_responsavel_manut      => 'João Silva',
        p_equipamento_id_equip   => 101,
        p_funcionario_id_func    => 201,
        p_relatorio_id_relatorio => 301,
        p_parceiros_id_parceiro  => 401
    );
END;
/
-- Verificar a inserção
SELECT * FROM manutencao_equipamento WHERE id_manut = 1;

/*
INSERT INTO USUARIO VALUES (SEQ_ID_USER.nextval, 'Jhonn','jhonn@gmail', '4321');
INSERT INTO PARCEIROS VALUES (SEQ_ID_PARC.nextval,'VOAR','12345678912345', 'Rua teste, 012', '1234-1234','ONG');
INSERT INTO LOCAL_EQUIPAMENTO VALUES (SEQ_ID_LOCAL_EQUIP.nextval,'Maragogi','10102030', '102030');
INSERT INTO EQUIPAMENTO VALUES (SEQ_ID_EQUIP.nextval, 'Monitor de Temperatura', SYSDATE, SEQ_ID_PARC.currval);
INSERT INTO LEITURA_EQUIPAMENTO VALUES (SEQ_ID_LEITURA_EQUIP.nextval, SYSDATE, 'Temperatura', 9.99, SEQ_ID_LOCAL_EQUIP.currval, SEQ_ID_PARC.currval, SEQ_ID_USER.currval, SEQ_ID_EQUIP.currval);

SELECT * FROM USUARIO;
SELECT * FROM PARCEIROS;
SELECT * FROM LOCAL_EQUIPAMENTO;
SELECT * FROM EQUIPAMENTO;
SELECT * FROM LEITURA_EQUIPAMENTO;
*/