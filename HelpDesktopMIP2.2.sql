-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: helpdesk_mip
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.31-MariaDB

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
-- Table structure for table `tbl_listachamados`
--

DROP TABLE IF EXISTS `tbl_listachamados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_listachamados` (
  `id_chamados` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario_afetado` int(11) DEFAULT NULL,
  `id_tecnico` int(11) DEFAULT NULL,
  `id_problema` int(11) DEFAULT NULL,
  `descricao_chamado` text,
  `data_abertura` varchar(45) DEFAULT NULL,
  `data_fechamento` varchar(45) DEFAULT '0',
  `status` varchar(45) DEFAULT NULL,
  `contato` varchar(45) DEFAULT NULL,
  `solucao` text,
  `id_tecnico_fechou` int(11) DEFAULT '1',
  PRIMARY KEY (`id_chamados`),
  KEY `id_usuario_idx` (`id_usuario_afetado`),
  KEY `id_tecnico_idx` (`id_tecnico`),
  KEY `id_problema_idx` (`id_problema`),
  KEY `id_tecnico_fechou_idx` (`id_tecnico_fechou`),
  CONSTRAINT `id_problema` FOREIGN KEY (`id_problema`) REFERENCES `tbl_problema` (`id_problema`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tbl_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_tecnico_fechou` FOREIGN KEY (`id_tecnico_fechou`) REFERENCES `tbl_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario_afetado`) REFERENCES `tbl_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_usuario_afetado` FOREIGN KEY (`id_usuario_afetado`) REFERENCES `tbl_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_listachamados`
--

