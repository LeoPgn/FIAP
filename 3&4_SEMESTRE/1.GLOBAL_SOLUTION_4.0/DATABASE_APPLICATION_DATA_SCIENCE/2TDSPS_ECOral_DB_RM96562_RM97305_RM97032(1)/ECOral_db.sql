--GLOBAL SOLUTION 4 | Turma: 2TDSPS | GRUPO: ECORAL
--INTEGRANTES: RM96562 - Leonardo Paganini | RM97305 - Jhonn Brandon | RM97032 - Regina Pompeo


-- IMPORTANTE: SIGA AS INSTRUÇÕES DE EXECUÇÃO PARA UMA MELHOR EXECUÇÃO DO CÓDIGO! --

-- Neste capitulo abaixo, criaremos as tabelas conforme a necessidade do software
-- Execute da linha 10 até a linha 210 para certificar a exclusão e executar as tabelas e sequences

DROP TABLE ALERTA_EQUIPAMENTO CASCADE CONSTRAINTS;
DROP TABLE EQUIPAMENTO CASCADE CONSTRAINTS;
DROP TABLE FUNCIONARIO CASCADE CONSTRAINTS;
DROP TABLE LEITURA_EQUIPAMENTO CASCADE CONSTRAINTS;
DROP TABLE LOCAL_EQUIPAMENTO CASCADE CONSTRAINTS;
DROP TABLE MANUTENCAO_EQUIPAMENTO CASCADE CONSTRAINTS;
DROP TABLE PARCEIROS CASCADE CONSTRAINTS;
DROP TABLE RELATORIO CASCADE CONSTRAINTS;
DROP TABLE USUARIO CASCADE CONSTRAINTS;
DROP TABLE AUDIT_LOG CASCADE CONSTRAINTS;

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

CREATE TABLE audit_log (
    id_log         NUMBER(10) PRIMARY KEY,
    table_name     VARCHAR2(50) NOT NULL,
    operation      VARCHAR2(10) NOT NULL,
    altered_by     VARCHAR2(100) NOT NULL,
    altered_on     DATE NOT NULL,
    old_data       VARCHAR2(4000),
    new_data       VARCHAR2(4000)
);

DROP SEQUENCE SEQ_ID_USER;
DROP SEQUENCE SEQ_ID_PARC;
DROP SEQUENCE SEQ_ID_LEITURA_EQUIP;
DROP SEQUENCE SEQ_ID_LOCAL_EQUIP;
DROP SEQUENCE SEQ_ID_EQUIP;
DROP SEQUENCE SEQ_ID_FUNC;
DROP SEQUENCE SEQ_ID_RELAT;
DROP SEQUENCE SEQ_ID_MANUT;
DROP SEQUENCE SEQ_ID_ALERTA;
DROP SEQUENCE SEQ_AUDIT_LOG;

CREATE SEQUENCE SEQ_ID_USER START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_PARC START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_LEITURA_EQUIP START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_LOCAL_EQUIP START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_EQUIP START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_FUNC START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_RELAT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_MANUT START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_ID_ALERTA START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE SEQ_AUDIT_LOG START WITH 1 INCREMENT BY 1;

--Neste capitulo abaixo, criaremos as chaves estrangeiras conforme a necessidade dos relacionamentos entre as tabelas
-- Execute as linhas até a linha 210 para executar as chaves estrangeiras

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
-- Execute da linha 203 até a linha 542 para executar os packages e suas procedures

-- Pacote para a tabela USUARIO
CREATE OR REPLACE PACKAGE pkg_usuario AS
    PROCEDURE inserir_usuario (
        p_id_user    NUMBER,
        p_nome_user  VARCHAR2,
        p_email_user VARCHAR2,
        p_senha_user VARCHAR2
    );
END pkg_usuario;
/
CREATE OR REPLACE PACKAGE BODY pkg_usuario AS
    PROCEDURE inserir_usuario (
        p_id_user    NUMBER,
        p_nome_user  VARCHAR2,
        p_email_user VARCHAR2,
        p_senha_user VARCHAR2
    ) IS
    BEGIN
        INSERT INTO usuario (
            id_user, nome_user, email_user, senha_user
        ) VALUES (
            p_id_user, p_nome_user, p_email_user, p_senha_user
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20009, 'Erro ao inserir usuario: ' || SQLERRM);
    END inserir_usuario;
END pkg_usuario;
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

CREATE OR REPLACE PACKAGE pkg_relatorio AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA RELATORIO
    PROCEDURE inserir_relatorio(
        p_id_relatorio         NUMBER,
        p_descr_relatorio      VARCHAR2,
        p_dt_relatorio         DATE,
        p_imagem_relatorio     BLOB,
        p_funcionario_id_func  NUMBER,
        p_equipamento_id_equip NUMBER
    );
