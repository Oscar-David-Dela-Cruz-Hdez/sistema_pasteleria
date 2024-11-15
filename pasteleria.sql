/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.24-MariaDB : Database - pasteleria
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pasteleria` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `pasteleria`;

/*Table structure for table `tblbitacora` */

DROP TABLE IF EXISTS `tblbitacora`;

CREATE TABLE `tblbitacora` (
  `idHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` int(11) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `objeto` varchar(50) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `tabla` varchar(50) DEFAULT NULL,
  KEY `idHistorial` (`idHistorial`),
  KEY `Usuario` (`Usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tblbitacora` */

LOCK TABLES `tblbitacora` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblcompradetalle` */

DROP TABLE IF EXISTS `tblcompradetalle`;

CREATE TABLE `tblcompradetalle` (
  `idCompraDetalle` int(11) DEFAULT NULL,
  `idCompra` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `Precio_prod` float DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  KEY `tblcompradetalle` (`idCompra`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `tblcompradetalle` FOREIGN KEY (`idCompra`) REFERENCES `tblcompras` (`idCompra`),
  CONSTRAINT `tblcompradetalle_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `tblproducto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tblcompradetalle` */

LOCK TABLES `tblcompradetalle` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblcompras` */

DROP TABLE IF EXISTS `tblcompras`;

CREATE TABLE `tblcompras` (
  `idCompra` int(11) NOT NULL AUTO_INCREMENT,
  `Total` int(11) DEFAULT NULL,
  `fechaCompra` date DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `idcliente` (`idcliente`),
  CONSTRAINT `tblcompras_ibfk_1` FOREIGN KEY (`idcliente`) REFERENCES `tbluser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tblcompras` */

LOCK TABLES `tblcompras` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblcostosenvio` */

DROP TABLE IF EXISTS `tblcostosenvio`;

CREATE TABLE `tblcostosenvio` (
  `intIdCostoEnv` int(11) NOT NULL AUTO_INCREMENT,
  `vchDireccion` varchar(100) DEFAULT NULL,
  `fltCosto` float DEFAULT NULL,
  PRIMARY KEY (`intIdCostoEnv`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `tblcostosenvio` */

LOCK TABLES `tblcostosenvio` WRITE;

insert  into `tblcostosenvio`(`intIdCostoEnv`,`vchDireccion`,`fltCosto`) values (8,'Col. Rojo Gomez',20),(9,'Col Parque de Poblamiento',25),(10,'Col los Prados',30);

UNLOCK TABLES;

/*Table structure for table `tbldetallepedido` */

DROP TABLE IF EXISTS `tbldetallepedido`;

CREATE TABLE `tbldetallepedido` (
  `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT,
  `idPedido` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Subtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDetallePedido`),
  KEY `tbldetallepedido_ibfk_1` (`idPedido`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `tbldetallepedido_ibfk_1` FOREIGN KEY (`idPedido`) REFERENCES `tblpedidos` (`idPedidos`),
  CONSTRAINT `tbldetallepedido_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `tblproducto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbldetallepedido` */

LOCK TABLES `tbldetallepedido` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblpedidos` */

DROP TABLE IF EXISTS `tblpedidos`;

CREATE TABLE `tblpedidos` (
  `idPedidos` int(11) NOT NULL AUTO_INCREMENT,
  `Total` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `idDireccion` int(11) DEFAULT NULL,
  `idCostoEnvio` int(11) DEFAULT NULL,
  `TotalPago` float DEFAULT NULL,
  PRIMARY KEY (`idPedidos`),
  KEY `idDireccion` (`idDireccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tblpedidos` */

LOCK TABLES `tblpedidos` WRITE;

UNLOCK TABLES;

/*Table structure for table `tblproducto` */

DROP TABLE IF EXISTS `tblproducto`;

CREATE TABLE `tblproducto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) DEFAULT NULL,
  `idSabor` int(11) DEFAULT NULL,
  `Precio` float DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `tipo` (`tipo`),
  KEY `idSabor` (`idSabor`),
  CONSTRAINT `tblproducto_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tbltipopastel` (`idTipo`),
  CONSTRAINT `tblproducto_ibfk_2` FOREIGN KEY (`idSabor`) REFERENCES `tblsabor` (`idSabor`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tblproducto` */

LOCK TABLES `tblproducto` WRITE;

insert  into `tblproducto`(`idProducto`,`Nombre`,`idSabor`,`Precio`,`imagen`,`tipo`) values (199,'e3ij3e',1,400,'45.jpg',5),(201,'pancho',1,12,'45.jpg',5),(207,'Pastel de otoño',3,300,'Bolo Ferrero Rocher.jpeg',5),(208,'Pastel de otoño',3,260,'Bolo Ferrero Rocher.jpeg',5),(211,'Pastel de durazno',1,339,'15.jpeg',4),(212,'maraia ',5,90,'',5),(213,'pakage',3,500,'descarga.jpg',4),(214,'chocolate',3,500,'1.jpg',4),(215,'vainil',2,250,'2.jpg',4);

UNLOCK TABLES;

/*Table structure for table `tblsabor` */

DROP TABLE IF EXISTS `tblsabor`;

CREATE TABLE `tblsabor` (
  `idSabor` int(11) NOT NULL AUTO_INCREMENT,
  `vchSabor` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idSabor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tblsabor` */

LOCK TABLES `tblsabor` WRITE;

insert  into `tblsabor`(`idSabor`,`vchSabor`) values (1,'Durazno'),(2,'Vanilla'),(3,'Chocolate'),(4,'Pepino'),(5,'Yogur fresa'),(6,'Coco'),(7,'Durazno');

UNLOCK TABLES;

/*Table structure for table `tbltipopastel` */

DROP TABLE IF EXISTS `tbltipopastel`;

CREATE TABLE `tbltipopastel` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `NombreTipo` varchar(150) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbltipopastel` */

LOCK TABLES `tbltipopastel` WRITE;

insert  into `tbltipopastel`(`idTipo`,`NombreTipo`) values (4,'tres leches '),(5,'pan normal');

UNLOCK TABLES;

/*Table structure for table `tbluser` */

DROP TABLE IF EXISTS `tbluser`;

CREATE TABLE `tbluser` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `vchnombre` varchar(100) NOT NULL,
  `vchapaterno` varchar(100) NOT NULL,
  `vchamaterno` varchar(100) NOT NULL,
  `vchCorreo` varchar(100) DEFAULT NULL,
  `vchtelefono` varchar(10) NOT NULL,
  `vchUsuario` varchar(100) DEFAULT NULL,
  `vchpassword` varchar(100) NOT NULL,
  `vchTipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  KEY `idcliente` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbluser` */

LOCK TABLES `tbluser` WRITE;

insert  into `tbluser`(`idUser`,`vchnombre`,`vchapaterno`,`vchamaterno`,`vchCorreo`,`vchtelefono`,`vchUsuario`,`vchpassword`,`vchTipo`) values (40,'nico ed','diaz ed','sa','dhj','727727282','vh','202cb962ac59075b964b07152d234b70','administrador'),(42,'wendy','Martinez','Hernandezs','chanp@gmail.com','7723491211','jaja','664a1b50ea33727a8ad898e8c1f5f079','E'),(43,'Mauricioco','diaz','Hernandez','nico@gmail.com','7713491211','adm','b09c600fddc573f117449b3723f23d64','A'),(45,'juana Berenice','Diaz','hernandez','qwqww@gmail.com','7713554706','juan','a92aa00256afcf106436c3ff3ab47e51','E'),(46,'Pepito','cncncC','xncncn','pepito@gmail.com','7713554708','clt','42e7ef3662a4459c9c98f897c1ffee4e','C'),(47,'juan','martinez','hernandez','qwqww@gmail.com','7713554706','juan','202cb962ac59075b964b07152d234b70','C'),(48,'juan','dkkdkdk','martinez','qwqww@gmail.com','7713554706','juan','8542516f8870173d7d1daba1daaaf0a1','C'),(49,'juan','dkkdkdk','martinez','qwqww@gmail.com','7713554706','juan','8542516f8870173d7d1daba1daaaf0a1','C'),(50,'pepe','dmdkmd','dkmwkdm','mdk@gmail.com','','12','c20ad4d76fe97759aa27a0c99bff6710','C'),(51,'pepe','dmdkmd','dkmwkdm','mdk@gmail.com','','12','c20ad4d76fe97759aa27a0c99bff6710','C'),(52,'123','Nico','Diaz','Hernandez','niin@gmail','7713491211','202cb962ac59075b964b07152d234b70','C'),(53,'123','Nico','Diaz','Hernandez','niin@gmail','7713491211','202cb962ac59075b964b07152d234b70','C'),(54,'Nico','Diaz','Hernandez','niin@gmail.com','7713491211','123','202cb962ac59075b964b07152d234b70','C'),(55,'Adrian','Diaz','Hernandez','adri@gmail.com','7712333222','adr','de7c54d99428fb909bef013577070f0d','C'),(56,'Adrian','Diaz','Hernandez','adri@gmail.com','7712333222','adr','de7c54d99428fb909bef013577070f0d','C'),(57,'eduardo ','castro','hernandez','eduard@gmail.com','8881881881','edu','379ef4bd50c30e261ccfb18dfc626d9f','C'),(58,'eduardo ','castro','hernandez','eduard@gmail.com','8881881881','edu','379ef4bd50c30e261ccfb18dfc626d9f','C'),(59,'Francisco','Hernandez','Sanchez','fraky@gamail.com','7712113456','piki','202cb962ac59075b964b07152d234b70','C'),(60,'Juan','martinez','hernandez','juan@gmail.com','771234111','123','202cb962ac59075b964b07152d234b70','C'),(61,'juan','martinez','hernandez','qwqww@gmail.com','7713554706','juanq11','f5737d25829e95b9c234b7fa06af8736','C'),(62,'lalo','ybyu','byy','cjnjn@gmail.com','7713554706','lalo','202cb962ac59075b964b07152d234b70','C'),(63,'Nicolás antonio','martinez','diaz','qwqww@gmail.com','7713554706','toni','202cb962ac59075b964b07152d234b70','C'),(64,'fefefef','cd','cwfd','ss@gmail.com','7713491211','perdo','202cb962ac59075b964b07152d234b70','C');

UNLOCK TABLES;

/*Table structure for table `tblventadetalle` */

DROP TABLE IF EXISTS `tblventadetalle`;

CREATE TABLE `tblventadetalle` (
  `intIdVentaD` int(11) NOT NULL AUTO_INCREMENT,
  `intIdVentas` int(11) DEFAULT NULL,
  `intIdProducto` int(11) DEFAULT NULL,
  `fltPrecio` float DEFAULT NULL,
  `intCantidad` int(11) DEFAULT NULL,
  `fltSubtotal` float DEFAULT NULL,
  PRIMARY KEY (`intIdVentaD`),
  KEY `intIdProducto` (`intIdProducto`),
  KEY `intIdVentas` (`intIdVentas`),
  CONSTRAINT `tblventadetalle_ibfk_1` FOREIGN KEY (`intIdProducto`) REFERENCES `tblproducto` (`idProducto`),
  CONSTRAINT `tblventadetalle_ibfk_2` FOREIGN KEY (`intIdVentas`) REFERENCES `tblventas` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tblventadetalle` */

LOCK TABLES `tblventadetalle` WRITE;

insert  into `tblventadetalle`(`intIdVentaD`,`intIdVentas`,`intIdProducto`,`fltPrecio`,`intCantidad`,`fltSubtotal`) values (102,69,211,339,1,339),(103,70,211,339,1,339),(104,71,211,339,1,339),(105,72,211,339,1,339),(106,73,211,339,1,339),(107,74,211,339,1,339),(108,75,211,339,1,339),(109,75,213,500,1,500),(110,75,215,250,1,250),(111,76,213,500,1,500),(112,77,213,500,1,500),(113,78,213,500,1,500),(114,79,214,500,1,500),(115,80,213,500,1,500),(116,81,213,500,1,500);

UNLOCK TABLES;

/*Table structure for table `tblventas` */

DROP TABLE IF EXISTS `tblventas`;

CREATE TABLE `tblventas` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `dtFecha` datetime DEFAULT NULL,
  `fltTotalVenta` float DEFAULT NULL,
  `intIdCliente` int(11) DEFAULT NULL,
  `intIdCostoEnv` int(11) DEFAULT NULL,
  `fltCostoEnv` float DEFAULT NULL,
  `intIdResponsable` int(11) DEFAULT NULL,
  `fltTotalGeneral` float DEFAULT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `intIdResponsable` (`intIdResponsable`),
  KEY `intIdCostoEnv` (`intIdCostoEnv`),
  KEY `intIdCliente` (`intIdCliente`),
  CONSTRAINT `tblventas_ibfk_2` FOREIGN KEY (`intIdCliente`) REFERENCES `tbluser` (`idUser`),
  CONSTRAINT `tblventas_ibfk_3` FOREIGN KEY (`intIdCostoEnv`) REFERENCES `tblcostosenvio` (`intIdCostoEnv`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tblventas` */

LOCK TABLES `tblventas` WRITE;

insert  into `tblventas`(`idVenta`,`dtFecha`,`fltTotalVenta`,`intIdCliente`,`intIdCostoEnv`,`fltCostoEnv`,`intIdResponsable`,`fltTotalGeneral`) values (54,'2023-07-24 20:23:11',150,46,8,20,NULL,170),(55,'2023-07-24 20:31:20',100,46,8,20,NULL,120),(56,'2023-07-24 20:59:53',100,46,8,20,NULL,120),(57,'2023-07-24 23:38:41',50,46,8,20,NULL,70),(58,'2023-07-25 00:21:22',50,55,8,20,NULL,70),(59,'2023-07-25 00:24:47',50,57,8,20,NULL,70),(60,'2023-07-25 02:24:28',150,59,8,20,NULL,170),(61,'2023-07-25 05:08:44',150,43,8,20,NULL,170),(62,'2023-07-25 09:38:53',150,54,8,20,NULL,170),(63,'2023-07-25 10:34:46',240,54,8,20,NULL,260),(64,'2023-07-25 16:24:09',240,54,8,20,NULL,260),(65,'2023-07-26 23:56:53',150,46,9,25,NULL,175),(66,'2023-07-26 23:58:17',150,46,9,25,NULL,175),(67,'2023-07-27 00:21:25',150,46,9,25,NULL,175),(68,'2023-07-27 01:02:58',150,46,8,20,NULL,170),(69,'2023-09-05 00:33:52',339,43,8,20,NULL,359),(70,'2023-09-05 00:34:24',339,43,8,20,NULL,359),(71,'2023-09-05 00:35:02',339,43,8,20,NULL,359),(72,'2023-09-05 00:37:23',339,43,8,20,NULL,359),(73,'2023-09-05 13:39:22',339,43,8,20,NULL,359),(74,'2023-09-05 19:15:14',339,43,8,20,NULL,359),(75,'2023-09-06 07:20:51',1089,43,8,20,NULL,1109),(76,'2023-09-06 07:22:52',500,47,8,20,NULL,520),(77,'2023-09-06 07:35:30',500,47,8,20,NULL,520),(78,'2023-09-06 07:37:38',500,62,8,20,NULL,520),(79,'2023-09-06 16:29:36',500,43,8,20,NULL,520),(80,'2023-09-18 19:32:49',500,43,8,20,NULL,520),(81,'2023-09-19 05:38:22',500,43,8,20,NULL,520),(82,'2023-09-30 12:54:38',0,43,8,20,NULL,20);

UNLOCK TABLES;

/* Trigger structure for table `tblproducto` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_DeletePro` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_DeletePro` BEFORE DELETE ON `tblproducto` FOR EACH ROW BEGIN
delete from `tblventadetalle` where `intIdProducto`=old.`idProducto`;
 
    END */$$


DELIMITER ;

/* Procedure structure for procedure `consulta_all_productos` */

/*!50003 DROP PROCEDURE IF EXISTS  `consulta_all_productos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`12`@`%` PROCEDURE `consulta_all_productos`()
BEGIN
		SELECT `idProducto`,`Nombre`,`vchSabor` AS idSabor,`Precio`,`imagen`,`NombreTipo` AS tipo
FROM `tblproducto`,`tblsabor`,`tbltipopastel`
WHERE `tblproducto`.`idSabor`=`tblsabor`.`idSabor` AND
`tblproducto`.`tipo`= tbltipopastel.`idTipo`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ObtenerNombreImagen` */

/*!50003 DROP PROCEDURE IF EXISTS  `ObtenerNombreImagen` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerNombreImagen`(IN productoId INT)
BEGIN
    SELECT imagen FROM tblproducto WHERE idProducto = productoId;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spVentaDetalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `spVentaDetalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spVentaDetalle`(IN idV INT,idP INT, IN precio FLOAT,IN cant INT,IN subtotal FLOAT)
BEGIN
INSERT INTO tblventadetalle(intIdVentas,intIdProducto,fltPrecio,intCantidad,fltSubtotal)
VALUES(idV,idP,precio,cant,subtotal);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `spVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `spVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spVentas`(IN idClient INT, IN TotalV FLOAT,IN idCost INT ,IN CostoE FLOAT  ,IN TotalG FLOAT,OUT idV INT)
BEGIN
   
    INSERT INTO tblventas(dtFecha,fltTotalVenta,intIdCliente,intIdCostoEnv,fltCostoEnv,fltTotalGeneral)
				VALUES(NOW(),TotalV,idClient,idCost,CostoE,TotalG) ;
		 SELECT MAX(idVenta) INTO idV FROM tblventas;
				
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_access` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_access` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_access`(in us varchar(100),in pas varchar(100))
BEGIN
SELECT `vchUsuario`,`vchpassword`,`vchTipo` FROM `tbluser`
WHERE `vchUsuario`=us AND `vchpassword`=md5(pas);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_Comprar` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_Comprar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Comprar`(in  TOTAL int,in PRECIO float,in IdClt int(11))
BEGIN
INSERT INTO `tblcompras`(`Total`,`fechaCompra`,`idcliente`)
 VALUES(TOTAL,fecha,IdClt);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ConsultaPastelCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ConsultaPastelCategoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ConsultaPastelCategoria`(in IdTipo int)
BEGIN
    SELECT Nombre,Precio,imagen,tipo FROM tblproducto WHERE tipo=IdTipo ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ConsultaProductoTipoPanNormal` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ConsultaProductoTipoPanNormal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ConsultaProductoTipoPanNormal`()
BEGIN
		SELECT `idProducto`,`Nombre`,`vchSabor` AS idSabor,`Precio`,`imagen`,`NombreTipo` AS tipo
FROM `tblproducto`,`tblsabor`,`tbltipopastel`
WHERE `tblproducto`.`idSabor`=`tblsabor`.`idSabor` AND  
`tblproducto`.`tipo`=`tbltipopastel`.`idTipo` AND  `tbltipopastel`.`NombreTipo`='Pan normal';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ConsultaProductoTipoTresLeches` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ConsultaProductoTipoTresLeches` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ConsultaProductoTipoTresLeches`()
BEGIN
		SELECT `idProducto`,`Nombre`,`vchSabor` AS idSabor,`Precio`,`imagen`,`NombreTipo` AS tipo
FROM `tblproducto`,`tblsabor`,`tbltipopastel`
WHERE `tblproducto`.`idSabor`=`tblsabor`.`idSabor` AND  
`tblproducto`.`tipo`=`tbltipopastel`.`idTipo` AND  `tbltipopastel`.`NombreTipo`='tres leches';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ConsultaSabor` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ConsultaSabor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ConsultaSabor`()
BEGIN
SELECT idSabor,vchSabor FROM tblsabor;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_ConsultaTipo` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_ConsultaTipo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_ConsultaTipo`()
BEGIN
SELECT idTipo,NombreTipo FROM tbltipopastel;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_DeleteClient` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_DeleteClient` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_DeleteClient`(in id varchar(100))
BEGIN
delete from `tbluser` WHERE `idUser`=id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_DeleteEmployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_DeleteEmployee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_DeleteEmployee`(IN id VARCHAR(100))
BEGIN
DELETE FROM `tbluser` WHERE `idUser`=id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_DeleteProduct` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_DeleteProduct` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_DeleteProduct`(in N int)
BEGIN
delete from tblproducto where idproducto=N;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_InsertClient` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_InsertClient` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_InsertClient`(in nombre varchar(100),in AP varchar(100),in AM varchar(100),in Corr varchar(50),IN NoTel VARCHAR(10),in Usuario varchar(100),IN pass VARCHAR(100))
BEGIN
INSERT INTO `tblUser`(vchnombre,vchapaterno,vchamaterno,`vchCorreo`,vchtelefono,vchUsuario,vchpassword,`vchTipo`)
		VALUES (nombre,AP,AM,Corr,NoTel,Usuario,MD5(pass),'C');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_InsertEmployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_InsertEmployee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_InsertEmployee`(IN nombre VARCHAR(100),IN AP VARCHAR(100),IN AM VARCHAR(100),IN Corr VARCHAR(50),IN NoTel VARCHAR(10),IN Usuario VARCHAR(100),IN pass VARCHAR(100))
BEGIN
INSERT INTO `tblUser`(vchnombre,vchapaterno,vchamaterno,`vchCorreo`,vchtelefono,vchUsuario,vchpassword,`vchTipo`)
		VALUES (nombre,AP,AM,Corr,NoTel,Usuario,MD5(pass),'E');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_InsertProduct` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_InsertProduct` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_InsertProduct`(in Nom varchar(100),in idSab int,in Pre float,In img varchar(100),in tip varchar(100))
BEGIN
INSERT INTO tblproducto(Nombre,idSabor,Precio,imagen,tipo)values (Nom,idSab,Pre,img,tip);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_Insert_VentaDetalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_Insert_VentaDetalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Insert_VentaDetalle`(in idcomp INT,in idPro int,in prec float,in cant int,in sub int)
BEGIN
insert into `tblcompradetalle`(`idCompra`,`idProducto`,`Precio_prod`,`Cantidad`,`Subtotal`)
values(idcomp,idPro,prec,cant,sub);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_listaDireccion` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_listaDireccion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_listaDireccion`()
BEGIN
	SELECT * FROM tblcostosenvio;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_ProdxSaborXtipo` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_ProdxSaborXtipo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ProdxSaborXtipo`()
BEGIN
SELECT `idProducto`, `Nombre`,`vchSabor` AS Sabor,
`Precio` ,`imagen`,`NombreTipo` AS Tipo
FROM `tblproducto`,`tblsabor`,`tbltipopastel`
WHERE `tblproducto`.`idSabor`=`tblsabor`.`idSabor`
AND `tblproducto`.`tipo`=`tbltipopastel`.`idTipo`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_QueryClient` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_QueryClient` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_QueryClient`()
BEGIN
select * from `tbluser`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_QueryEmployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_QueryEmployee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_QueryEmployee`()
BEGIN
SELECT * FROM `tbluser` where `vchTipo`='E';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_QueryProductXSabor` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_QueryProductXSabor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_QueryProductXSabor`()
BEGIN
SELECT tblsabor.vchSabor FROM tblproducto,`tblsabor` WHERE `tblproducto`.idSabor=`tblsabor`.`idSabor`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_queryTipo_C` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_queryTipo_C` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_queryTipo_C`( in tipo varchar(100))
BEGIN
SELECT * FROM `tbluser` WHERE `vchTipo`=tipo;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_Seleciona_loc_ByID` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_Seleciona_loc_ByID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Seleciona_loc_ByID`(IN ID INT )
BEGIN
 SELECT * FROM `tblcostosenvio` WHERE `intIdCostoEnv`=ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_Trae_Usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_Trae_Usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_Trae_Usuario`(IN us VARCHAR(100),IN pas VARCHAR(100))
BEGIN
	SELECT * FROM `tbluser`
WHERE `vchUsuario`=us AND `vchpassword`=MD5(pas);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_UpdateClient` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_UpdateClient` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_UpdateClient`(IN nombre VARCHAR(100),IN AP VARCHAR(100),IN AM VARCHAR(100),IN Corr VARCHAR(50),IN NoTel VARCHAR(10),IN Usuario VARCHAR(100),IN pass VARCHAR(100),in Us int)
BEGIN
Update  `tblUser` set vchnombre=nombre,vchapaterno=AP,vchamaterno=AM,`vchCorreo`=Corr,vchtelefono=NoTel,vchUsuario=Usuario, vchpassword=MD5(pass) where `idUser`=Us;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Sp_UpdateEmployee` */

/*!50003 DROP PROCEDURE IF EXISTS  `Sp_UpdateEmployee` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Sp_UpdateEmployee`(IN nombre VARCHAR(100),IN AP VARCHAR(100),IN AM VARCHAR(100),IN Corr VARCHAR(50),IN NoTel VARCHAR(10),IN Idusers INT(11))
BEGIN
UPDATE  `tblUser` SET vchnombre=nombre,vchapaterno=AP,vchamaterno=AM,`vchCorreo`=Corr,vchtelefono=NoTel WHERE `idUser`=Idusers;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SP_UpdateXPro` */

/*!50003 DROP PROCEDURE IF EXISTS  `SP_UpdateXPro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_UpdateXPro`(IN Nom VARCHAR(100),IN idSab INT,IN Pre FLOAT,IN img VARCHAR(100),IN tip VARCHAR(100),in id int )
BEGIN
update tblproducto  set Nombre=Nom,idSabor=idSab,Precio=Pre,imagen=img,tipo=tip 
 where idProducto=id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `traeCliente_By_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `traeCliente_By_id` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `traeCliente_By_id`(in id int )
BEGIN
	SELECT * FROM `tbluser` WHERE  idUser=id;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `traeEmpleadoBy_ID` */

/*!50003 DROP PROCEDURE IF EXISTS  `traeEmpleadoBy_ID` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `traeEmpleadoBy_ID`(in ID int)
BEGIN
	SELECT * FROM `tbluser` WHERE `idUser`=ID;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `traeProductoid` */

/*!50003 DROP PROCEDURE IF EXISTS  `traeProductoid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `traeProductoid`(in id int)
BEGIN
SELECT * FROM `tblproducto` WHERE idProducto=id;
    END */$$
DELIMITER ;

/*Table structure for table `viewticketventa` */

DROP TABLE IF EXISTS `viewticketventa`;

/*!50001 DROP VIEW IF EXISTS `viewticketventa` */;
/*!50001 DROP TABLE IF EXISTS `viewticketventa` */;

/*!50001 CREATE TABLE  `viewticketventa`(
 `Numero_Venta` int(11) ,
 `Pago_Final` float ,
 `Producto` varchar(100) ,
 `Cliente` varchar(100) ,
 `Fecha` datetime 
)*/;

/*View structure for view viewticketventa */

/*!50001 DROP TABLE IF EXISTS `viewticketventa` */;
/*!50001 DROP VIEW IF EXISTS `viewticketventa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewticketventa` AS (select `tblventas`.`idVenta` AS `Numero_Venta`,`tblventas`.`fltTotalGeneral` AS `Pago_Final`,`tblproducto`.`Nombre` AS `Producto`,`tbluser`.`vchnombre` AS `Cliente`,`tblventas`.`dtFecha` AS `Fecha` from (((`tblventas` join `tblproducto`) join `tbluser`) join `tblventadetalle` on(`tblventas`.`idVenta` = `tblventadetalle`.`intIdVentas` and `tblventadetalle`.`intIdProducto` = `tblproducto`.`idProducto` and `tblventas`.`intIdCliente` = `tbluser`.`idUser`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