LOCK TABLES `tbl_listachamados` WRITE;
/*!40000 ALTER TABLE `tbl_listachamados` DISABLE KEYS */;
INSERT INTO `tbl_listachamados` VALUES (1,1000,1000,1,'Usuario solicita instalação do office','2018-10-28 22:18:17','2018-11-11 19:40:54','fechado','abellis@hotmail.com','Utilizado o instalador padrão do pacote office 2016',1000),(2,1000,1000,2,'Varios problemas relacionados a wifi.\nCabo de rede nao funciona','2018-10-28 22:18:17','2018-11-11 19:45:54','fechado','95473829 // email@email.com','Realizado procedimento padrao\n',1000),(4,1001,1000,1,'Usuario relata problemas ao entrar no site da unip','2018-11-01 07:14:07','2018-11-16 09:06:33','fechado','abellis@hotmail.com11','Configuração do proxy',1000),(6,1001,1000,1,'Descreva brevemente o problema do usuário','2018-11-01 07:17:01','0','aberto','abellis456','\'chamado aberto\'',1),(9,4444,1001,4,'Problema de conexão','2018-11-01 07:31:05','0','aberto','11 95422-4444','\'chamado aberto\'',1),(15,4444,1001,5,'Testando de novoa abertura de chamado','2018-11-01 07:40:11','2018-11-11 19:55:51','fechado','anderson@email.com','Realizado procedimento necessario',1001),(16,1001,1001,3,'Usuario relata tela azul','2018-11-01 07:57:07','0','aberto','hotmailemail@htomail.com','\'chamado aberto\'',1),(17,1001,1000,1,'Descreva brevemente o problema do usuário','2018-11-01 08:06:55','0','aberto','abellis456','\'chamado aberto\'',1),(18,4444,1001,3,'Usuário reporta que máquina não liga','2018-11-11 18:06:29','0','aberto','anderson@email.com // 4002-8922','\'chamado aberto\'',1),(19,1000,1001,4,'-Outlook não abre\n-Excel não abre','2018-11-11 18:08:41','2018-11-20 16:35:56','fechado','carlos@unip.com','Reinstalação do pacote office',1001),(20,1001,1001,1,'Instalar pacote office\nInstalar o chrome','2018-11-11 18:09:42','0','aberto','4002-8922','\'chamado aberto\'',1),(22,1000,1001,1,'instalar windows\nque esta pirata','2018-11-11 20:03:45','2018-11-11 20:05:16','fechado','dancheiracueca.com 40028922','REALIZA INSTALÇACÃO',1001),(25,1000,1001,2,'Mouse não funciona','2018-11-16 10:42:56','2018-11-16 11:09:18','fechado','email@email.com','Realizada a troca do mouse',1001),(26,1000,1001,2,'teclado quebrado e monitor','2018-11-16 10:50:15','2018-11-16 10:51:51','fechado','hotmail@email.com','realizada a troca do teclado',1001),(27,1000,1001,1,'Descreva brevemente o problema do usuário','2018-11-20 19:59:55','0','aberto','abellis456','Chamado ainda aberto. Sem solução.',1),(28,1001,1001,1,'Usuario relata problema no Windows','2018-11-20 20:09:17','0','aberto','anderson@unip.com','Chamado ainda aberto. Sem solução.',1),(31,1001,1001,1,'Descreva brevemente o problema do usuário','2018-11-20 20:32:01','0','aberto','Telefone ou email','Chamado ainda aberto. Sem solução.',1),(32,1001,1001,3,'a','2018-11-20 20:35:12','0','aberto','Telefone ou email','Chamado ainda aberto. Sem solução.',1);
/*!40000 ALTER TABLE `tbl_listachamados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_problema`
--

DROP TABLE IF EXISTS `tbl_problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_problema` (
  `id_problema` int(11) NOT NULL AUTO_INCREMENT,
  `descricao_problema` varchar(45) DEFAULT NULL,
  `tempo_sla` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_problema`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_problema`
--

LOCK TABLES `tbl_problema` WRITE;
/*!40000 ALTER TABLE `tbl_problema` DISABLE KEYS */;
INSERT INTO `tbl_problema` VALUES (1,'Instalação',8),(2,'Periférico',2),(3,'Hardware',6),(4,'Reparo no software',6),(5,'Outro',8);
/*!40000 ALTER TABLE `tbl_problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `sobrenome` varchar(45) DEFAULT NULL,
  `sexo` varchar(1) DEFAULT NULL,
  `data_nasc` varchar(45) DEFAULT NULL,
  `num_documento` varchar(45) DEFAULT NULL,
  `endereco` varchar(145) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `acesso` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `senha` varchar(45) DEFAULT NULL,
  `bloqueio` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4445 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_usuario`
--

LOCK TABLES `tbl_usuario` WRITE;
/*!40000 ALTER TABLE `tbl_usuario` DISABLE KEYS */;
INSERT INTO `tbl_usuario` VALUES (1,'Padrão','-','m','2000-12-12','000000000','-','00000000','1','admin','123',0),(1000,'Carlos','Alberto','m','1998-09-04','461666','Rua Joaquim','40028922','1','carlos','123',0),(1001,'Anderson','Belli','m','1999-02-02','3344442223','Jurandin de queiroz','30002111','3','abe','123',0),(4444,'Teste master','junior','f','2010-12-10','2223334','Av. dos imigrantes','45552223','4','teste','123',0);
/*!40000 ALTER TABLE `tbl_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_chamados`
--

DROP TABLE IF EXISTS `view_chamados`;
/*!50001 DROP VIEW IF EXISTS `view_chamados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_chamados` AS SELECT 
 1 AS `Id chamado`,
 1 AS `Id tecnico`,
 1 AS `Id usuario`,
 1 AS `Nome`,
 1 AS `Contato`,
 1 AS `Descrição`,
 1 AS `Data de abertura`,
 1 AS `Tempo SLA`,
 1 AS `Status`,
 1 AS `Solucao`,
 1 AS `Tecnico fechou`,
 1 AS `Data de fechamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_chamados_web`
--

DROP TABLE IF EXISTS `view_chamados_web`;
/*!50001 DROP VIEW IF EXISTS `view_chamados_web`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_chamados_web` AS SELECT 
 1 AS `id_chamados`,
 1 AS `Id tecnico`,
 1 AS `id_usuario`,
 1 AS `Nome`,
 1 AS `Contato`,
 1 AS `descricao`,
 1 AS `Data de abertura`,
 1 AS `Tempo SLA`,
 1 AS `Status`,
 1 AS `Solucao`,
 1 AS `Tecnico fechou`,
 1 AS `Data de fechamento`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_chamados`
--

/*!50001 DROP VIEW IF EXISTS `view_chamados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_chamados` AS select `l`.`id_chamados` AS `Id chamado`,`l`.`id_tecnico` AS `Id tecnico`,`l`.`id_usuario_afetado` AS `Id usuario`,`u`.`nome` AS `Nome`,`l`.`contato` AS `Contato`,`l`.`descricao_chamado` AS `Descrição`,`l`.`data_abertura` AS `Data de abertura`,`p`.`tempo_sla` AS `Tempo SLA`,`l`.`status` AS `Status`,`l`.`solucao` AS `Solucao`,`lc`.`nome` AS `Tecnico fechou`,`l`.`data_fechamento` AS `Data de fechamento` from (((`tbl_listachamados` `l` join `tbl_usuario` `u` on((`l`.`id_usuario_afetado` = `u`.`id_usuario`))) join `tbl_problema` `p` on((`l`.`id_problema` = `p`.`id_problema`))) left join `tbl_usuario` `lc` on((`lc`.`id_usuario` = `l`.`id_tecnico_fechou`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_chamados_web`
--

/*!50001 DROP VIEW IF EXISTS `view_chamados_web`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_chamados_web` AS select `l`.`id_chamados` AS `id_chamados`,`l`.`id_tecnico` AS `Id tecnico`,`l`.`id_usuario_afetado` AS `id_usuario`,`u`.`nome` AS `Nome`,`l`.`contato` AS `Contato`,`l`.`descricao_chamado` AS `descricao`,`l`.`data_abertura` AS `Data de abertura`,`p`.`tempo_sla` AS `Tempo SLA`,`l`.`status` AS `Status`,`l`.`solucao` AS `Solucao`,`lc`.`nome` AS `Tecnico fechou`,`l`.`data_fechamento` AS `Data de fechamento` from (((`tbl_listachamados` `l` join `tbl_usuario` `u` on((`l`.`id_usuario_afetado` = `u`.`id_usuario`))) join `tbl_problema` `p` on((`l`.`id_problema` = `p`.`id_problema`))) left join `tbl_usuario` `lc` on((`lc`.`id_usuario` = `l`.`id_tecnico_fechou`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26  0:12:39