END pkg_relatorio;
/
CREATE OR REPLACE PACKAGE BODY pkg_relatorio AS
    -- PROCEDURE QUE INSERE DADOS NA TABELA RELATORIO
    PROCEDURE inserir_relatorio (
        p_id_relatorio         NUMBER,
        p_descr_relatorio      VARCHAR2,
        p_dt_relatorio         DATE,
        p_imagem_relatorio     BLOB,
        p_funcionario_id_func  NUMBER,
        p_equipamento_id_equip NUMBER
    ) IS
    BEGIN
        INSERT INTO relatorio (
            id_relatorio, descr_relatorio, dt_relatorio, imagem_relatorio, funcionario_id_func, equipamento_id_equip
        ) VALUES (
            p_id_relatorio, p_descr_relatorio, p_dt_relatorio, p_imagem_relatorio, p_funcionario_id_func, p_equipamento_id_equip
        );
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20008, 'Erro ao inserir relatorio: ' || SQLERRM);
    END inserir_relatorio;
END pkg_relatorio;
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

-- NESTA SEÇÃO A PARTIR DA LINHA 543 REALIZAREMOS TESTES DOS INSERTS NAS PROCEDURES

-- Realizando TESTES com a procedure de INSERIR USUARIO
BEGIN
    pkg_usuario.inserir_usuario(
        p_id_user    => SEQ_ID_USER.nextval,
        p_nome_user  => 'João Silva', --INSIRA O NOME QUE DESEJA
        p_email_user => 'joao.silva@example.com', -- INSIRA O EMAIL QUE DESEJA
        p_senha_user => 'senha123' -- INSIRA A SENHA DESEJADA
    );
END;
/
-- Verificar a inserção
SELECT * FROM usuario;

-- Realizando TESTES com a procedure de INSERIR PARCEIRO
BEGIN
    pkg_parceiros.inserir_parceiros(
        p_id_parceiro   => SEQ_ID_PARC.nextval,
        p_nome_parc     => 'ONG PINGUINS SC', -- INSIRA O NOME DO PARCEIRO
        p_cnpj_parc     => '12345678901234', -- INSIRA O CNPJ DE 14 DIGITOS DO PARCEIRO
        p_endereco_parc => 'Rua Teste, 123', -- INSIRA O ENDERECO DO PARCEIRO
        p_contato_parc  => '11953589300', -- INSIRA O CONTATO DO PARCEIRO
        p_tipo_parc     => 'ONG' -- INSIRA O TIPO DE PARCEIRO
    );
END;
/
-- Verificar a inserção
SELECT * FROM parceiros;

-- Realizando TESTES com a procedure de INSERIR LOCAL_EQUIPAMENTO
BEGIN
    pkg_local_equipamento.inserir_local_equipamento(
        p_id_local => SEQ_ID_LOCAL_EQUIP.nextval,
        p_nome_local => 'Local A', -- INSIRA O LOCAL DESEJADO DA INSTALACAO DO EQUIP
        p_latitude_local => '12.3456', -- INSIRA A LATITUDE DO EQUIP
        p_longitude_local => '65.4321' -- INSIRA A LONGITUDE DO EQUIP
    );
END;
/
-- Verificar a inserção
SELECT * FROM local_equipamento;

-- Realizando TESTES com a procedure de INSERIR EQUIPAMENTO
BEGIN
    pkg_equipamento.inserir_equipamento(
        p_id_equip => SEQ_ID_EQUIP.nextval,
        p_tipo_equip => 'Tipo1', -- DESCREVA O EQUIPAMENTO DE MONITORAMENTO
        p_dt_equip => SYSDATE,
        p_parceiros_id_parceiro => SEQ_ID_PARC.currval
    );
END;
/
-- Verificar a inserção
SELECT * FROM equipamento;

-- Realizando TESTES com a procedure de INSERIR LEITURA_EQUIPAMENTO
BEGIN
    pkg_leitura_equipamento.inserir_leitura_equipamento(
        p_id_leitura                 => SEQ_ID_LEITURA_EQUIP.nextval,
        p_dt_leitura                 => SYSDATE,
        p_tipo_leitura               => 'Salinidade',
        p_valor_leitura              => 9.99,
        p_local_equipamento_id_local => SEQ_ID_LOCAL_EQUIP.currval,
        p_parceiros_id_parceiro      => SEQ_ID_PARC.currval,
        p_usuario_id_user            => SEQ_ID_USER.currval,
        p_equipamento_id_equip       => SEQ_ID_EQUIP.currval
    );
END;
/
-- Verificar a inserção
SELECT * FROM leitura_equipamento;

