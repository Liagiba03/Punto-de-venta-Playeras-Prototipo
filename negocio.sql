/*
 Navicat Premium Dump SQL

 Source Server         : BaseDatos
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36-0ubuntu0.22.04.1)
 Source Host           : localhost:3306
 Source Schema         : negocio

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36-0ubuntu0.22.04.1)
 File Encoding         : 65001

 Date: 07/06/2024 22:22:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Users
-- ----------------------------
DROP TABLE IF EXISTS `Users`;
CREATE TABLE `Users` (
  `Id_Usuario` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Apellido1` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Contrasenia` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Foto` blob,
  `IdRol` int NOT NULL,
  `status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id_Usuario`) USING BTREE,
  KEY `ROL-US` (`IdRol`),
  CONSTRAINT `ROL-US` FOREIGN KEY (`IdRol`) REFERENCES `rol` (`IdRol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of Users
-- ----------------------------
BEGIN;
INSERT INTO `Users` (`Id_Usuario`, `Nombre`, `Apellido1`, `Contrasenia`, `Foto`, `IdRol`, `status`) VALUES (1, 'Admin', 'Admini', '$2b$10$EcHX5oH0aX2T/Lf3fzRq4.XWZBebFdkQxRfigLycEFIMxscqr.Q7e', '', 1, '1');
INSERT INTO `Users` (`Id_Usuario`, `Nombre`, `Apellido1`, `Contrasenia`, `Foto`, `IdRol`, `status`) VALUES (2, 'Empleado', 'Empleado', '$2b$10$8N9eeHomeKJNF.hXIIXiA.oBXeSBDIkeZRugZZBnLGoNXCoO2yjie', '', 2, '1');
COMMIT;

-- ----------------------------
-- Table structure for abono
-- ----------------------------
DROP TABLE IF EXISTS `abono`;
CREATE TABLE `abono` (
  `Id_Abono` mediumint NOT NULL AUTO_INCREMENT,
  `Ultima_Fecha_Abono` datetime NOT NULL,
  `Abono` double NOT NULL,
  `PagadoActual` double NOT NULL DEFAULT '0',
  `Folio_Venta` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id_Abono`) USING BTREE,
  KEY `V-A` (`Folio_Venta`) USING BTREE,
  CONSTRAINT `V-A` FOREIGN KEY (`Folio_Venta`) REFERENCES `venta` (`Folio_Venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of abono
-- ----------------------------
BEGIN;
INSERT INTO `abono` (`Id_Abono`, `Ultima_Fecha_Abono`, `Abono`, `PagadoActual`, `Folio_Venta`) VALUES (3, '2024-05-22 20:20:37', 10, 10, 'Venta7');
INSERT INTO `abono` (`Id_Abono`, `Ultima_Fecha_Abono`, `Abono`, `PagadoActual`, `Folio_Venta`) VALUES (6, '2024-05-23 20:38:40', 5, 15, 'Venta7');
INSERT INTO `abono` (`Id_Abono`, `Ultima_Fecha_Abono`, `Abono`, `PagadoActual`, `Folio_Venta`) VALUES (7, '2024-05-16 21:55:05', 5, 5, 'Venta8');
INSERT INTO `abono` (`Id_Abono`, `Ultima_Fecha_Abono`, `Abono`, `PagadoActual`, `Folio_Venta`) VALUES (8, '2024-02-21 12:06:25', 10, 15, 'Venta8');
INSERT INTO `abono` (`Id_Abono`, `Ultima_Fecha_Abono`, `Abono`, `PagadoActual`, `Folio_Venta`) VALUES (9, '2024-02-25 12:06:25', 10, 25, 'Venta8');
INSERT INTO `abono` (`Id_Abono`, `Ultima_Fecha_Abono`, `Abono`, `PagadoActual`, `Folio_Venta`) VALUES (10, '2024-05-23 15:06:25', 10, 25, 'Venta7');
INSERT INTO `abono` (`Id_Abono`, `Ultima_Fecha_Abono`, `Abono`, `PagadoActual`, `Folio_Venta`) VALUES (11, '2024-05-23 15:06:25', 335, 360, 'Venta7');
COMMIT;

-- ----------------------------
-- Table structure for catalogo
-- ----------------------------
DROP TABLE IF EXISTS `catalogo`;
CREATE TABLE `catalogo` (
  `Id_Catalogo` mediumint NOT NULL AUTO_INCREMENT,
  `No.Paginas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Fecha_Salida` date NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id_Catalogo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of catalogo
-- ----------------------------
BEGIN;
INSERT INTO `catalogo` (`Id_Catalogo`, `No.Paginas`, `Fecha_Salida`, `status`) VALUES (1, '40', '2023-10-31', '1');
INSERT INTO `catalogo` (`Id_Catalogo`, `No.Paginas`, `Fecha_Salida`, `status`) VALUES (2, '25', '2023-12-01', '1');
INSERT INTO `catalogo` (`Id_Catalogo`, `No.Paginas`, `Fecha_Salida`, `status`) VALUES (3, '10', '2024-06-04', '1');
COMMIT;

-- ----------------------------
-- Table structure for color
-- ----------------------------
DROP TABLE IF EXISTS `color`;
CREATE TABLE `color` (
  `Id_Color` mediumint NOT NULL AUTO_INCREMENT,
  `Des_Color` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`Id_Color`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of color
-- ----------------------------
BEGIN;
INSERT INTO `color` (`Id_Color`, `Des_Color`, `status`) VALUES (1, 'Blanco', '1');
INSERT INTO `color` (`Id_Color`, `Des_Color`, `status`) VALUES (2, 'Negro', '1');
COMMIT;

-- ----------------------------
-- Table structure for color_playera
-- ----------------------------
DROP TABLE IF EXISTS `color_playera`;
CREATE TABLE `color_playera` (
  `Id_Color_Play` mediumint NOT NULL AUTO_INCREMENT,
  `Des_Color_Play` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`Id_Color_Play`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of color_playera
-- ----------------------------
BEGIN;
INSERT INTO `color_playera` (`Id_Color_Play`, `Des_Color_Play`, `status`) VALUES (1, 'Negro', '1');
INSERT INTO `color_playera` (`Id_Color_Play`, `Des_Color_Play`, `status`) VALUES (2, 'Verde', '1');
INSERT INTO `color_playera` (`Id_Color_Play`, `Des_Color_Play`, `status`) VALUES (4, 'Blanco', '1');
COMMIT;

-- ----------------------------
-- Table structure for detalle_venta
-- ----------------------------
DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta` (
  `Id_DVenta` mediumint NOT NULL AUTO_INCREMENT,
  `Cantidad_IndPlayera` mediumint NOT NULL,
  `Folio_Venta` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Folio_Playera` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Precio_Unitario` double NOT NULL,
  PRIMARY KEY (`Id_DVenta`) USING BTREE,
  KEY `V-DV` (`Folio_Venta`) USING BTREE,
  KEY `P-DV` (`Folio_Playera`) USING BTREE,
  CONSTRAINT `P-DV` FOREIGN KEY (`Folio_Playera`) REFERENCES `detalleplayera` (`Folio_Playera`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `V-DV` FOREIGN KEY (`Folio_Venta`) REFERENCES `venta` (`Folio_Venta`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of detalle_venta
-- ----------------------------
BEGIN;
INSERT INTO `detalle_venta` (`Id_DVenta`, `Cantidad_IndPlayera`, `Folio_Venta`, `Folio_Playera`, `Precio_Unitario`) VALUES (11, 5, 'Venta2', 'Dis1', 45);
INSERT INTO `detalle_venta` (`Id_DVenta`, `Cantidad_IndPlayera`, `Folio_Venta`, `Folio_Playera`, `Precio_Unitario`) VALUES (12, 2, 'Venta6', 'Dis1', 45);
INSERT INTO `detalle_venta` (`Id_DVenta`, `Cantidad_IndPlayera`, `Folio_Venta`, `Folio_Playera`, `Precio_Unitario`) VALUES (13, 2, 'Venta2', 'Dis1', 45);
INSERT INTO `detalle_venta` (`Id_DVenta`, `Cantidad_IndPlayera`, `Folio_Venta`, `Folio_Playera`, `Precio_Unitario`) VALUES (15, 2, 'Venta7', 'Dis1', 45);
INSERT INTO `detalle_venta` (`Id_DVenta`, `Cantidad_IndPlayera`, `Folio_Venta`, `Folio_Playera`, `Precio_Unitario`) VALUES (16, 2, 'Venta7', 'Dis1', 45);
INSERT INTO `detalle_venta` (`Id_DVenta`, `Cantidad_IndPlayera`, `Folio_Venta`, `Folio_Playera`, `Precio_Unitario`) VALUES (17, 3, 'Venta8', 'Dis1', 45);
INSERT INTO `detalle_venta` (`Id_DVenta`, `Cantidad_IndPlayera`, `Folio_Venta`, `Folio_Playera`, `Precio_Unitario`) VALUES (18, 1, 'Venta8', 'Dis1', 45);
COMMIT;

-- ----------------------------
-- Table structure for detalleplayera
-- ----------------------------
DROP TABLE IF EXISTS `detalleplayera`;
CREATE TABLE `detalleplayera` (
  `Folio_Playera` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Costo_Individual` double NOT NULL,
  `Des_Playera` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Id_Diseño` mediumint NOT NULL,
  `Id_TipoDPlayera` mediumint NOT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`Folio_Playera`) USING BTREE,
  KEY `D-DP` (`Id_Diseño`) USING BTREE,
  KEY `DTP-DP` (`Id_TipoDPlayera`) USING BTREE,
  CONSTRAINT `D-DP` FOREIGN KEY (`Id_Diseño`) REFERENCES `diseno` (`Id_Diseño`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `DTP-DP` FOREIGN KEY (`Id_TipoDPlayera`) REFERENCES `detalletipoplayera` (`Id_TipoDPlayera`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of detalleplayera
-- ----------------------------
BEGIN;
INSERT INTO `detalleplayera` (`Folio_Playera`, `Costo_Individual`, `Des_Playera`, `Id_Diseño`, `Id_TipoDPlayera`, `status`) VALUES ('Dis1', 45, 'GGVN', 5, 12, '1');
COMMIT;

-- ----------------------------
-- Table structure for detalletemporada
-- ----------------------------
DROP TABLE IF EXISTS `detalletemporada`;
CREATE TABLE `detalletemporada` (
  `Id_DetTemp` mediumint NOT NULL AUTO_INCREMENT,
  `Id_Temporada` mediumint NOT NULL,
  `Id_Diseño` mediumint NOT NULL,
  `Des_DetTemp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id_DetTemp`) USING BTREE,
  KEY `T-DT` (`Id_Temporada`) USING BTREE,
  KEY `D-DT` (`Id_Diseño`) USING BTREE,
  CONSTRAINT `D-DT` FOREIGN KEY (`Id_Diseño`) REFERENCES `diseno` (`Id_Diseño`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `T-DT` FOREIGN KEY (`Id_Temporada`) REFERENCES `temporada` (`Id_Temporada`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of detalletemporada
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for detalletipoplayera
-- ----------------------------
DROP TABLE IF EXISTS `detalletipoplayera`;
CREATE TABLE `detalletipoplayera` (
  `Id_TipoDPlayera` mediumint NOT NULL AUTO_INCREMENT,
  `Cantidad_Disponible` double NOT NULL,
  `Id_TipoP` mediumint NOT NULL,
  `Id_Talla` mediumint NOT NULL,
  `Id_ColorPlay` mediumint NOT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`Id_TipoDPlayera`) USING BTREE,
  KEY `TP-DTP` (`Id_TipoP`) USING BTREE,
  KEY `T-DTP` (`Id_Talla`) USING BTREE,
  KEY `CP-DTP` (`Id_ColorPlay`) USING BTREE,
  CONSTRAINT `CP-DTP` FOREIGN KEY (`Id_ColorPlay`) REFERENCES `color_playera` (`Id_Color_Play`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `T-DTP` FOREIGN KEY (`Id_Talla`) REFERENCES `talla` (`Id_Talla`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `TP-DTP` FOREIGN KEY (`Id_TipoP`) REFERENCES `tipo_playera` (`Id_TipoP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of detalletipoplayera
-- ----------------------------
BEGIN;
INSERT INTO `detalletipoplayera` (`Id_TipoDPlayera`, `Cantidad_Disponible`, `Id_TipoP`, `Id_Talla`, `Id_ColorPlay`, `status`) VALUES (12, 40, 1, 1, 1, '1');
INSERT INTO `detalletipoplayera` (`Id_TipoDPlayera`, `Cantidad_Disponible`, `Id_TipoP`, `Id_Talla`, `Id_ColorPlay`, `status`) VALUES (13, 22, 1, 2, 1, '1');
INSERT INTO `detalletipoplayera` (`Id_TipoDPlayera`, `Cantidad_Disponible`, `Id_TipoP`, `Id_Talla`, `Id_ColorPlay`, `status`) VALUES (26, 30, 1, 7, 1, '1');
INSERT INTO `detalletipoplayera` (`Id_TipoDPlayera`, `Cantidad_Disponible`, `Id_TipoP`, `Id_Talla`, `Id_ColorPlay`, `status`) VALUES (27, 20, 2, 1, 1, '1');
COMMIT;

-- ----------------------------
-- Table structure for diseno
-- ----------------------------
DROP TABLE IF EXISTS `diseno`;
CREATE TABLE `diseno` (
  `Id_Diseño` mediumint NOT NULL AUTO_INCREMENT,
  `Nombre_Diseno` varchar(50) NOT NULL,
  `Diseño` varchar(255) DEFAULT NULL,
  `Des_Diseño` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Id_Catalogo` mediumint NOT NULL,
  `No_Pagina` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Id_Color` mediumint NOT NULL,
  `Tipo_imagen` varchar(50) DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1',
  PRIMARY KEY (`Id_Diseño`,`Nombre_Diseno`) USING BTREE,
  KEY `D-C` (`Id_Catalogo`) USING BTREE,
  KEY `D-CO` (`Id_Color`) USING BTREE,
  CONSTRAINT `D-C` FOREIGN KEY (`Id_Catalogo`) REFERENCES `catalogo` (`Id_Catalogo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `D-CO` FOREIGN KEY (`Id_Color`) REFERENCES `color` (`Id_Color`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of diseno
-- ----------------------------
BEGIN;
INSERT INTO `diseno` (`Id_Diseño`, `Nombre_Diseno`, `Diseño`, `Des_Diseño`, `Id_Catalogo`, `No_Pagina`, `Id_Color`, `Tipo_imagen`, `status`) VALUES (5, 'Diseño 40', 'undefined_1717744204514.png', 'j5', 1, '40', 1, 'image/png', '1');
INSERT INTO `diseno` (`Id_Diseño`, `Nombre_Diseno`, `Diseño`, `Des_Diseño`, `Id_Catalogo`, `No_Pagina`, `Id_Color`, `Tipo_imagen`, `status`) VALUES (36, 'Diseño 2', 'undefined_1717732623982.png', 'Imagen prueba edicion 6', 2, '2', 2, 'image/png', '1');
INSERT INTO `diseno` (`Id_Diseño`, `Nombre_Diseno`, `Diseño`, `Des_Diseño`, `Id_Catalogo`, `No_Pagina`, `Id_Color`, `Tipo_imagen`, `status`) VALUES (43, 'sdf', 'undefined_1717732975635.png', 'sd', 1, '4', 1, 'image/png', '1');
INSERT INTO `diseno` (`Id_Diseño`, `Nombre_Diseno`, `Diseño`, `Des_Diseño`, `Id_Catalogo`, `No_Pagina`, `Id_Color`, `Tipo_imagen`, `status`) VALUES (44, 'ABCDEF', 'undefined_1717733046156.png', 'asdf', 1, '9', 1, 'image/png', '1');
INSERT INTO `diseno` (`Id_Diseño`, `Nombre_Diseno`, `Diseño`, `Des_Diseño`, `Id_Catalogo`, `No_Pagina`, `Id_Color`, `Tipo_imagen`, `status`) VALUES (45, 'Diseño 2', 'undefined_1717819408791.png', 'descr', 1, '20', 1, 'image/png', '1');
INSERT INTO `diseno` (`Id_Diseño`, `Nombre_Diseno`, `Diseño`, `Des_Diseño`, `Id_Catalogo`, `No_Pagina`, `Id_Color`, `Tipo_imagen`, `status`) VALUES (46, 'Prueba Final de funcionamiento', 'undefined_1717819451566.png', 'Prueba descripcion', 1, '5', 1, 'image/png', '1');
COMMIT;

-- ----------------------------
-- Table structure for estado_venta
-- ----------------------------
DROP TABLE IF EXISTS `estado_venta`;
CREATE TABLE `estado_venta` (
  `Id_EstadoV` mediumint NOT NULL AUTO_INCREMENT,
  `Des_EstadoV` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`Id_EstadoV`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of estado_venta
-- ----------------------------
BEGIN;
INSERT INTO `estado_venta` (`Id_EstadoV`, `Des_EstadoV`, `status`) VALUES (1, 'Pagado', '1');
INSERT INTO `estado_venta` (`Id_EstadoV`, `Des_EstadoV`, `status`) VALUES (2, 'Por pagar', '1');
COMMIT;

-- ----------------------------
-- Table structure for rol
-- ----------------------------
DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `IdRol` int NOT NULL AUTO_INCREMENT,
  `Rol` varchar(30) NOT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`IdRol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of rol
-- ----------------------------
BEGIN;
INSERT INTO `rol` (`IdRol`, `Rol`, `Descripcion`, `status`) VALUES (1, 'Administrador', 'Administrador de todo el sistema', '1');
INSERT INTO `rol` (`IdRol`, `Rol`, `Descripcion`, `status`) VALUES (2, 'Empleado', 'Ventas y Abonos', '1');
COMMIT;

-- ----------------------------
-- Table structure for talla
-- ----------------------------
DROP TABLE IF EXISTS `talla`;
CREATE TABLE `talla` (
  `Id_Talla` mediumint NOT NULL AUTO_INCREMENT,
  `Nom_Talla` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Medidas` varchar(255) DEFAULT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`Id_Talla`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of talla
-- ----------------------------
BEGIN;
INSERT INTO `talla` (`Id_Talla`, `Nom_Talla`, `Medidas`, `status`) VALUES (1, 'Chica', 'Hombro:20cm', '1');
INSERT INTO `talla` (`Id_Talla`, `Nom_Talla`, `Medidas`, `status`) VALUES (2, 'Mediana', 'Hombro: 40cm', '1');
INSERT INTO `talla` (`Id_Talla`, `Nom_Talla`, `Medidas`, `status`) VALUES (7, 'Grande', 'Hombro 40cm, Largo:120cm', '1');
COMMIT;

-- ----------------------------
-- Table structure for temporada
-- ----------------------------
DROP TABLE IF EXISTS `temporada`;
CREATE TABLE `temporada` (
  `Id_Temporada` mediumint NOT NULL AUTO_INCREMENT,
  `Nombre_Temporada` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1',
  PRIMARY KEY (`Id_Temporada`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of temporada
-- ----------------------------
BEGIN;
INSERT INTO `temporada` (`Id_Temporada`, `Nombre_Temporada`, `status`) VALUES (1, 'Navidad', '1');
INSERT INTO `temporada` (`Id_Temporada`, `Nombre_Temporada`, `status`) VALUES (2, 'Día de Muertos', '1');
INSERT INTO `temporada` (`Id_Temporada`, `Nombre_Temporada`, `status`) VALUES (3, 'Año nuevo', '1');
COMMIT;

-- ----------------------------
-- Table structure for tipo_playera
-- ----------------------------
DROP TABLE IF EXISTS `tipo_playera`;
CREATE TABLE `tipo_playera` (
  `Id_TipoP` mediumint NOT NULL AUTO_INCREMENT,
  `Des_TipoP` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`Id_TipoP`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tipo_playera
-- ----------------------------
BEGIN;
INSERT INTO `tipo_playera` (`Id_TipoP`, `Des_TipoP`, `status`) VALUES (1, 'Manga Larga', '1');
INSERT INTO `tipo_playera` (`Id_TipoP`, `Des_TipoP`, `status`) VALUES (2, 'Manga Corta', '1');
INSERT INTO `tipo_playera` (`Id_TipoP`, `Des_TipoP`, `status`) VALUES (3, 'Manga media', '1');
COMMIT;

-- ----------------------------
-- Table structure for usuario
-- ----------------------------
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `Id_Usuario` mediumint NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` char(1) DEFAULT '1',
  PRIMARY KEY (`Id_Usuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of usuario
-- ----------------------------
BEGIN;
INSERT INTO `usuario` (`Id_Usuario`, `Nombre_Usuario`, `status`) VALUES (1, 'Suseth Abigail', '1');
INSERT INTO `usuario` (`Id_Usuario`, `Nombre_Usuario`, `status`) VALUES (3, 'Oscar Eduardo', '1');
INSERT INTO `usuario` (`Id_Usuario`, `Nombre_Usuario`, `status`) VALUES (10, 'Combinada', '1');
COMMIT;

-- ----------------------------
-- Table structure for venta
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta` (
  `Folio_Venta` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Fecha_Venta` datetime NOT NULL,
  `Cantidad_Playera` mediumint NOT NULL DEFAULT '0',
  `Precio_Total` double NOT NULL DEFAULT '0',
  `Id_Usuario` mediumint NOT NULL,
  `Id_EstadoV` mediumint NOT NULL,
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`Folio_Venta`) USING BTREE,
  KEY `U-V` (`Id_Usuario`) USING BTREE,
  KEY `EV-V` (`Id_EstadoV`) USING BTREE,
  CONSTRAINT `EV-V` FOREIGN KEY (`Id_EstadoV`) REFERENCES `estado_venta` (`Id_EstadoV`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `U-V` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of venta
-- ----------------------------
BEGIN;
INSERT INTO `venta` (`Folio_Venta`, `Fecha_Venta`, `Cantidad_Playera`, `Precio_Total`, `Id_Usuario`, `Id_EstadoV`, `status`) VALUES ('Venta2', '2023-11-16 07:36:48', 19, 855, 1, 1, '1');
INSERT INTO `venta` (`Folio_Venta`, `Fecha_Venta`, `Cantidad_Playera`, `Precio_Total`, `Id_Usuario`, `Id_EstadoV`, `status`) VALUES ('Venta6', '2023-11-16 07:41:55', 14, 630, 1, 1, '1');
INSERT INTO `venta` (`Folio_Venta`, `Fecha_Venta`, `Cantidad_Playera`, `Precio_Total`, `Id_Usuario`, `Id_EstadoV`, `status`) VALUES ('Venta7', '2024-05-20 19:58:30', 8, 360, 10, 1, '1');
INSERT INTO `venta` (`Folio_Venta`, `Fecha_Venta`, `Cantidad_Playera`, `Precio_Total`, `Id_Usuario`, `Id_EstadoV`, `status`) VALUES ('Venta8', '2024-05-23 21:44:53', 4, 180, 3, 2, '1');
COMMIT;

-- ----------------------------
-- Procedure structure for editarTipoP
-- ----------------------------
DROP PROCEDURE IF EXISTS `editarTipoP`;
delimiter ;;
CREATE PROCEDURE `editarTipoP`(parId MEDIUMINT, par_nom VARCHAR(50))
BEGIN
  UPDATE tipo_playera SET tipo_playera.Des_TipoP = par_nom
	WHERE tipo_playera.Id_TipoP = parId AND tipo_playera.`status` =1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarCatalogo
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarCatalogo`;
delimiter ;;
CREATE PROCEDURE `EliminarCatalogo`(parId mediumint)
BEGIN
  UPDATE catalogo SET
	catalogo.`status` = 0
	WHERE catalogo.Id_Catalogo = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarColor
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarColor`;
delimiter ;;
CREATE PROCEDURE `EliminarColor`(parId MEDIUMINT)
BEGIN
  UPDATE color_playera SET
	color_playera.`status` = 0
	WHERE color_playera.Id_Color_Play = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarDTipoPla
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarDTipoPla`;
delimiter ;;
CREATE PROCEDURE `EliminarDTipoPla`(parId MEDIUMINT)
BEGIN
  UPDATE detalletipoplayera SET
	detalletipoplayera.`status` = 0
	WHERE detalletipoplayera.Id_TipoDPlayera = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarTalla
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarTalla`;
delimiter ;;
CREATE PROCEDURE `EliminarTalla`(parId MEDIUMINT)
BEGIN
  UPDATE talla SET
	talla.`status` = 0
	WHERE talla.Id_Talla = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarTemporada
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarTemporada`;
delimiter ;;
CREATE PROCEDURE `EliminarTemporada`(parId mediumint)
BEGIN
  UPDATE temporada SET
	temporada.`status` = 0
	WHERE temporada.Id_Temporada = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for EliminarTipoP
-- ----------------------------
DROP PROCEDURE IF EXISTS `EliminarTipoP`;
delimiter ;;
CREATE PROCEDURE `EliminarTipoP`(parId MEDIUMINT)
BEGIN
  UPDATE tipo_playera SET
	tipo_playera.`status` = 0
	WHERE tipo_playera.Id_TipoP = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mostrarCatInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarCatInd`;
delimiter ;;
CREATE PROCEDURE `mostrarCatInd`(parId mediumint)
BEGIN
  SELECT catalogo.Id_Catalogo as id, catalogo.`No.Paginas` as pag ,catalogo.Fecha_Salida as fecha
	FROM catalogo
	WHERE catalogo.`status`=1 AND catalogo.Id_Catalogo=parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mostrarColorP
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarColorP`;
delimiter ;;
CREATE PROCEDURE `mostrarColorP`()
BEGIN
  SELECT * FROM color_playera
	WHERE color_playera.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mostrarColorPInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarColorPInd`;
delimiter ;;
CREATE PROCEDURE `mostrarColorPInd`(parId MEDIUMINT)
BEGIN
  SELECT color_playera.Id_Color_Play, color_playera.Des_Color_Play FROM color_playera
	WHERE color_playera.`status`=1 AND color_playera.Id_Color_Play = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mostrarTalla
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarTalla`;
delimiter ;;
CREATE PROCEDURE `mostrarTalla`()
BEGIN
  SELECT * FROM talla
	WHERE talla.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mostrarTallaInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarTallaInd`;
delimiter ;;
CREATE PROCEDURE `mostrarTallaInd`(parId MEDIUMINT)
BEGIN
   SELECT talla.Nom_Talla, talla.Medidas FROM talla
	WHERE talla.`status`=1 AND talla.Id_Talla = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mostrarTipoP
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarTipoP`;
delimiter ;;
CREATE PROCEDURE `mostrarTipoP`()
BEGIN
  SELECT * FROM tipo_playera
	WHERE tipo_playera.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mostrarTipoPInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarTipoPInd`;
delimiter ;;
CREATE PROCEDURE `mostrarTipoPInd`(parId MEDIUMINT)
BEGIN
  SELECT * FROM tipo_playera
	WHERE tipo_playera.`status`=1 AND tipo_playera.Id_TipoP = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for mostrarUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `mostrarUsuario`;
delimiter ;;
CREATE PROCEDURE `mostrarUsuario`()
BEGIN
  SELECT * FROM usuario
	WHERE  usuario.`status` = 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procDetallesDiseno
-- ----------------------------
DROP PROCEDURE IF EXISTS `procDetallesDiseno`;
delimiter ;;
CREATE PROCEDURE `procDetallesDiseno`()
BEGIN
  SELECT diseno.`Id_Diseño`, diseno.`Diseño`, diseno.`Des_Diseño`, diseno.Tipo_imagen,diseno.No_Pagina, catalogo.Id_Catalogo, color.Des_Color
	FROM diseno
	INNER JOIN catalogo ON catalogo.Id_Catalogo = diseno.Id_Catalogo 
	INNER JOIN color ON color.Id_Color = diseno.Id_Color
	WHERE catalogo.`status`=1 AND color.`status`=1 AND diseno.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procEditarCat
-- ----------------------------
DROP PROCEDURE IF EXISTS `procEditarCat`;
delimiter ;;
CREATE PROCEDURE `procEditarCat`(par_Id mediumint, parPag varchar(255), parFecha date)
BEGIN
  UPDATE catalogo SET
	catalogo.`No.Paginas` = parPag,
	catalogo.Fecha_Salida = parFecha
	WHERE catalogo.`status` =1 AND catalogo.Id_Catalogo = par_Id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procEditarColorP
-- ----------------------------
DROP PROCEDURE IF EXISTS `procEditarColorP`;
delimiter ;;
CREATE PROCEDURE `procEditarColorP`(parId MEDIUMINT, par_nom VARCHAR(50))
BEGIN
  UPDATE color_playera SET color_playera.Des_Color_Play = par_nom
	WHERE color_playera.Id_Color_Play = parId AND color_playera.`status` =1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procEditarDiseno
-- ----------------------------
DROP PROCEDURE IF EXISTS `procEditarDiseno`;
delimiter ;;
CREATE PROCEDURE `procEditarDiseno`(par_Id MEDIUMINT, 
par_Nom VARCHAR(50),
parDiseno VARCHAR(255),
par_Des_Diseño VARCHAR(100),
par_Id_Catalogo MEDIUMINT,
par_No_Pagina VARCHAR(100),
par_IdColor MEDIUMINT)
BEGIN
  UPDATE diseno
		SET 
		diseno.Nombre_Diseno = par_Nom,
		diseno.`Des_Diseño` = par_Des_Diseño,
		diseno.`Diseño` = parDiseno,
		diseno.Id_Catalogo = par_Id_Catalogo,
		diseno.No_Pagina = par_No_Pagina,
		diseno.Id_Color = par_IdColor
		WHERE diseno.`Id_Diseño` = par_Id AND diseno.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procEditarDTPlayera
-- ----------------------------
DROP PROCEDURE IF EXISTS `procEditarDTPlayera`;
delimiter ;;
CREATE PROCEDURE `procEditarDTPlayera`(IN parId MEDIUMINT,
    IN parCantidad MEDIUMINT, 
    IN parTipoP MEDIUMINT, 
    IN parTalla MEDIUMINT, 
    IN parColorP MEDIUMINT)
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE code INT;
    DECLARE oldCantidad MEDIUMINT;

    -- Verificar si la combinación ya existe y obtener la cantidad actual
    SELECT Cantidad_Disponible 
    INTO oldCantidad
    FROM detalletipoplayera 
    WHERE Id_TipoP = parTipoP 
      AND Id_Talla = parTalla 
      AND Id_ColorPlay = parColorP
      AND Id_TipoDPlayera = parId
      AND `status` = 1;

    -- Si la cantidad es diferente, actualizar
    IF oldCantidad IS NULL THEN
        SET msg = 'Playera no encontrada';
        SET code = 2;
    ELSEIF oldCantidad != parCantidad THEN
        UPDATE detalletipoplayera SET
            Cantidad_Disponible = parCantidad,
            Id_TipoP = parTipoP,
            Id_Talla = parTalla,
            Id_ColorPlay = parColorP
        WHERE Id_TipoDPlayera = parId 
          AND `status` = 1;

        SET msg = 'Playera actualizada exitosamente';
        SET code = 0;
    ELSE
        SET msg = 'Playera ya ingresada';
        SET code = 1;
    END IF;

    -- Devolver el mensaje y el código de estado
    SELECT msg AS message, code AS status;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procEditarTalla
-- ----------------------------
DROP PROCEDURE IF EXISTS `procEditarTalla`;
delimiter ;;
CREATE PROCEDURE `procEditarTalla`(parId MEDIUMINT, par_nom VARCHAR(50), par_med VARCHAR(255))
BEGIN
  UPDATE talla SET
	talla.Nom_Talla = par_nom, talla.Medidas = par_med
	WHERE talla.Id_Talla = parId AND talla.`status` = 1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procEditarTemporada
-- ----------------------------
DROP PROCEDURE IF EXISTS `procEditarTemporada`;
delimiter ;;
CREATE PROCEDURE `procEditarTemporada`(parId MEDIUMINT, parNom VARCHAR(100))
BEGIN
  UPDATE temporada SET temporada.Nombre_Temporada = parNom
	WHERE temporada.Id_Temporada = parId AND temporada.`status` =1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procEditarUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `procEditarUsuario`;
delimiter ;;
CREATE PROCEDURE `procEditarUsuario`(parId MEDIUMINT, parNom VARCHAR(200))
BEGIN
  UPDATE usuario
		SET usuario.Nombre_Usuario = parNom
		WHERE usuario.Id_Usuario = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procEliminarVenta
-- ----------------------------
DROP PROCEDURE IF EXISTS `procEliminarVenta`;
delimiter ;;
CREATE PROCEDURE `procEliminarVenta`(par_id VARCHAR(10))
BEGIN
  /*DELETE FROM detalle_venta WHERE detalle_venta.Folio_Venta = par_id;
	DELETE FROM venta WHERE venta.Folio_Venta = par_id;*/
	UPDATE venta SET venta.`status`=0 WHERE venta.Folio_Venta=par_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarAbono
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarAbono`;
delimiter ;;
CREATE PROCEDURE `procInsertarAbono`(parFecha DATETIME, parAbono DOUBLE, parFolioVenta VARCHAR(10))
BEGIN
  DECLARE var_acumulador DOUBLE;
	DECLARE var_total DOUBLE;
	SELECT SUM(abono.Abono) + parAbono INTO var_acumulador FROM abono WHERE parFolioVenta = abono.Folio_Venta;
	SELECT DISTINCT venta.Precio_Total INTO var_total FROM abono INNER JOIN venta ON venta.Folio_Venta = abono.Folio_Venta WHERE  parFolioVenta = abono.Folio_Venta;
	/**HACER CONDICION PARA SABER SI ES EL ULTIMO ABONO Y PASA EL ESTADO A PAGADO*/
	
		if var_total>=var_acumulador then
			
			SELECT "Completo";
			UPDATE venta SET venta.Id_EstadoV=1 WHERE venta.Folio_Venta=parFolioVenta;
			INSERT INTO abono VALUES(DEFAULT, parFecha, parAbono,var_acumulador,parFolioVenta);

		ELSEIF var_acumulador>var_total THEN
			SELECT "Abonos terminados";
		ELSE
			INSERT INTO abono VALUES(DEFAULT, parFecha, parAbono,var_acumulador,parFolioVenta);
		END IF;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarCat
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarCat`;
delimiter ;;
CREATE PROCEDURE `procInsertarCat`(parPag VARCHAR(255), parFecha DATE)
BEGIN
  INSERT INTO catalogo VALUES (
		default,
		parPag,
		parFecha,
		1
	);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarColorP
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarColorP`;
delimiter ;;
CREATE PROCEDURE `procInsertarColorP`(par_nom VARCHAR(50))
BEGIN
  INSERT INTO color_playera VALUES(DEFAULT, par_nom,1);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarDiseno
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarDiseno`;
delimiter ;;
CREATE PROCEDURE `procInsertarDiseno`(parNom VARCHAR(50),
	parDiseno VARCHAR(255),
	parDesDiseño VARCHAR(100),
	parCatalogo MEDIUMINT,
	parPag VARCHAR(100),
	parColor MEDIUMINT,
	parTipoI VARCHAR(50))
