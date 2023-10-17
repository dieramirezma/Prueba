USE prflask;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: prflask
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `codigo_verificacion` VARCHAR(255),
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Usuario1','usuario1@example.com','pass1', 'abc'),(2,'Usuario2','usuario2@example.com','pass2', 'abc'),(3,'Usuario3','usuario3@example.com','pass3', 'abc');
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

-- Dump completed on 2023-09-09 15:24:54

-- para crear notas en el bloc (en proceso)
DROP TABLE IF EXISTS `grupoNotas`;
CREATE TABLE grupoNotas (
    idNota INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    numGrupo INT,
    porcentaje FLOAT,
    nota FLOAT,
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

SELECT * FROM grupoNotas;
DELETE FROM grupoNotas WHERE idNota < 100;

DROP TABLE IF EXISTS `respuestas_seguridad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `respuestas_seguridad` (
  `idRespuesta` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) DEFAULT NULL,
  `respuesta1` varchar(255) NOT NULL,
  `respuesta2` varchar(255) NOT NULL,
  `respuesta3` varchar(255) NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `respuestas_seguridad_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

SELECT * FROM respuestas_seguridad;   
--
-- Dumping data for table `respuestas_seguridad`
--

LOCK TABLES `respuestas_seguridad` WRITE;
/*!40000 ALTER TABLE `respuestas_seguridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestas_seguridad` ENABLE KEYS */;
UNLOCK TABLES;
-- CREACIÓN DE LOS EVENTOS DEL HORARIO --
DROP TABLE IF EXISTS `horario`;

CREATE TABLE horario (
    `idHorario` INT(11) NOT NULL AUTO_INCREMENT,
    `idUsuario` INT(11) NOT NULL,
    `evento` VARCHAR(255) NOT NULL,
    `horaInicio` INT(5) NOT NULL,
    `horaFin` INT(5) NOT NULL,
    `diaSemana` VARCHAR(15) NOT NULL,
    PRIMARY KEY (`idHorario`),
    FOREIGN KEY (`idUsuario`) REFERENCES usuario(`idUsuario`)
);

SELECT * FROM horario;