-- Realizando TESTES com a procedure de INSERIR FUNCIONARIO
BEGIN
    pkg_funcionario.inserir_funcionario(
        p_id_func => SEQ_ID_FUNC.nextval,
        p_nome_func => 'João Silva', -- INSIRA O NOME DO FUNCIONARIO DO PARCEIRO
        p_email_func => 'joao.silva@example.com', -- INSIRA O EMAIL DO FUNCIONARIO
        p_senha_func => '123456', --INSIRA A SENHA DO FUNCIONARIO
        p_parceiros_id_parceiro => SEQ_ID_PARC.currval
    );
END;
/
-- Verificar a inserção
SELECT * FROM funcionario;

-- Realizando TESTES com a procedure de INSERIR RELATORIO
BEGIN
    pkg_relatorio.inserir_relatorio(
        p_id_relatorio         => SEQ_ID_RELAT.nextval,
        p_descr_relatorio      => 'Relatório de Teste',
        p_dt_relatorio         => SYSDATE,
        p_imagem_relatorio     => null, -- DEIXAR NULO, OPCAO PARA MELHORIA DO APP
        p_funcionario_id_func  => SEQ_ID_FUNC.currval,
        p_equipamento_id_equip => SEQ_ID_EQUIP.currval
    );
END;
/
-- Verificando a inserção
SELECT * FROM relatorio;

-- Realizando TESTES com a procedure de INSERIR MANUTENCAO_EQUIPAMENTO
BEGIN
    pkg_manutencao_equipamento.inserir_manutencao_equipamento(
        p_id_manut => SEQ_ID_MANUT.nextval,
        p_dt_manut => SYSDATE,
        p_tipo_manut => 'Troca de Sensor', -- INSIRA O TIPO DE MANUTENCAO REALIZADA PELO FUNCIONARIO
        p_responsavel_manut => 'Jhonn Brandon', -- NOME DO RESPONSAVEL DA MANUTENCAO
        p_equipamento_id_equip => SEQ_ID_EQUIP.currval,
        p_funcionario_id_func => SEQ_ID_FUNC.currval,
        p_relatorio_id_relatorio => SEQ_ID_RELAT.currval,
        p_parceiros_id_parceiro => SEQ_ID_PARC.currval
    );
END;
/
-- Verificar a inserção
SELECT * FROM manutencao_equipamento;

-- Realizando TESTES com a procedure de INSERIR ALERTA_EQUIPAMENTO
BEGIN
    pkg_alerta_equipamento.inserir_alerta_equipamento(
        p_id_alerta => SEQ_ID_ALERTA.nextval,
        p_dt_alerta => SYSDATE,
        p_nivel_alerta => 'Urgente', -- INSIRA O NIVEL DE ALERTA
        p_descr_alerta => 'Teste de inserção', -- INSIRA A DESCRICAO DO ALERTA
        p_status_alerta => 'Ativo', -- INSIRA O STATUS DO ALERTA
        p_parceiros_id_parceiro => SEQ_ID_PARC.currval,
        p_leitura_equipamento_id_leitura => SEQ_ID_LEITURA_EQUIP.currval,
        p_usuario_id_user => SEQ_ID_USER.currval
    );
END;
/
-- Verificar a inserção
SELECT * FROM alerta_equipamento;

-- NESTA SECAO CRIAMOS TRIGGERS PARA MONITORAR ALTERACOES NAS TABELAS USUARIO E FUNCIONARIO