BEGIN
  INSERT INTO diseno VALUES(
		DEFAULT,
		parNom, parDiseno, parDesDiseño, parCatalogo, parPag, parColor, parTipoI, 1
	);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarDTPlayera
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarDTPlayera`;
delimiter ;;
CREATE PROCEDURE `procInsertarDTPlayera`(IN parCantidad MEDIUMINT, 
    IN parTipoP MEDIUMINT, 
    IN parTalla MEDIUMINT, 
    IN parColorP MEDIUMINT)
BEGIN
    DECLARE msg VARCHAR(255);
    DECLARE code INT;

    -- Verificar si la combinación ya existe
    IF EXISTS (
        SELECT 1 
        FROM detalletipoplayera 
        WHERE Id_TipoP = parTipoP 
          AND Id_Talla = parTalla 
          AND Id_ColorPlay = parColorP
    ) THEN
        -- Lanzar un error si ya existe
        SET msg = 'Playera ya ingresada';
        SET code = 1;
    ELSE
        -- Insertar el nuevo registro
        INSERT INTO detalletipoplayera (
            Cantidad_Disponible, 
            Id_TipoP, 
            Id_Talla, 
            Id_ColorPlay, 
            `status`
        ) VALUES (
            parCantidad, 
            parTipoP, 
            parTalla, 
            parColorP, 
            1
        );
        SET msg = 'Playera ingresada exitosamente';
        SET code = 0;
    END IF;

    -- Devolver el mensaje y el código de estado
    SELECT msg AS message, code AS status;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarDVenta
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarDVenta`;
delimiter ;;
CREATE PROCEDURE `procInsertarDVenta`(par_CantidadInd MEDIUMINT,
	par_Folio VARCHAR(10),
	par_FolioPla VARCHAR(10),
	par_PrecioU DOUBLE)
