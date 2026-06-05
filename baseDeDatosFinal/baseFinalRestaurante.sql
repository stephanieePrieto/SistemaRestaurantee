-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurante
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacen` (
  `idMateriaPrima` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `stock` decimal(10,2) NOT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `stockMinimo` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`idMateriaPrima`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
INSERT INTO `almacen` VALUES (1,'Base Pizza Queso',50.00,'Porciones',10.00),(2,'Pepperoni',100.00,'Porciones',15.00),(3,'Vegetales Mixtos',50.00,'Porciones',5.00),(4,'Mix Hawaiano (Piña/Jamón)',50.00,'Porciones',8.00),(5,'Mix Carnes Frías',50.00,'Porciones',5.00),(6,'Pollo BBQ',50.00,'Porciones',5.00),(7,'Salsa Alfredo',50.00,'Porciones',5.00),(8,'Mix Deluxe',50.00,'Porciones',5.00),(9,'Mix 4 Quesos',50.00,'Porciones',5.00),(10,'Camarones Frescos',50.00,'Porciones',10.00),(11,'Masa Forma Corazón',50.00,'Porciones',5.00),(12,'Masa Forma Estrella',50.00,'Porciones',5.00),(13,'Macarrones con Queso',50.00,'Porciones',5.00),(14,'Especialidad Pingüino',50.00,'Porciones',5.00),(15,'Base Pizza Dulce',50.00,'Porciones',5.00),(16,'Carne de Taco',50.00,'Porciones',5.00),(17,'Salsa Volcán Picante',50.00,'Porciones',5.00),(18,'Granos de Café',100.00,'Tazas',20.00),(19,'Granizado Azul',30.00,'Vasos',5.00),(20,'Naranjas Frescas',40.00,'Porciones',10.00),(21,'Helado de Fresa (Malteada)',30.00,'Porciones',5.00),(22,'Helado de Chocolate (Batido)',30.00,'Porciones',5.00),(23,'Soda de Lima',60.00,'Latas',10.00),(24,'Masa de Brownie',25.00,'Rebanadas',5.00),(25,'Cheesecake de Fresa',20.00,'Rebanadas',4.00),(26,'Cupcake Chocolate',30.00,'Unidades',5.00),(27,'Cupcake Fresa',30.00,'Unidades',5.00),(28,'Pastel de Chocolate',15.00,'Rebanadas',3.00),(29,'Pay de Manzana',15.00,'Rebanadas',3.00),(30,'Pay de Zanahoria',15.00,'Rebanadas',3.00),(31,'Rol de Canela',25.00,'Unidades',5.00),(32,'Helado para Sundae',40.00,'Porciones',8.00),(33,'Alitas Crudas',50.00,'Porciones',10.00),(34,'Aros de Cebolla Congelados',50.00,'Porciones',5.00),(35,'Lechuga y Frescos',40.00,'Porciones',10.00),(36,'Repollo Fresco',40.00,'Porciones',5.00),(37,'Nuggets Congelados',50.00,'Porciones',10.00),(38,'Pan Baguette de Ajo',40.00,'Porciones',8.00),(39,'Pan Baguette con Queso',40.00,'Porciones',8.00),(40,'Papas Congeladas',25.00,'Porciones',10.00),(41,'Ingredientes Sopa del Día',20.00,'Porciones',5.00),(42,'Masa para Calzone',30.00,'Porciones',5.00);
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencias`
--

