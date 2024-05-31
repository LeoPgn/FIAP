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
    dt_instalacao DATE NOT NULL,
    status_equipamento VARCHAR2(10),
    proprietario REFERENCES PARCEIROS(nome_parceiro),
    local_equipamento REFERENCES LOCAL_EQUIPAMENT0(id_local)
);

CREATE TABLE LOCAL_EQUIPAMENT0(
    id_local NUMBER(10) PRIMARY KEY,
    nome_local VARCHAR2(100),
    latitude_local VARCHAR2(40),
    longitude_local VARCHAR2(40)
);

CREATE TABLE RELATORIO(
    id_relatorio NUMBER(10) PRIMARY KEY,
    descr_relatorio VARCHAR2(500),
    dt_relatorio DATE,
    imagem_relatorio BLOB,
    responsavel_relatorio REFERENCES USUARIO (id_usuario),
    id_equipamento REFERENCES EQUIPAMENTO (id_equipamento),
    responsavel_manutencao REFERENCES MANUTENCAO_EQUIPAMENTO(responsavel_manutencao)--ALTERAR DE ACORDO COM A TABELA INFORMADA NO WHATSAPP
);

CREATE TABLE LEITURA_EQUIPAMENTO(
    id_leitura NUMBER(10) PRIMARY KEY,
    dt_leitura DATE NOT NULL,
    tipo_leitura VARCHAR2(40),
    valor_leitura NUMBER(3,2),
    id_equipamento REFERENCES EQUIPAMENTO(id_equipamento),
    id_local REFERENCES LOCAL_EQUIPAMENT0(id_local),
    proprietario REFERENCES PARCEIROS(nome_parceiro)
);

CREATE TABLE MANUTENCAO_EQUIPAMENTO(
    id_manutencao NUMBER(10) PRIMARY KEY,
    dt_manutencao DATE NOT NULL,
    tipo_manutencao VARCHAR2(100),
    responsavel_manutencao REFERENCES USUARIO(id_usuario),
    id_equipamento REFERENCES EQUIPAMENTO(id_equipamento),
    proprietario REFERENCES PARCEIROS(nome_parceiro)
);

CREATE TABLE ALERTA_EQUIPAMENTO(
    id_alerta NUMBER(10) PRIMARY KEY,
    dt_alerta DATE NOT NULL,
    nivel_alerta VARCHAR2(40),
    descr_alerta VARCHAR2(400),
    status_alerta VARCHAR2(40),
    alerta_parceiro REFERENCES PARCEIROS(id_parceiro),
    alerta_usuario REFERENCES USUARIO(id_usuario)
);

CREATE TABLE PARCEIROS(
    id_parceiro NUMBER(10) PRIMARY KEY,
    nome_parceiro VARCHAR2(100),
    cnpj_parceiro VARCHAR2(100),
    endereco_parceiro VARCHAR2(100),
    contato_parceiro VARCHAR2(11),
    tipo_parceiro VARCHAR2(40)
);