BEGIN
  INSERT INTO detalle_venta VALUES(
	DEFAULT,
	par_CantidadInd,
	par_Folio,
	par_FolioPla,
	par_PrecioU
	);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarTalla
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarTalla`;
delimiter ;;
CREATE PROCEDURE `procInsertarTalla`(par_nom VARCHAR(50), par_med VARCHAR(255))
INSERT INTO talla VALUES(DEFAULT, par_nom, par_med,1)
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarTemp
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarTemp`;
delimiter ;;
CREATE PROCEDURE `procInsertarTemp`(parNom VARCHAR(100))
BEGIN
  INSERT INTO temporada VALUES(DEFAULT, parNom,1);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarTipoPlay
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarTipoPlay`;
delimiter ;;
CREATE PROCEDURE `procInsertarTipoPlay`(par_nom VARCHAR(50))
BEGIN
  INSERT INTO tipo_playera VALUES(DEFAULT, par_nom,1);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertarUsuario
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertarUsuario`;
delimiter ;;
CREATE PROCEDURE `procInsertarUsuario`(par_nombre VARCHAR(200))
BEGIN
  INSERT INTO usuario VALUES(DEFAULT, par_nombre);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procInsertTalla
-- ----------------------------
DROP PROCEDURE IF EXISTS `procInsertTalla`;
delimiter ;;
CREATE PROCEDURE `procInsertTalla`(par_nom VARCHAR(50), par_med VARCHAR(255))
BEGIN
  INSERT INTO talla VALUES(DEFAULT, par_nom, par_med,1);
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarAbonoInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarAbonoInd`;
delimiter ;;
CREATE PROCEDURE `procMostrarAbonoInd`(parFolio VARCHAR(10))
BEGIN
  SELECT venta.Folio_Venta, Id_Abono, Ultima_Fecha_Abono, Abono, PagadoActual, Precio_Total, Des_EstadoV as Estado FROM abono 
	INNER JOIN venta ON abono.Folio_Venta = venta.Folio_Venta
	INNER JOIN estado_venta ev ON venta.Id_EstadoV=ev.Id_EstadoV
	WHERE venta.Id_EstadoV=2 AND venta.status=1 AND ev.status=1 AND venta.Folio_Venta = parFolio;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarAbonos
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarAbonos`;
delimiter ;;
CREATE PROCEDURE `procMostrarAbonos`()
BEGIN
  SELECT venta.Folio_Venta, Id_Abono, Ultima_Fecha_Abono, Abono, PagadoActual, Precio_Total, Des_EstadoV as Estado FROM abono 
	INNER JOIN venta ON abono.Folio_Venta = venta.Folio_Venta
	INNER JOIN estado_venta ev ON venta.Id_EstadoV=ev.Id_EstadoV
	WHERE venta.Id_EstadoV=2 AND venta.status=1 AND ev.status=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarCat
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarCat`;
delimiter ;;
CREATE PROCEDURE `procMostrarCat`()
BEGIN
  SELECT catalogo.Id_Catalogo as id, catalogo.`No.Paginas` as pag ,catalogo.Fecha_Salida as fecha
	FROM catalogo
	WHERE catalogo.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarDetallePlayera
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarDetallePlayera`;
delimiter ;;
CREATE PROCEDURE `procMostrarDetallePlayera`(par_folio VARCHAR(10))
BEGIN
  SELECT dv.Folio_Venta,dv.Cantidad_IndPlayera, dv.Precio_Unitario, diseno.`Diseño`, cp.Des_Color_Play, tp.Des_TipoP, talla.Nom_Talla, diseno.Tipo_imagen, (dv.Precio_Unitario*dv.Cantidad_IndPlayera) as Subtotal