DROP TABLE IF EXISTS `asistencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias` (
  `idAsistencia` int NOT NULL AUTO_INCREMENT,
  `fechaEntrada` datetime NOT NULL,
  `fechaSalida` datetime DEFAULT NULL,
  `idEmpleado` int NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `horas_trabajadas` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idAsistencia`),
  KEY `fk_asistencia_empleado` (`idEmpleado`),
  CONSTRAINT `fk_asistencia_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias`
--

LOCK TABLES `asistencias` WRITE;
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
INSERT INTO `asistencias` VALUES (1,'2026-04-27 07:00:00','2026-04-27 14:00:00',1,'Incompleto','07:00 hrs'),(2,'2026-04-27 07:00:00','2026-04-27 15:00:00',2,'Cumplió','08:00 hrs'),(3,'2026-06-01 08:00:00',NULL,2,'Activo',NULL),(4,'2026-06-01 09:00:00','2026-06-01 17:00:00',4,'Cumplió','08:00 hrs'),(6,'2026-06-01 08:00:00','2026-06-01 10:30:00',6,'Cumplió','02:30 hrs'),(7,'2026-06-02 07:00:00','2026-06-02 15:00:00',1,'Cumplió','08:00 hrs'),(8,'2026-06-03 07:00:00','2026-06-03 15:00:00',2,'Cumplió','08:00 hrs');
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoriasmenu`
--

DROP TABLE IF EXISTS `categoriasmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoriasmenu` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoriasmenu`
--

LOCK TABLES `categoriasmenu` WRITE;
/*!40000 ALTER TABLE `categoriasmenu` DISABLE KEYS */;
INSERT INTO `categoriasmenu` VALUES (1,'Cocina'),(2,'Bebidas'),(3,'Postres'),(4,'Extras'),(5,'Especiales');
/*!40000 ALTER TABLE `categoriasmenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` varchar(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('CP001','Angel Nieto','1234567890'),('CP002','Diego Sosa','2281098745'),('CP003','Ricardo Hernandez','5543210987'),('CP004','Stephanie Prieto','2285551234'),('CP005','Stephanie',NULL),('CP006','Angel Nietoooo',NULL),('CP007','Angel Nietoooou',NULL),('CP008','Stephanie','1234567890'),('CP009','Ricardo','1234567890');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallepedidos`
--

DROP TABLE IF EXISTS `detallepedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallepedidos` (
  `idDetalle` int NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `estadoPlatillo` varchar(50) DEFAULT 'Normal',
  `idPedido` int NOT NULL,
  `idPlatillo` int NOT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `fk_detalle_pedido` (`idPedido`),
  KEY `fk_detalle_platillo` (`idPlatillo`),
  CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`),
  CONSTRAINT `fk_detalle_platillo` FOREIGN KEY (`idPlatillo`) REFERENCES `platillos` (`idPlatillo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallepedidos`
--

LOCK TABLES `detallepedidos` WRITE;
/*!40000 ALTER TABLE `detallepedidos` DISABLE KEYS */;
INSERT INTO `detallepedidos` VALUES (13,1,'Normal',2,1),(14,1,'Normal',2,4),(15,1,'Normal',2,8),(16,1,'Normal',1,1),(17,1,'Normal',1,2),(19,1,'sin quueso',3,1),(20,1,'sin quueso',3,5),(21,3,'sin quueso',3,39);
/*!40000 ALTER TABLE `detallepedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idEmpleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idRol` int DEFAULT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `usuario` (`usuario`),
  KEY `idRol` (`idRol`),
  CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Stephanie Gerente','admin','123',1),(2,'Juan Mesero','mesero1','123',2),(3,'Pinguino Chef','chef1','123',3),(4,'Ana Cajera','cajero1','123',4),(5,'Beto Recepcion','recepcion1','123',5),(6,'BegoPro','mesero2','124',2);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas_tickets`
--

DROP TABLE IF EXISTS `facturas_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas_tickets` (
  `idDocumento` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `folioElectronico` varchar(100) DEFAULT NULL,
  `idPago` int NOT NULL,
  PRIMARY KEY (`idDocumento`),
  UNIQUE KEY `folioElectronico` (`folioElectronico`),
  KEY `fk_documento_pago` (`idPago`),
  CONSTRAINT `fk_documento_pago` FOREIGN KEY (`idPago`) REFERENCES `pagos` (`idPago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas_tickets`
--

LOCK TABLES `facturas_tickets` WRITE;
/*!40000 ALTER TABLE `facturas_tickets` DISABLE KEYS */;
INSERT INTO `facturas_tickets` VALUES (1,'Ticket','TICK-2026-0001',1),(2,'Factura','UUID-74BD-4A89-BC12-98F1D32A',3);
/*!40000 ALTER TABLE `facturas_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventariomateriaprima`
--

DROP TABLE IF EXISTS `inventariomateriaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventariomateriaprima` (
  `idMateriaPrima` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `stock` decimal(10,2) NOT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMateriaPrima`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventariomateriaprima`
--

LOCK TABLES `inventariomateriaprima` WRITE;
/*!40000 ALTER TABLE `inventariomateriaprima` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventariomateriaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listaespera`
--

DROP TABLE IF EXISTS `listaespera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listaespera` (
  `idEspera` int NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(100) DEFAULT NULL,
  `pax` int DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `horaLlegada` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(20) DEFAULT 'EN_ESPERA',
  PRIMARY KEY (`idEspera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listaespera`
--

LOCK TABLES `listaespera` WRITE;
/*!40000 ALTER TABLE `listaespera` DISABLE KEYS */;
INSERT INTO `listaespera` VALUES (1,'Angel Nieto',4,'123124421','2026-05-25 04:50:55','ATENDIDO'),(2,'Diego Ramos',5,'3123213','2026-05-25 04:52:05','EN_ESPERA'),(3,'Sosa Fernandez',4,'123233','2026-05-25 04:52:19','EN_ESPERA'),(4,'Laura Gomez',2,'2284918472','2026-06-01 11:15:00','EN_ESPERA');
/*!40000 ALTER TABLE `listaespera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesa`
--

DROP TABLE IF EXISTS `mesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mesa` (
  `idMesa` int NOT NULL AUTO_INCREMENT,
  `numero` int NOT NULL,
  `capacidad` int NOT NULL,
  `estado` varchar(50) DEFAULT 'Libre',
  `mapa_x` int DEFAULT '0',
  `mapa_y` int DEFAULT '0',
  PRIMARY KEY (`idMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesa`
--

LOCK TABLES `mesa` WRITE;
/*!40000 ALTER TABLE `mesa` DISABLE KEYS */;
INSERT INTO `mesa` VALUES (1,1,4,'Libre',180,200),(2,2,4,'Libre',300,200),(3,3,4,'Libre',420,200),(4,4,4,'Libre',540,200),(5,5,4,'Libre',180,350),(6,6,4,'Libre',300,350),(7,7,2,'Libre',420,350),(8,8,8,'Libre',540,350),(9,9,2,'Libre',180,500),(10,10,4,'Libre',300,500),(11,11,6,'Libre',420,500),(12,12,4,'Libre',540,500);
/*!40000 ALTER TABLE `mesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `idPago` int NOT NULL AUTO_INCREMENT,
  `total` decimal(10,2) NOT NULL,
  `metodoPago` varchar(50) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `idPedido` int NOT NULL,
  PRIMARY KEY (`idPago`),
  KEY `fk_pago_pedido` (`idPedido`),
  CONSTRAINT `fk_pago_pedido` FOREIGN KEY (`idPedido`) REFERENCES `pedidos` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,504.60,'Tarjeta de debito/credito','2026-06-02 14:26:35',2),(2,568.40,'Efectivo','2026-06-03 08:28:03',3);
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `fechaHora` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(50) DEFAULT 'Pendiente',
  `idMesa` int NOT NULL,
  `idEmpleado` int NOT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `fk_pedido_mesa` (`idMesa`),
  KEY `fk_pedido_empleado` (`idEmpleado`),
  CONSTRAINT `fk_pedido_empleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  CONSTRAINT `fk_pedido_mesa` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,'2026-06-01 21:17:20','Cancelado',6,2),(2,'2026-06-02 14:23:03','Pagado',2,2),(3,'2026-06-03 08:24:22','Pagado',6,2);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platillos`
--

DROP TABLE IF EXISTS `platillos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `platillos` (
  `idPlatillo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `estado` varchar(50) DEFAULT 'Disponible',
  `idCategoria` int DEFAULT NULL,
  `imagen` varchar(255) DEFAULT 'default.png',
  `idInsumoClave` int DEFAULT NULL,
  PRIMARY KEY (`idPlatillo`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `platillos_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoriasmenu` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platillos`
--

LOCK TABLES `platillos` WRITE;
/*!40000 ALTER TABLE `platillos` DISABLE KEYS */;
INSERT INTO `platillos` VALUES (1,'Pizza Queso','',120.00,'Disponible',1,'pizzaQueso.png',1),(2,'Pizza Pepperoni',NULL,140.00,'Disponible',1,'default.png',2),(3,'Pizza Vegetariana',NULL,150.00,'Disponible',1,'default.png',3),(4,'Pizza Hawaiana',NULL,145.00,'Disponible',1,'default.png',4),(5,'Pizza de Carne',NULL,160.00,'Disponible',1,'default.png',5),(6,'Pizza BBQ Pollo',NULL,155.00,'Disponible',1,'default.png',6),(7,'Pizza Alfredo',NULL,150.00,'Disponible',1,'default.png',7),(8,'Pizza Deluxe',NULL,170.00,'Disponible',1,'default.png',8),(9,'Pizza 4 Quesos',NULL,165.00,'Disponible',1,'default.png',9),(10,'Pizza de Camarones',NULL,180.00,'Inactivo',1,'default.png',10),(11,'Pizza Corazón',NULL,160.00,'Inactivo',1,'default.png',11),(12,'Pizza Estrella',NULL,160.00,'Inactivo',1,'default.png',12),(13,'Pizza Mac & Cheese',NULL,150.00,'Inactivo',1,'default.png',13),(14,'Pizza Pingüino Especial',NULL,170.00,'Inactivo',1,'default.png',14),(15,'Pizza de Postre',NULL,140.00,'Inactivo',1,'default.png',15),(16,'Pizza Taco',NULL,160.00,'Inactivo',1,'default.png',16),(17,'Pizza Volcán Picante',NULL,190.00,'Inactivo',1,'default.png',17),(18,'Café',NULL,35.00,'Disponible',2,'default.png',18),(19,'Café Helado',NULL,45.00,'Disponible',2,'default.png',18),(20,'Café con Leche',NULL,40.00,'Disponible',2,'default.png',18),(21,'Capuchino',NULL,50.00,'Disponible',2,'default.png',18),(22,'Granizado Azul',NULL,55.00,'Disponible',2,'default.png',19),(23,'Jugo de Naranja',NULL,40.00,'Disponible',2,'default.png',20),(24,'Malteada de Fresa',NULL,60.00,'Disponible',2,'default.png',21),(25,'Batido de Chocolate',NULL,60.00,'Disponible',2,'default.png',22),(26,'Soda de Lima',NULL,30.00,'Disponible',2,'default.png',23),(27,'Brownie',NULL,45.00,'Disponible',3,'default.png',24),(28,'Cheesecake de Fresa',NULL,65.00,'Disponible',3,'default.png',25),(29,'Cupcake Chocolate',NULL,30.00,'Disponible',3,'default.png',26),(30,'Cupcake Fresa',NULL,30.00,'Disponible',3,'default.png',27),(31,'Pastel de Chocolate',NULL,60.00,'Disponible',3,'default.png',28),(32,'Pay de Manzana',NULL,50.00,'Disponible',3,'default.png',29),(33,'Pay de Zanahoria',NULL,50.00,'Disponible',3,'default.png',30),(34,'Rol de Canela',NULL,40.00,'Disponible',3,'default.png',31),(35,'Sundae',NULL,55.00,'Disponible',3,'default.png',32),(36,'Alitas BBQ',NULL,90.00,'Disponible',4,'default.png',33),(37,'Aros de Cebolla',NULL,60.00,'Disponible',4,'default.png',34),(39,'Ensalada Fresca',NULL,70.00,'Disponible',4,'default.png',35),(40,'Ensalada de Repollo',NULL,40.00,'Disponible',4,'default.png',36),(41,'Nuggets de Pollo',NULL,75.00,'Disponible',4,'default.png',37),(42,'Pan de Ajo',NULL,45.00,'Disponible',4,'default.png',38),(43,'Pan de Ajo con Queso',NULL,55.00,'Disponible',4,'default.png',39),(44,'Papas Fritas',NULL,50.00,'Disponible',4,'default.png',40),(45,'Sopa del Día',NULL,60.00,'Disponible',4,'default.png',41),(46,'Calzone Clásico',NULL,110.00,'Disponible',5,'default.png',42),(47,'Pizza de Camarones',NULL,180.00,'Disponible',5,'default.png',10),(48,'Pizza Corazón',NULL,160.00,'Disponible',5,'default.png',11),(49,'Pizza Estrella',NULL,160.00,'Disponible',5,'default.png',12),(50,'Pizza Mac & Cheese',NULL,150.00,'Disponible',5,'default.png',13),(51,'Pizza Pingüino Especial',NULL,170.00,'Disponible',5,'default.png',14),(52,'Pizza de Postre',NULL,140.00,'Disponible',5,'default.png',15),(53,'Pizza Taco',NULL,160.00,'Disponible',5,'default.png',16),(54,'Pizza Volcán Picante',NULL,190.00,'Disponible',5,'default.png',17);
/*!40000 ALTER TABLE `platillos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservaciones`
--

DROP TABLE IF EXISTS `reservaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservaciones` (
  `idReservacion` int NOT NULL AUTO_INCREMENT,
  `folioUnico` varchar(50) DEFAULT NULL,
  `id_cliente` varchar(10) NOT NULL,
  `idMesa` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `num_personas` int NOT NULL,
  `estado` varchar(50) DEFAULT 'Confirmada',
  PRIMARY KEY (`idReservacion`),
  UNIQUE KEY `folioUnico` (`folioUnico`),
  KEY `idMesa` (`idMesa`),
  KEY `fk_reserva_cliente` (`id_cliente`),
  CONSTRAINT `fk_reserva_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_reserva_mesa` FOREIGN KEY (`idMesa`) REFERENCES `mesa` (`idMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservaciones`
--

LOCK TABLES `reservaciones` WRITE;
/*!40000 ALTER TABLE `reservaciones` DISABLE KEYS */;
INSERT INTO `reservaciones` VALUES (1,'FOL-9982','CP007',2,'2026-06-02','20:00:00',4,'Cancelada'),(2,'FOL-1123','CP004',11,'2026-06-03','15:30:00',6,'Confirmada'),(3,'F03CBC2B','CP005',2,'2026-06-02','15:00:00',2,'Cancelada');
/*!40000 ALTER TABLE `reservaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Gerente'),(2,'Mesero'),(3,'Chef'),(4,'Cajero'),(5,'Recepcionista');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-05  9:02:04
