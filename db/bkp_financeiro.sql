-- MySQL dump 10.13  Distrib 5.7.20, for Win32 (AMD64)
--
-- Host: localhost    Database: financeiro
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caixa`
--

DROP TABLE IF EXISTS `caixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caixa` (
  `idcaixa` int(11) NOT NULL AUTO_INCREMENT,
  `numero_doc` varchar(20) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `tipo` char(1) NOT NULL,
  `valor` float(10,2) NOT NULL,
  `data_cadastro` date NOT NULL,
  PRIMARY KEY (`idcaixa`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caixa`
--

LOCK TABLES `caixa` WRITE;
/*!40000 ALTER TABLE `caixa` DISABLE KEYS */;
INSERT INTO `caixa` VALUES (1,'1102','Lançamentos teste no caixa','D',1590.50,'2019-07-18'),(108,'0002','Teste','C',100.00,'2019-07-18'),(109,'010','teste','D',200.00,'2019-08-01');
/*!40000 ALTER TABLE `caixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas_pagar`
--

DROP TABLE IF EXISTS `contas_pagar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contas_pagar` (
  `idcontas_pag` int(11) NOT NULL AUTO_INCREMENT,
  `numero_doc` varchar(20) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `qtd_parcela` int(2) NOT NULL,
  `vlr_parcela` float(10,2) NOT NULL,
  `vlr_compra` float(10,2) NOT NULL,
  `vlr_abatido` float(10,2) NOT NULL,
  `data_compra` date NOT NULL,
  `data_vencimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `status` char(1) NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  PRIMARY KEY (`idcontas_pag`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas_pagar`
--

LOCK TABLES `contas_pagar` WRITE;
/*!40000 ALTER TABLE `contas_pagar` DISABLE KEYS */;
INSERT INTO `contas_pagar` VALUES (1,'0001','Compra de Insumos básicos',3,250.00,750.00,0.00,'2019-07-12','2019-07-29','2019-07-19','0','2019-12-30'),(2,'0002','Compra de materiais higienicos',2,100.00,200.00,100.00,'2019-04-19','2019-04-25','2019-07-19','0','2019-04-22'),(3,'003','teste3',5,180.00,900.00,0.00,'2019-07-19','2019-07-19','2019-07-19','0','2019-07-19');
/*!40000 ALTER TABLE `contas_pagar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contas_receber`
--

DROP TABLE IF EXISTS `contas_receber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contas_receber` (
  `idcontas_rec` int(11) NOT NULL AUTO_INCREMENT,
  `numero_doc` varchar(20) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `qtd_parcela` int(2) NOT NULL,
  `vlr_parcela` float(10,2) NOT NULL,
  `vlr_venda` float(10,2) NOT NULL,
  `vlr_abatido` float(10,2) NOT NULL,
  `data_venda` date NOT NULL,
  `data_vencimento` date NOT NULL,
  `data_cadastro` date NOT NULL,
  `status` char(1) NOT NULL,
  `data_recebimento` date DEFAULT NULL,
  PRIMARY KEY (`idcontas_rec`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contas_receber`
--

LOCK TABLES `contas_receber` WRITE;
/*!40000 ALTER TABLE `contas_receber` DISABLE KEYS */;
INSERT INTO `contas_receber` VALUES (1,'001','Venda de suporte.',2,300.00,600.00,300.00,'2019-07-19','2019-07-26','2019-07-19','0','2019-07-23'),(2,'002','Teste de venda',0,0.00,0.00,0.00,'2019-07-19','2019-07-26','2019-07-19','0','2019-07-23'),(3,'003','teste3',4,125.00,500.00,0.00,'2019-07-19','2019-07-19','2019-07-19','0','2019-07-19'),(4,'001','teste',2,50.00,100.00,0.00,'2019-07-19','2019-07-19','2019-08-01','0','2019-07-19');
/*!40000 ALTER TABLE `contas_receber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `data_cadastro` date NOT NULL,
  `status` char(1) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1014,'Marc Alder','mad','Hgyr¨$%D','2019-07-17','1'),(1015,'Alexander Matzner','alex','12iyi*','2019-07-17','1'),(1016,'Alex Tubarão','tubarao','tudA56','2019-07-17','1'),(1017,'José Antônio','zeca','hdsoewew','2019-07-17','1'),(1018,'Jean Lucca','lucca','jhgikdto','2019-07-17','1'),(1019,'Eliezer Delma','el_delma','7594%&&*¨*%¨&(KM cgd','2019-07-18','1'),(1020,'Urie','magrelo','4875','2019-07-18','1'),(1021,'TESTE','teste','teste','2019-08-01','1');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-02 10:42:18