FROM detalle_venta dv
INNER JOIN detalleplayera dp ON dv.Folio_Playera = dp.Folio_Playera
INNER JOIN diseno ON dp.`Id_Diseño` = diseno.`Id_Diseño`
INNER JOIN detalletipoplayera dtp ON dp.Id_TipoDPlayera = dtp.Id_TipoDPlayera
INNER JOIN color_playera cp ON dtp.Id_ColorPlay = cp.Id_Color_Play
INNER JOIN tipo_playera tp ON dtp.Id_TipoP = tp.Id_TipoP
INNER JOIN talla ON dtp.Id_Talla = talla.Id_Talla
WHERE dv.Folio_Venta = par_folio AND dp.`status`=1 AND diseno.`status`=1 AND dtp.`status`=1 AND cp.`status`=1 AND tp.`status`=1 AND talla.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarDisenoInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarDisenoInd`;
delimiter ;;
CREATE PROCEDURE `procMostrarDisenoInd`(parId MEDIUMINT)
BEGIN
  SELECT * FROM diseno WHERE diseno.`status`=1 AND diseno.`Id_Diseño`=parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarDTPlayera
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarDTPlayera`;
delimiter ;;
CREATE PROCEDURE `procMostrarDTPlayera`()
BEGIN
SELECT dtp.Id_TipoDPlayera as Id, cp.Des_Color_Play as Color, tp.Des_TipoP as Tipo, talla.Nom_Talla as Talla, dtp.Cantidad_Disponible
FROM detalletipoplayera dtp
INNER JOIN color_playera cp ON dtp.Id_ColorPlay = cp.Id_Color_Play
INNER JOIN tipo_playera tp ON dtp.Id_TipoP = tp.Id_TipoP
INNER JOIN talla ON dtp.Id_Talla = talla.Id_Talla
WHERE dtp.`status`=1 AND cp.`status`=1 AND tp.`status`=1 AND talla.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarDTPlayeraInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarDTPlayeraInd`;
delimiter ;;
CREATE PROCEDURE `procMostrarDTPlayeraInd`(parId MEDIUMINT)
BEGIN
  SELECT dtp.Id_TipoDPlayera as Id, cp.Des_Color_Play as Color, cp.Id_Color_Play, tp.Des_TipoP as Tipo, tp.Id_TipoP, talla.Nom_Talla as Talla, talla.Id_Talla ,dtp.Cantidad_Disponible
FROM detalletipoplayera dtp
INNER JOIN color_playera cp ON dtp.Id_ColorPlay = cp.Id_Color_Play
INNER JOIN tipo_playera tp ON dtp.Id_TipoP = tp.Id_TipoP
INNER JOIN talla ON dtp.Id_Talla = talla.Id_Talla
WHERE dtp.`status`=1 AND cp.`status`=1 AND tp.`status`=1 AND talla.`status`=1 AND dtp.Id_TipoDPlayera=parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarEstadoV
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarEstadoV`;
delimiter ;;
CREATE PROCEDURE `procMostrarEstadoV`()
BEGIN
  SELECT Id_EstadoV as id, Des_EstadoV as estado FROM estado_venta;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarTemp
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarTemp`;
delimiter ;;
CREATE PROCEDURE `procMostrarTemp`()
BEGIN
  SELECT temporada.Id_Temporada, temporada.Nombre_Temporada 
	FROM temporada
	WHERE temporada.`status`=1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarTempInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarTempInd`;
