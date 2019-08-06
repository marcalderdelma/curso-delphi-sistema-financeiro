

/* SISTEMA FINACEIRO */

CREATE DATABASE financeiro;
USE financeiro;

CREATE TABLE usuario(
	idusuario INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	login VARCHAR(20) NOT NULL,
	senha VARCHAR(20) NOT NULL,
	data_cadastro DATE NOT NULL,
	status CHAR(1) NOT NULL
);


CREATE TABLE caixa(
	idcaixa INT AUTO_INCREMENT PRIMARY KEY,
	numero_doc VARCHAR(20) NOT NULL,
	descricao VARCHAR(200),
	tipo CHAR(1) NOT NULL,
	valor FLOAT(10,2) NOT NULL,
	data_cadastro date NOT NULL
);

CREATE TABLE EMPRESA (
idempresa INTEGER PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
telefone VARCHAR(15) NOT NULL,
tipo CHAR(1)
);

CREATE TABLE contas_receber(
	idcontas_rec INT AUTO_INCREMENT PRIMARY KEY,
	numero_doc VARCHAR(20) NOT NULL,
	descricao varchar(200),
	qtd_parcela INT(2) NOT NULL,
	--vlr_parcela FLOAT(10,2) NOT NULL,
	vlr_venda FLOAT(10,2) NOT NULL,
	vlr_abatido FLOAT(10,2) NOT NULL,
	data_venda DATE NOT NULL,
	--data_vencimento DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	status CHAR(1) NOT NULL,
	data_recebimento DATE,
	id_empresa INTEGER NOT NULL
);

CREATE TABLE contas_pagar(
	idcontas_pag INT AUTO_INCREMENT PRIMARY KEY,
	numero_doc VARCHAR(20) NOT NULL,
	descricao varchar(200),
	qtd_parcela INT(2) NOT NULL,
	--vlr_parcela FLOAT(10,2) NOT NULL,
	vlr_compra FLOAT(10,2) NOT NULL,
	vlr_abatido FLOAT(10,2) NOT NULL,
	data_compra DATE NOT NULL,
	--data_vencimento DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	status CHAR(1) NOT NULL,
	data_pagamento DATE,
	id_empresa INTEGER NOT NULL
);


ALTER TABLE contas_pagar ADD CONSTRAINT FK_CONTASPAG_EMPRESA FOREIGN KEY(id_empresa) REFERENCES EMPRESA (idempresa);
ALTER TABLE contas_receber ADD CONSTRAINT FK_CONTASREC_EMPRESA FOREIGN KEY(id_empresa) REFERENCES EMPRESA (idempresa);


/*INSERT INTO `contas_pagar`(idcontas_pag,numero_doc,descricao,qtd_parcela,vlr_parcela,vlr_compra,vlr_abatido,data_compra,data_vencimento,data_cadastro,status,data_pagamento) VALUES (1,'0001','Compra de Insumos básicos',3,250.00,750.00,0.00,'2019-07-12','2019-07-29','2019-07-19','0','2019-12-30'),(2,'0002','Compra de materiais higienicos',2,100.00,200.00,100.00,'2019-04-19','2019-04-25','2019-07-19','0','2019-04-22'),(3,'003','teste3',5,180.00,900.00,0.00,'2019-07-19','2019-07-19','2019-07-19','0','2019-07-19');
INSERT INTO `contas_receber`() VALUES (1,'001','Venda de suporte.',2,300.00,600.00,300.00,'2019-07-19','2019-07-26','2019-07-19','0','2019-07-23'),(2,'002','Teste de venda',0,0.00,0.00,0.00,'2019-07-19','2019-07-26','2019-07-19','0','2019-07-23'),(3,'003','teste3',4,125.00,500.00,0.00,'2019-07-19','2019-07-19','2019-07-19','0','2019-07-19'),(4,'001','teste',2,50.00,100.00,0.00,'2019-07-19','2019-07-19','2019-08-01','0','2019-07-19');
INSERT INTO `usuario` VALUES() (1014,'Marc Alder','mad','Hgyr¨$%D','2019-07-17','1'),(1015,'Alexander Matzner','alex','12iyi*','2019-07-17','1'),(1016,'Alex Tubarão','tubarao','tudA56','2019-07-17','1'),(1017,'José Antônio','zeca','hdsoewew','2019-07-17','1'),(1018,'Jean Lucca','lucca','jhgikdto','2019-07-17','1'),(1019,'Eliezer Delma','el_delma','7594%&&*¨*%¨&(KM cgd','2019-07-18','1'),(1020,'Urie','magrelo','4875','2019-07-18','1'),(1021,'TESTE','teste','teste','2019-08-01','1');
INSERT INTO `caixa` VALUES() (1,'1102','Lançamentos teste no caixa','D',1590.50,'2019-07-18'),(108,'0002','Teste','C',100.00,'2019-07-18'),(109,'010','teste','D',200.00,'2019-08-01');
*/