-- TRIGGER MONITORANDO INSERTS DA TABELA FUNCIONARIO
CREATE OR REPLACE TRIGGER trg_audit_funcionario
AFTER INSERT OR UPDATE OR DELETE ON funcionario
FOR EACH ROW
DECLARE
    v_old_data VARCHAR2(4000);
    v_new_data VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_new_data := 'id_func=' || :NEW.id_func ||
                      ', nome_func=' || :NEW.nome_func ||
                      ', email_func=' || :NEW.email_func ||
                      ', senha_func=' || :NEW.senha_func ||
                      ', parceiros_id_parceiro=' || :NEW.parceiros_id_parceiro;
        INSERT INTO audit_log (
            id_log, table_name, operation, altered_by, altered_on, old_data, new_data
        ) VALUES (
            SEQ_AUDIT_LOG.NEXTVAL, 'funcionario', 'INSERT', 'system_user', SYSDATE, NULL, v_new_data
        );
    ELSIF UPDATING THEN -- DEIXAMOS OS OUTROS METODOS CRUD PARA MELHORIAS, POREM NAO SERAO USADOS AGORA
        v_old_data := 'id_func=' || :OLD.id_func ||
                      ', nome_func=' || :OLD.nome_func ||
                      ', email_func=' || :OLD.email_func ||
                      ', senha_func=' || :OLD.senha_func ||
                      ', parceiros_id_parceiro=' || :OLD.parceiros_id_parceiro;
        v_new_data := 'id_func=' || :NEW.id_func ||
                      ', nome_func=' || :NEW.nome_func ||
                      ', email_func=' || :NEW.email_func ||
                      ', senha_func=' || :NEW.senha_func ||
                      ', parceiros_id_parceiro=' || :NEW.parceiros_id_parceiro;
        INSERT INTO audit_log (
            id_log, table_name, operation, altered_by, altered_on, old_data, new_data
        ) VALUES (
            SEQ_AUDIT_LOG.NEXTVAL, 'funcionario', 'UPDATE', 'system_user', SYSDATE, v_old_data, v_new_data
        );
    ELSIF DELETING THEN -- DEIXAMOS OS OUTROS METODOS CRUD PARA MELHORIAS, POREM NAO SERAO USADOS AGORA
        v_old_data := 'id_func=' || :OLD.id_func ||
                      ', nome_func=' || :OLD.nome_func ||
                      ', email_func=' || :OLD.email_func ||
                      ', senha_func=' || :OLD.senha_func ||
                      ', parceiros_id_parceiro=' || :OLD.parceiros_id_parceiro;
        INSERT INTO audit_log (
            id_log, table_name, operation, altered_by, altered_on, old_data, new_data
        ) VALUES (
            SEQ_AUDIT_LOG.NEXTVAL, 'funcionario', 'DELETE', 'system_user', SYSDATE, v_old_data, NULL
        );
    END IF;
END;
/

-- REALIZE O TESTE INSERINDO UM NOVO FUNCIONARIO
BEGIN
    pkg_funcionario.inserir_funcionario(
        p_id_func => SEQ_ID_FUNC.nextval,
        p_nome_func => 'João Silva', -- INSIRA O NOME DO FUNCIONARIO DO PARCEIRO
        p_email_func => 'joao.silva@example.com', -- INSIRA O EMAIL DO FUNCIONARIO
        p_senha_func => '123456', --INSIRA A SENHA DO FUNCIONARIO
        p_parceiros_id_parceiro => SEQ_ID_PARC.currval
    );
END;
/
-- AGORA VEJA SE REGISTROU NA TABELA DE AUDITORIA
SELECT * FROM audit_log;

CREATE OR REPLACE TRIGGER trg_audit_usuario
AFTER INSERT OR UPDATE OR DELETE ON usuario
FOR EACH ROW
DECLARE
    v_old_data VARCHAR2(4000);
    v_new_data VARCHAR2(4000);
BEGIN
    IF INSERTING THEN
        v_new_data := 'id_user=' || :NEW.id_user ||
                      ', nome_user=' || :NEW.nome_user ||
                      ', email_user=' || :NEW.email_user ||
                      ', senha_user=' || :NEW.senha_user;
        INSERT INTO audit_log (
            id_log, table_name, operation, altered_by, altered_on, old_data, new_data
        ) VALUES (
            SEQ_AUDIT_LOG.NEXTVAL, 'usuario', 'INSERT', 'system_user', SYSDATE, NULL, v_new_data
        );
    ELSIF UPDATING THEN
        v_old_data := 'id_user=' || :OLD.id_user ||
                      ', nome_user=' || :OLD.nome_user ||
                      ', email_user=' || :OLD.email_user ||
                      ', senha_user=' || :OLD.senha_user;
        v_new_data := 'id_user=' || :NEW.id_user ||
                      ', nome_user=' || :NEW.nome_user ||
                      ', email_user=' || :NEW.email_user ||
                      ', senha_user=' || :NEW.senha_user;
        INSERT INTO audit_log (
            id_log, table_name, operation, altered_by, altered_on, old_data, new_data
        ) VALUES (
            SEQ_AUDIT_LOG.NEXTVAL, 'usuario', 'UPDATE', 'system_user', SYSDATE, v_old_data, v_new_data
        );
    ELSIF DELETING THEN
        v_old_data := 'id_user=' || :OLD.id_user ||
                      ', nome_user=' || :OLD.nome_user ||
                      ', email_user=' || :OLD.email_user ||
                      ', senha_user=' || :OLD.senha_user;
        INSERT INTO audit_log (
            id_log, table_name, operation, altered_by, altered_on, old_data, new_data
        ) VALUES (
            SEQ_AUDIT_LOG.NEXTVAL, 'usuario', 'DELETE', 'system_user', SYSDATE, v_old_data, NULL
        );
    END IF;
END;
/

-- AGORA VEJA SE REGISTROU NA TABELA DE AUDITORIA
SELECT * FROM audit_log;