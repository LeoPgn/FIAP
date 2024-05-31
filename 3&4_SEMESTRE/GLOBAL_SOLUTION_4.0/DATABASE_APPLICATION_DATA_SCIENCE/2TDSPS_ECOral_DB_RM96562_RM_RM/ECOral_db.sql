-- GLOBAL SOLUTION 4.0 | BLUE FUTURE - 2TDSPS - Projeto ECOral
-- INTEGRANTES: RM96562 - Leonardo Paganini | RM00000 - Jhonn Brandon | RM00000 - Regina Pompeo

-- CRIAÇÃO DAS TABELAS
CREATE TABLE USUARIO(
    id_usuario NUMBER (10) PRIMARY KEY,
    nome_usuario VARCHAR2(100),
    email_usuario VARCHAR2(100),
    senha_usuario VARCHAR2(40),
    tipo_usuario VARCHAR2(40)
);

CREATE TABLE EQUIPAMENTO(
    id_equipamento NUMBER (10) PRIMARY KEY,
    tipo_equipamento VARCHAR2 (40),
    dt_instalacao DATE,
    status_equipamento VARCHAR2(10)
);

CREATE TABLE LOCAL_EQUIPAMENT0(
    id_local NUMBER(10) PRIMARY KEY,
    nome_local VARCHAR2(100),
    latitude_local FLOAT(40),
    longitude_local FLOAT(40)
);

CREATE TABLE RELATORIO(
    id_relatorio NUMBER(10) PRIMARY KEY,
    descr_relatorio VARCHAR2(400),
    dt_relatorio DATE,
    responsavel_relatorio REFERENCES EQUIPAMENTO (id_equipamento),
    foto_relatorio
);