delimiter ;;
CREATE PROCEDURE `procMostrarTempInd`(parId mediumint)
BEGIN
  SELECT temporada.Id_Temporada, temporada.Nombre_Temporada 
	FROM temporada
	WHERE temporada.`status`=1 AND temporada.Id_Temporada = parId;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarUsuarioInd
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarUsuarioInd`;
delimiter ;;
CREATE PROCEDURE `procMostrarUsuarioInd`(par_id MEDIUMINT)
BEGIN
  SELECT * FROM usuario WHERE usuario.Id_Usuario = par_id;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procMostrarVenta
-- ----------------------------
DROP PROCEDURE IF EXISTS `procMostrarVenta`;
delimiter ;;
CREATE PROCEDURE `procMostrarVenta`()
BEGIN
  SELECT venta.Folio_Venta, venta.Fecha_Venta, venta.Cantidad_Playera, venta.Precio_Total,
usuario.Nombre_Usuario as Comprador, estado_venta.Des_EstadoV as Estado
FROM venta 
INNER JOIN usuario ON usuario.Id_Usuario = venta.Id_Usuario
INNER JOIN estado_venta ON estado_venta.Id_EstadoV = venta.Id_EstadoV;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for procPagDIsponibles
-- ----------------------------
DROP PROCEDURE IF EXISTS `procPagDIsponibles`;
delimiter ;;
CREATE PROCEDURE `procPagDIsponibles`(parId mediumint)
BEGIN
   SELECT diseno.No_Pagina, catalogo.`No.Paginas` as pag
	 FROM diseno
	 INNER JOIN catalogo ON diseno.Id_Catalogo=catalogo.Id_Catalogo
	 WHERE diseno.Id_Catalogo = parId AND diseno.`status`=1;
	 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for proc_InsertCuenta
-- ----------------------------
DROP PROCEDURE IF EXISTS `proc_InsertCuenta`;
delimiter ;;
CREATE PROCEDURE `proc_InsertCuenta`(parNombre VARCHAR(50), 
parApellido VARCHAR(30),
parPass VARCHAR(80),
parFoto BLOB)
BEGIN
  INSERT INTO Users VALUES(DEFAULT, parNombre, parApellido, parPass, parFoto, 2,1);
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_venta
-- ----------------------------
DROP TRIGGER IF EXISTS `Trigger_IDetalle`;
delimiter ;;
CREATE TRIGGER `Trigger_IDetalle` AFTER INSERT ON `detalle_venta` FOR EACH ROW UPDATE venta
SET venta.Cantidad_Playera = Cantidad_Playera+ NEW.Cantidad_IndPlayera
WHERE venta.Folio_Venta = Folio_Venta;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_venta
-- ----------------------------
DROP TRIGGER IF EXISTS `Trigger_IDinero`;
delimiter ;;
CREATE TRIGGER `Trigger_IDinero` AFTER INSERT ON `detalle_venta` FOR EACH ROW UPDATE venta
SET venta.Precio_Total = venta.Precio_Total+(NEW.Cantidad_IndPlayera * NEW.Precio_Unitario)
WHERE venta.Folio_Venta = Folio_Venta
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table detalle_venta
-- ----------------------------
DROP TRIGGER IF EXISTS `Trigger_ICantPla`;
delimiter ;;
CREATE TRIGGER `Trigger_ICantPla` AFTER INSERT ON `detalle_venta` FOR EACH ROW UPDATE detalletipoplayera dtp
  INNER JOIN detalleplayera dp ON dtp.Id_TipoDPlayera = dp.Id_TipoDPlayera
  SET dtp.Cantidad_Disponible = dtp.Cantidad_Disponible - NEW.Cantidad_IndPlayera
  WHERE dp.Folio_Playera = NEW.Folio_Playera
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
