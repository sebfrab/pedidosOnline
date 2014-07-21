-- -------------------------------------------~
SET SQL_QUOTE_SHOW_CREATE = 1~
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0~
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0~
-- -------------------------------------------~
-- -------------------------------------------~
-- START BACKUP~
-- -------------------------------------------~
-- -------------------------------------------~
-- TABLE `authassignment`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `authassignment`~
CREATE TABLE IF NOT EXISTS `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `authitem`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `authitem`~
CREATE TABLE IF NOT EXISTS `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `authitemchild`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `authitemchild`~
CREATE TABLE IF NOT EXISTS `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `carro`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `carro`~
CREATE TABLE IF NOT EXISTS `carro` (
  `idcarro` bigint(20) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(10) unsigned NOT NULL,
  `producto_idproducto` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idcarro`),
  KEY `carro_FKIndex1` (`producto_idproducto`),
  KEY `carro_FKIndex2` (`usuario_idusuario`)
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `categoria`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `categoria`~
CREATE TABLE IF NOT EXISTS `categoria` (
  `idcategoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `detalle_pedido`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `detalle_pedido`~
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `iddetalle_pedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `pedido_idpedido` bigint(20) NOT NULL,
  `producto_idproducto` int(10) unsigned NOT NULL,
  `cantidad` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`iddetalle_pedido`),
  KEY `detalle_pedido_FKIndex1` (`producto_idproducto`),
  KEY `detalle_pedido_FKIndex2` (`pedido_idpedido`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `estado`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `estado`~
CREATE TABLE IF NOT EXISTS `estado` (
  `idestado` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `abreviatura` varchar(15) NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `pedido`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `pedido`~
CREATE TABLE IF NOT EXISTS `pedido` (
  `idpedido` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado_idestado` int(10) unsigned NOT NULL,
  `usuario_idusuario` int(10) unsigned NOT NULL,
  `fecha_pedido` datetime NOT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  KEY `pedido_FKIndex1` (`usuario_idusuario`),
  KEY `pedido_FKIndex2` (`estado_idestado`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `producto`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `producto`~
CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `estado_idestado` int(10) unsigned NOT NULL,
  `subcategoria_idsubcategoria` int(10) unsigned NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text,
  `marca` varchar(50) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `precio` int(10) unsigned NOT NULL,
  `cantidad` int(10) unsigned NOT NULL,
  `img` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`idproducto`),
  KEY `producto_FKIndex1` (`subcategoria_idsubcategoria`),
  KEY `producto_FKIndex2` (`estado_idestado`)
) ENGINE=MyISAM AUTO_INCREMENT=123461 DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `subcategoria`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `subcategoria`~
CREATE TABLE IF NOT EXISTS `subcategoria` (
  `idsubcategoria` int(10) unsigned NOT NULL,
  `categoria_idcategoria` int(10) unsigned NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idsubcategoria`),
  KEY `subcategoria_FKIndex1` (`categoria_idcategoria`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `tipo_usuario`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `tipo_usuario`~
CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `idtipo_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE `usuario`~
-- -------------------------------------------~
DROP TABLE IF EXISTS `usuario`~
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo_usuario_idtipo_usuario` int(10) unsigned NOT NULL,
  `estado_idestado` int(10) unsigned NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_2` varchar(200) NOT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `sexo` varchar(1) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `usuario_FKIndex1` (`estado_idestado`),
  KEY `usuario_FKIndex2` (`tipo_usuario_idtipo_usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=332 DEFAULT CHARSET=utf8~

-- -------------------------------------------~
-- TABLE DATA authassignment~
-- -------------------------------------------~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('mantenedor_tipo_usuario','1','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','3','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','3','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','8','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','8','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('mantenedor_subcategorias','1','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','6','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','8','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','7','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','7','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','7','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','2','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('mantenedor_usuario','1','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('mantenedor_producto','1','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','9','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','9','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','9','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','10','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','79','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','79','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','79','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','321','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','321','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','321','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','309','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','309','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','309','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','310','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','310','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','310','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','311','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','311','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','311','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','330','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','330','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','330','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','328','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','328','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','328','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','329','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','329','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','329','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','327','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','327','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','327','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','326','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','326','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','326','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','324','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','324','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','324','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','325','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','325','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','325','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','323','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','323','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','323','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','322','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','322','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','322','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','320','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','320','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','320','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','319','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','319','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','319','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','318','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','318','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','318','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','317','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','317','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','317','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','316','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','316','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','316','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','315','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','315','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','315','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','314','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','314','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','314','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','313','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','313','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','313','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','308','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','308','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','308','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','307','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','307','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','307','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','306','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','306','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','306','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','304','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','304','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','304','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','305','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','305','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','305','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('mantenedor_pedidos','1','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('mantenedor_detalle_pedido','1','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('import_csv','1','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('lista_productos','331','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('carro','331','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('pedidos','331','','N;')~
INSERT INTO `authassignment` (`itemname`,`userid`,`bizrule`,`data`) VALUES
('mantenedor_categorias','1','','N;')~



-- -------------------------------------------~
-- TABLE DATA authitem~
-- -------------------------------------------~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_usuario','1','acceso completo al mantenedor de usuarios','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('lista_productos','1','acceso para visualizar la lista de productos del sistema','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('carro','1','acceso al carro de compra','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_producto','1','acceso completo al mantenedor de productos','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_detalle_pedido','1','acceso completo a los detalles del pedido','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_pedidos','1','acceso completo a los pedidos realizados','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('pedidos','1','acceso a los pedidos','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('import_csv','1','importación de datos desde archivos .csv','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_subcategorias','1','acceso total al mantenedor de subcategorias','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_categorias','1','acceso total al mantenedor de categorias','','N;')~
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_tipo_usuario','1','acceso total al mantenedor de los tipos de usuario','','N;')~



-- -------------------------------------------~
-- TABLE DATA categoria~
-- -------------------------------------------~
INSERT INTO `categoria` (`idcategoria`,`nombre`) VALUES
('1','vestimenta')~
INSERT INTO `categoria` (`idcategoria`,`nombre`) VALUES
('2','calzado')~
INSERT INTO `categoria` (`idcategoria`,`nombre`) VALUES
('3','accesorios')~
INSERT INTO `categoria` (`idcategoria`,`nombre`) VALUES
('4','otros')~



-- -------------------------------------------~
-- TABLE DATA detalle_pedido~
-- -------------------------------------------~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('10','9','427','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('9','8','40','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('8','7','427','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('7','7','1722','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('11','10','1953','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('12','10','21','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('13','10','40','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('14','11','427','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('15','12','427','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('16','13','427','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('17','14','1760','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('18','14','100','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('19','14','21','5')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('20','15','47','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('21','15','8','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('22','16','47','10')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('23','16','21','72')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('24','16','16','5')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('25','17','35','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('26','19','427','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('27','20','54','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('28','21','35','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('29','22','1818','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('30','22','427','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('31','23','427','130')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('32','24','54','2')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('33','24','427','3')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('34','25','9999','1')~
INSERT INTO `detalle_pedido` (`iddetalle_pedido`,`pedido_idpedido`,`producto_idproducto`,`cantidad`) VALUES
('35','25','427','2')~



-- -------------------------------------------~
-- TABLE DATA estado~
-- -------------------------------------------~
INSERT INTO `estado` (`idestado`,`nombre`,`abreviatura`) VALUES
('1','activo','act')~
INSERT INTO `estado` (`idestado`,`nombre`,`abreviatura`) VALUES
('5','desactivado','des')~
INSERT INTO `estado` (`idestado`,`nombre`,`abreviatura`) VALUES
('2','en espera','espera')~
INSERT INTO `estado` (`idestado`,`nombre`,`abreviatura`) VALUES
('3','para retirar','retirar')~
INSERT INTO `estado` (`idestado`,`nombre`,`abreviatura`) VALUES
('4','retirado','retirado')~



-- -------------------------------------------~
-- TABLE DATA pedido~
-- -------------------------------------------~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('8','3','1','2009-07-14 16:13:38','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('7','2','1','2009-07-14 15:27:24','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('9','2','1','2010-07-14 11:28:46','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('10','4','1','2010-07-14 12:10:57','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('11','3','2','2010-07-14 17:29:08','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('12','2','1','2011-07-14 10:29:54','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('13','2','1','2011-07-14 10:37:08','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('14','4','2','2011-07-14 13:06:12','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('15','4','1','2011-07-14 17:53:04','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('16','2','3','2011-07-14 18:08:19','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('17','3','2','2014-07-14 11:26:58','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('18','2','1','2009-07-14 00:00:00','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('19','2','8','2014-07-14 15:21:10','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('20','2','8','2014-07-14 15:44:13','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('21','3','8','2014-07-14 15:44:49','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('22','3','9','2014-07-14 17:11:04','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('23','4','9','2014-07-14 17:50:49','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('24','3','331','2017-07-14 16:22:53','0000-00-00 00:00:00')~
INSERT INTO `pedido` (`idpedido`,`estado_idestado`,`usuario_idusuario`,`fecha_pedido`,`fecha_entrega`) VALUES
('25','2','1','2018-07-14 18:06:07','0000-00-00 00:00:00')~



-- -------------------------------------------~
-- TABLE DATA producto~
-- -------------------------------------------~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('3','1','7','PANTALON SARGA FINA HOMBRE','','BENSONS','M','18186','1526','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('5','1','7','PANTALON DESFILE HOMBRE','PANTALON DESFILE BLANCO HOMBRE','Sin Marca','Sin Talla','24339','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('6','1','7','TENIDA SARGA FINA 14-A HOMBRE','TENIDA SARGA FINA 14-A HOMBRE','BENSONS','Sin Talla','56718','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('7','1','7','AMBO SARGA FINA MUJER','AMBO SARGA FINA MUJER','BENSONS','Sin Talla','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('8','1','7','BARBOQUEJO NEGRO','','Sin Marca','Sin Talla','4227','198','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('12','1','9','CORRECTOR LIQUIDO','','Sin Marca','Sin Talla','683','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('13','1','9','GOMA DE BORRAR','','Sin Marca','Sin Talla','211','11','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('15','1','7','AMBO COMBATE MUJER','','Sin Marca','42C','33287','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('16','1','7','PANTALON DESFILE HOMBRE','PANTALON BLANCO DESFILE VARON','OFICIAL','Sin Talla','24339','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('17','1','7','GUANTES BLANCOS DE CUERO','','Sin Marca','Sin Talla','9981','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('18','1','7','MALETA DE TITANIO','','SAXOLINE','Sin Talla','74197','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('21','1','0','PORTA T.I.N. DE CUERO','','Sin Marca','Sin Talla','4249','46','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('22','1','3','PORTA T.I.N. GIRATORIO','','Sin Marca','Sin Talla','1053','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('24','1','7','SOSTEN DEPORTIVO','SOSTEN BLANCO COPA','FLORES','Sin Talla','5804','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('27','1','3','TAMPAX','TAMPAX ','ESCUELA NAVAL','Sin Talla','2567','8','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('33','1','0','TOALLA  CHICA BLANCA','','Sin Marca','Sin Talla','3797','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('35','1','7','TRAJE DE BAÑO','TRAJE DE BAÑO','CARTERS','Sin Talla','9077','8','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('38','1','7','ZAPATILLAS','','NIKE','Sin Talla','19990','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('40','1','5','ZAPATO DE COMBATE','','ARMADA C. AB.','Sin Talla','23413','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('42','1','0','FUNDA DE ROPA','','Sin Marca','Sin Talla','11293','70','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('43','1','7','CHAQUETON DE ABRIGO','','Sin Marca','Sin Talla','57971','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('44','1','6','PROTECTOR DIARIO MUJER','PROTECTOR DIARIO MUJER','Sin Marca','Sin Talla','1261','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('45','1','0','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','ESNAVAL','Sin Talla','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('46','1','7','AMBO SARGA FINA MUJER','AMBO SARGA FINA MUJER','BENSONS','42L','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('47','1','7','TENIDA SARGA FINA 14-A HOMBRE','TENIDA SARGA FINA 14-A HOMBRE','Sin Marca','Sin Talla','56718','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('50','1','6','BETUN NEGRO P/ZAPATO','BETUN NEGRO P/ZAPATO','Sin Marca','Sin Talla','491','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('51','1','7','BOLSO DEPORTIVO DABA','','Sin Marca','Sin Talla','11893','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('53','1','3','TIRO DE CUERO P/ESPADA','','Sin Marca','Sin Talla','47707','51','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('54','1','5','ZAPATO REINA','ZAPATO REINA ','Sin Marca','Sin Talla','29381','29','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('57','1','0','BOTIN DE CUERO','','BOTIN DE PARADA','Sin Talla','44299','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('58','1','7','CALZA LAYCRA UNISEX','CALZA LAYCRA UNISEX','Sin Marca','Sin Talla','7553','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('61','1','3','CAMISETA ANCLAS CRUZADAS','CAMISETA ANCLAS CRUZADAS','CARTERS','Sin Talla','5251','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('63','1','0','CHAQUETA SARGA FINA FEMENINA','','Sin Marca','Sin Talla','34522','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('65','1','7','PANTALON DEPORTIVO AZUL VARON','','Sin Marca','Sin Talla','5386','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('66','1','0','AMBO SARGA FINA HOMBRE','AMBO SARGA FINA HOMBRE','ARMADA C. AB.','Sin Talla','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('67','1','6','TAMPAX REGULAR','','Sin Marca','Sin Talla','2925','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('69','1','3','SABANAS BLANCAS','','Sin Marca','Sin Talla','3528','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('71','1','7','HUMITA SMOKING VARON','','Sin Marca','Sin Talla','1200','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('73','1','0','PALAS RIGIDAS BRIGADIER MAYOR','','Sin Marca','Sin Talla','7758','22','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('74','1','0','CANDADO CHICO','','ODIS','Sin Talla','1971','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('76','1','3','HORQUILLA P/CABELLO','','Sin Marca','Sin Talla','955','53','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('78','1','7','CREMA PARA PEINAR','','Sin Marca','Sin Talla','1895','23','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('80','1','7','CALZA LAYCRA UNISEX','CALZA LAYCRA UNISEX','CARTERS','Sin Talla','7553','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('81','1','0','ALICATE CORTA U','','Sin Marca','Sin Talla','7249','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('82','1','3','COLET DE RASO NEGRO','','Sin Marca','Sin Talla','1278','53','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('83','1','3','GORRO MICROPOLAR NEGRO','','Sin Marca','Sin Talla','2184','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('84','1','3','FUNDA GORRA VINILICA','','Sin Marca','Sin Talla','9000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('85','1','7','BLUSA GALA FEMENINA','','Sin Marca','Sin Talla','17613','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('87','1','7','TENIDA SARGA FINA 14-A MUJER','TENIDA SARGA FINA 14-A HOMBRE','ARMADA C. AB.','Sin Talla','50214','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('91','1','0','SOSTEN DE COPA','','Sin Marca','Sin Talla','5592','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('93','1','0','CAMISA MANGA CORTA HOMBRE','CAMISA HOMBRE M/C','Sin Marca','Sin Talla','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('94','1','7','ESCUDOS DE PANAMA','','Sin Marca','Sin Talla','18662','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('95','1','0','CAMISA PU','CAMISA PU','Sin Marca','Sin Talla','10522','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('96','1','6','ANTIMICOTICO CREMA','ANTIMICOTICO CREMA','Sin Marca','Sin Talla','537','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('97','1','7','PALAS FLEXIBLES T1','','Sin Marca','Sin Talla','4092','7','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('98','1','0','GORRA CON FUNDA BLANCA','','Sin Marca','Sin Talla','19972','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('99','1','0','PALAS RIGIDAS T1','','Sin Marca','Sin Talla','4429','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('100','1','0','PARCHE DISTINTIVO  CADETE IM.','','Sin Marca','Sin Talla','1041','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('101','1','0','PLUMON PLASTICO ROPA NEGRO','','PILOT','Sin Talla','998','12','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('102','1','7','TENIDA DE COMBATE I.M.','','TRUSTPEC','Sin Talla','58169','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('103','1','3','COLET ESLASTICO','','Sin Marca','Sin Talla','102','59','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('104','1','0','ESCUDO GORRA HOMBRE','','Sin Marca','Sin Talla','6798','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('106','1','0','LAPIZ  DELINEADOR LABIOS','','Sin Marca','Sin Talla','2143','17','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('107','1','0','SOMBRA ESPERT W. TRIOS CHOCO','SOMBRA ESPERT W. TRIOS CHOCO','Sin Marca','Sin Talla','2834','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('109','1','0','RUBOR EXP.WEAR 100 MOCHA VEIV','','Sin Marca','Sin Talla','3447','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('110','1','3','DREAM MATE PRESSED POWDER HONE','','Sin Marca','Sin Talla','4899','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('111','1','0','COLOR DEFINER SHADOW SILVER','','Sin Marca','Sin Talla','2969','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('114','1','0','CORECTOR TRUE ILUSION','','Sin Marca','Sin Talla','2969','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('115','1','0','VOLUME LENGHT WP','','Sin Marca','Sin Talla','4381','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('118','1','0','LECHE DESMAQUILLANTE IDEAL BA','','Sin Marca','Sin Talla','3321','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('119','1','13','TONICO FACIAL BALANCE','TONICO FACIAL BALANCE','Sin Marca','Sin Talla','3204','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('120','1','0','DESMAQUILLANTE DE OJOS BIFASI','','Sin Marca','Sin Talla','3285','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('123','1','0','PALAS FLEXIBLES BRIG. MAYOR','','Sin Marca','Sin Talla','7970','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('124','1','12','REGLA PARALELA DE 15','','Sin Marca','Sin Talla','13033','28','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('125','1','3','PEALES NEGROS ELASTICADOS','','Sin Marca','Sin Talla','955','21','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('126','1','6','MAQUINA DE AFEITAR','MAQUINA DE AFEITAR','Sin Marca','Sin Talla','2979','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('127','1','6','CEPILLO DE DIENTES','','Sin Marca','Sin Talla','558','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('128','1','3','TAMPAX','','Sin Marca','Sin Talla','1977','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('129','1','0','CAMISETA DEPORTIVA AZUL DAMA','','Sin Marca','Sin Talla','5974','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('130','1','7','CAMISETA DEPORTIVA BLANCA DAMA','','Sin Marca','Sin Talla','5834','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('131','1','0','CAMISETA DRY FIT MUJER','CAMISETA DRY FIT MUJER','Sin Marca','Sin Talla','8207','41','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('132','1','0','TOALLITA DESMAQUILLANTE','','Sin Marca','Sin Talla','2285','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('134','1','3','CHAPA PARADA CON ANCLA','CHAPA PARADA CON ANCLA','Sin Marca','Sin Talla','3332','151','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('135','1','7','POLERON DE NAVEGACION','','Sin Marca','Sin Talla','14301','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('136','1','7','ALCOHOL GEL GERMAGEL 60ML.','','Sin Marca','Sin Talla','809','79','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('137','1','7','AROS DE PERLA','','Sin Marca','Sin Talla','56040','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('139','1','7','CAPA PA','','Sin Marca','Sin Talla','120141','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('140','1','5','ZAPATO BLANCO PU','ZAPATO BLANCO PU','AMERICAN SHOES','40','26537','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('141','1','7','COLGADOR DE ROPA','COLGADOR DE ROPA','Sin Marca','Sin Talla','1063','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('143','1','7','PANTALETA MUJER','PANTALETA MUJER','CARTERS','XS','2820','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('144','1','7','FUNDA DE ROPA','','ESNAVAL','Sin Talla','11293','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('145','1','7','SOSTEN DEPORTIVO','SOSTEN DEPORTIVO ','CARTERS','Sin Talla','6537','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('146','1','7','GUANTES STRECH MUJER','GUANTES STRECH MUJER','Sin Marca','Sin Talla','1871','261','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('147','1','0','PIJAMA GAMUZA','PIJAMA GAMUZA ','Sin Marca','Sin Talla','16402','30','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('148','1','7','FUNDA DE GORRA MUJER','FUNDA DE GORRA MUJER','Sin Marca','Sin Talla','9601','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('149','1','7','GORRA FEMENINA','GORRA FEMENINA','Sin Marca','Sin Talla','45514','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('150','1','3','CADENILLA PARA SMOKING','','Sin Marca','Sin Talla','1133','34','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('153','1','3','SECADOR DE PELO','SECADOR DE PELO ','Sin Marca','Sin Talla','9281','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('154','1','3','PALAS FLEXIBLES DE BRIGADIER','PALAS FLEXIBLES DE BRIGADIER','Sin Marca','Sin Talla','7297','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('155','1','3','PALAS FLEXIBLE E.N.','PALAS FLEXIBLE E.N.','Sin Marca','Sin Talla','5450','7','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('158','1','7','PLACAS DE IDENTIFICACION','','Sin Marca','Sin Talla','3000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('161','1','0','1BRILLO PARA LABIOS','','Sin Marca','Sin Talla','2021','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('164','1','7','PORTAMINA 0.5','','Sin Marca','Sin Talla','337','27','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('165','1','3','CEPILLO PARA CABELLO','','Sin Marca','Sin Talla','3076','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('167','1','3','ESPEJO PARA CARTERA','ESPEJO PARA CARTERA ','Sin Marca','Sin Talla','1350','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('168','1','3','MAQUINA DE AFEITAR','MAQUINA DE AFEITAR','DG','S','2979','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('171','1','3','GEL PARA CABELLO VO5 VARON','','Sin Marca','Sin Talla','948','16','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('172','1','5','ZAPATO DE COMBATE','ZAPATO DE COMBATE','TRECK','40','23413','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('173','1','0','COLOR DEFINER SHADOW BRONZE','','Sin Marca','Sin Talla','2969','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('174','1','0','AMBO COMBATE HOMBRE','AMBO DE COMBATE','DG','Sin Talla','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('177','1','7','AMBO COMBATE MUJER','AMBO DE COMBATE','Sin Marca','Sin Talla','33287','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('178','1','3','AROS DE PERLA','','ESNAVAL','Sin Talla','56040','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('181','1','0','CAMISA DAMA MANGA CORTA','','Sin Marca','Sin Talla','9082','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('182','1','6','SEDA DENTAL','SEDA DENTAL','ESNAVAL','Sin Talla','1814','26','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('184','1','6','CORTAU','','Sin Marca','Sin Talla','571','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('185','1','6','CORTAU','CORTAU','TRIM','Sin Talla','1005','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('187','1','6','DESODORANTE SPRY PARA PIES','DESODORANTE SPRY PARA PIES','Sin Marca','Sin Talla','3124','18','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('188','1','6','BLOQUEADOR SOLAR','','Sin Marca','Sin Talla','5459','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('189','1','7','BIKINI ALGODON ELASTICADO','','Sin Marca','Sin Talla','1921','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('190','1','3','BOLSO PORTADOCUMENTO','','Sin Marca','Sin Talla','17315','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('191','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','41','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('192','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','34','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('193','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA ','A.SHOE','Sin Talla','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('194','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','Sin Marca','Sin Talla','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('195','1','6','JABONERA PLASTICA','','Sin Marca','Sin Talla','693','12','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('196','1','6','CREMA HUMECTANTE','','Sin Marca','Sin Talla','2388','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('197','1','7','CAMISETA DRY FIT','CAMISETA DRY FIT HOMBRE','CARTERS','M','8078','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('198','1','7','CAMISETA DRY FIT','CAMISETA DRY FIT MUJER','CARTERS','Sin Talla','8078','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('199','1','7','BATA BA','BATA BA','CARTERS','M','27630','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('200','1','7','BOTON DORADO 13 MM','','Sin Marca','Sin Talla','755','547','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('201','1','7','BOTON DORADO 16 MM PATA CORTA','BOTON DORADO 16 MM PATA CORTA','WATERBURY','Sin Talla','1082','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('202','1','3','PORTA UTILES DE ASEO','','Sin Marca','Sin Talla','5453','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('203','1','0','BOXER HOMBRE','','CARTERS','S','3090','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('204','1','9','LAPIZ DE PASTA ROJO','','Sin Marca','Sin Talla','109','37','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('205','1','7','SALIDA DE CANCHA','SALIDA DE CANCHA','ESNAVAL','Sin Talla','39872','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('207','1','0','PANTALON SARGA FINA HOMBRE','PANTALON SARGA FINA HOMBRE','BENSONS','Sin Talla','18186','11','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('209','1','7','FALDA PERSONAL NAVAL FEMENINO','','Sin Marca','Sin Talla','13008','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('212','1','7','CHAQUETON DE ABRIGO','','ESNAVAL','Sin Talla','57971','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('214','1','7','TENIDA DE SERVICIO','','Sin Marca','Sin Talla','54128','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('216','1','7','AMBO COMBATE DAMA','','Sin Marca','Sin Talla','37039','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('218','1','7','GORRA FEMENINA','GORRA FEMENINA','Sin Marca','6 7/8','45514','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('219','1','3','GORRO DE NATACION','','Sin Marca','Sin Talla','2058','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('220','1','7','CALZONCILLO LARGO','CALZONCILLO LARGO','CARTERS','S','6467','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('225','1','5','ZAPATO NEGRO FEMENINO','','Sin Marca','Sin Talla','33772','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('227','1','0','CAMISA','','BENSONS','Sin Talla','9904','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('228','1','8','MANUAL ORIENTACION PROFESIONAL','','IMPRENTA','Sin Talla','26541','24','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('231','1','11','ALBUM FOTOGRAFICO','','Sin Marca','Sin Talla','38500','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('232','1','7','GUANTE BLANCO HOMBRE','','Sin Marca','Sin Talla','2013','237','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('234','1','3','DRAGONAS','','Sin Marca','Sin Talla','33827','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('235','1','0','GUANTES STRECH MUJER','GUANTES STRECH MUJER','ESNAVAL','Sin Talla','1871','622','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('238','1','0','HAWAIANAS','','Sin Marca','Sin Talla','6141','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('239','1','3','ANCLOTE BRONCE COLOR BLANCO','','Sin Marca','Sin Talla','1378','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('242','1','3','HERRETE DE IDENTIFICACION CP-1718','','Sin Marca','Sin Talla','1759','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('243','1','0','HERRETE DE IDENTIFICACION CP-1722','','Sin Marca','Sin Talla','1800','26','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('244','1','3','HORQUILLA PARA CABELLO','HORQUILLA PARA CABELLO','Sin Marca','Sin Talla','993','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('245','1','7','JERSEY  TIPO R.N. CP-21265','','Sin Marca','Sin Talla','21265','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('246','1','0','BOXER  HOMBRE','','Sin Marca','L','2985','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('247','1','9','PLUMON PILOT BLANCO','','Sin Marca','Sin Talla','1657','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('249','1','7','FUNDA DE GORRA','','Sin Marca','Sin Talla','5721','157','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('252','1','3','MAQUINA  DE AFEITAR','MAQUINA  DE AFEITAR','Sin Marca','Sin Talla','3225','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('253','1','5','ZAPATO NEGRO HW','ZAPATO NEGRO HW','AMERICAN SHOES','Sin Talla','34433','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('254','1','7','AMBO SARGA FINA MUJER','AMBO SARGA FINA MUJER','ESNAVAL','Sin Talla','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('255','1','7','TENIDA DE GALA FEMENINA','','Sin Marca','Sin Talla','164024','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('262','1','7','CANDADO 20 MM','','ODIS','Sin Talla','2831','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('263','1','7','SOSTEN DEPORTIVO','SOSTEN DEPORTIVO ','CARTERS','S','6537','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('264','1','0','PANTALETA MUJER','','Sin Marca','Sin Talla','2820','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('265','1','7','SABANAS BLANCAS','SABANAS BLANCAS','ROPA','Sin Talla','3528','181','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('266','1','7','APELLIDO AMBO COMBATE','APELLIDO AMBO COMBATE','ESNAVAL','Sin Talla','1276','7','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('267','1','0','CORBATIN LANILLA','CORBATIN LANILLA ','Sin Marca','Sin Talla','2045','19','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('269','1','3','PORTA SERVILLETERO','','Sin Marca','Sin Talla','10296','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('272','1','0','PANTALON DE NAVEGACION','','Sin Marca','Sin Talla','9612','62','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('277','1','3','ESTRELLA BORDADA P/MANGA','','Sin Marca','Sin Talla','2806','137','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('278','1','3','GORRO NAVEGACION','GORRO NAVEGACION','Sin Marca','Sin Talla','2978','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('284','1','0','PALAS FLEXIBLE E.N.','','DG','Sin Talla','5450','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('285','1','0','PANTALON DESFILE MUJER','','ESNAVAL','Sin Talla','22091','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('288','1','7','CALZON LARGO','CALZON LARGO','CARTERS','Sin Talla','6365','22','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('291','1','0','CAMISETA LANILLA MANGA CORTA','','Sin Marca','Sin Talla','3132','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('295','1','3','ESCOBILLA MAGNETICA','','Sin Marca','Sin Talla','1206','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('296','1','3','MALETA TITANIO','','SAXOLINE','Sin Talla','74197','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('297','1','7','PLACA BANDERA CHILENA','','Sin Marca','Sin Talla','6175','8','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('301','1','3','LLAVERO METALICO CON ESCUDO','','MEDAL','Sin Talla','1836','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('302','1','7','CALZA LAYCRA UNISEX','CALZA LAYCRA UNISEX','Sin Marca','M','7553','18','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('304','1','0','MASCARA DEFINE A LASH VOLUME','','Sin Marca','Sin Talla','4460','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('305','1','0','TAPAS MANUAL DEL CADETE','','Sin Marca','Sin Talla','3331','86','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('306','1','0','REPUESTO MQ. AFEITAR','','Sin Marca','Sin Talla','5548','11','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('307','1','7','FAJA P/TENIDA DE GALA FEM','','Sin Marca','Sin Talla','14165','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('309','1','0','CAMISETA ANCLAS CRUZADAS','CAMISETA ANCLAS CRUZADAS','ESNAVAL','Sin Talla','5251','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('312','1','0','CALCETIN  INVIERNO','','Sin Marca','Sin Talla','1605','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('314','1','0','CANCIONERO NAVAL','','Sin Marca','Sin Talla','1455','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('316','1','3','LIGAS PARA BOTA','','ROPA','Sin Talla','1188','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('324','1','3','PIOCHA ANCLAS CRUZADAS 25MM','','Sin Marca','Sin Talla','2010','107','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('327','1','0','ROSA MANIOBRA','','Sin Marca','Sin Talla','61','1823','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('328','1','3','BOLSA P/LAVADO DE ROPA','','Sin Marca','Sin Talla','563','11','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('329','1','0','BETUN NEGRO P/ZAPATO','','DG','Sin Talla','491','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('330','1','0','TOALLA GRANDE BLANCA','','Sin Marca','Sin Talla','8613','94','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('332','1','6','DESODORANTE EN SPRAY HOMBRE','DESODORANTE EN SPRAY HOMBRE','Sin Marca','Sin Talla','1434','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('333','1','7','PANTALON DESFILE HOMBRE','PANTALON BLANCO DESFILE VARON','ESCUELA NAVAL','Sin Talla','24339','51','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('334','1','7','CORBATIN RASO','CORBATIN RASO','Sin Marca','Sin Talla','2080','38','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('336','1','0','BEATLE BLANCO','','Sin Marca','Sin Talla','5238','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('338','1','7','PANTALON DESFILE MUJER','PANTALON DESFILE MUJER','Sin Marca','Sin Talla','22091','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('341','1','7','CAMISA DAMA M/C','CAMISA DAMA M/C','PRISMA','Sin Talla','9533','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('344','1','0','COMPAS PUNTA SECA','','Sin Marca','Sin Talla','16428','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('346','1','5','BOTAS DE MARCHA','','Sin Marca','Sin Talla','48343','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('348','1','0','GORRO','','ESNAVAL','Sin Talla','2467','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('351','1','3','MALETIN','','NEGRO','Sin Talla','34373','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('353','1','7','GUANTE CUERO CAFE','','Sin Marca','Sin Talla','9566','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('356','1','0','PANTALON DEPORTIVO','','Sin Marca','Sin Talla','6152','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('361','1','3','PANTY ELASTICADA','PANTY ELASTICADA','Sin Marca','Sin Talla','3503','37','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('362','1','3','PA','','Sin Marca','Sin Talla','312','52','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('363','1','11','PORTA TACO DE CUERO','','Sin Marca','Sin Talla','3900','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('365','1','7','PARCHE DOBLE CUADRO DE HONOR','PARCHE DOBLE CUADRO DE HONOR ','Sin Marca','Sin Talla','1849','24','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('366','1','7','PARCHE SIMPLE CUADRO DE HONOR','PARCHE SIMPLE CUADRO DE HONOR','Sin Marca','Sin Talla','1191','39','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('368','1','7','PARCHE TRIPLE PARADA','PARCHE TRIPLE CUADRO DE HONOR ','Sin Marca','Sin Talla','2290','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('370','1','11','ANOTADOR NAVAL','','Sin Marca','Sin Talla','2200','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('371','1','7','GUANTES CLIMA FRIO','','Sin Marca','Sin Talla','11117','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('372','1','3','CARTERA DE CUERO NEGRA','','Sin Marca','Sin Talla','33607','8','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('375','1','7','CORBATA NEGRA LANILLA','','Sin Marca','Sin Talla','2007','41','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('376','1','3','ESPADA PARA OFICIAL','','Sin Marca','Sin Talla','254916','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('378','1','8','PORTA TIN','','Sin Marca','Sin Talla','3810','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('379','1','0','PORTA GORRA MUJER','','Sin Marca','Sin Talla','6441','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('383','1','0','BLOCK DE 50 HJ PAPEL 880','','Sin Marca','Sin Talla','697','27','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('386','1','11','LIBRETAS DE BOLSILLO','','Sin Marca','Sin Talla','1021','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('387','1','0','LIBRETA DE BOLSILLO P/APUNTES','','Sin Marca','Sin Talla','425','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('388','1','11','PORTA VASOS 6 UN','','Sin Marca','Sin Talla','8500','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('389','1','11','CALENDARIO ESCRITORIO','','Sin Marca','Sin Talla','3700','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('390','1','11','CARPETA DE ESCRITORIO','','LUXE','Sin Talla','23000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('391','1','7','PARKA IM','','Sin Marca','Sin Talla','90488','24','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('392','1','0','PANTALON DEPORTIVO CP-5460','','Sin Marca','Sin Talla','5575','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('395','1','0','PIJAMA BLANCO','','Sin Marca','Sin Talla','8638','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('397','1','0','PIJAMA POLAR','','Sin Marca','Sin Talla','16165','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('399','1','0','CAMISA DOBLE PU','','Sin Marca','Sin Talla','10829','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('401','1','7','PALAS DE PANAMA','','Sin Marca','Sin Talla','14930','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('402','1','5','ZAPATO NEGRO HW','','AMERICAN SHOES','M','34433','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('405','1','0','BALSAMO SEDAL','','A.SHOE','Sin Talla','1675','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('407','1','3','PINCHES PARA CABELLO','PINCHES PARA CABELLO','Sin Marca','Sin Talla','192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('408','1','3','COLLERA DE CUELLO','','ESNAVAL','Sin Talla','857','50','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('409','1','7','PIOCHA LITORAL DORADA','','Sin Marca','Sin Talla','3534','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('410','1','3','PLACA IDENTIFICACION','','ROPA','Sin Talla','3000','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('411','1','3','DISTINTIVO BRIG.MAYOR T/PARADA','DISTINTIVO BRIG.MAYOR T/PARADA','Sin Marca','Sin Talla','4495','7','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('412','1','0','ESPEJO SE','','Sin Marca','Sin Talla','8391','62','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('413','1','7','PIOCHA ABASTECIMIENTO','','Sin Marca','Sin Talla','2856','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('415','1','3','GUANTES DE CUERO','','Sin Marca','Sin Talla','9768','16','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('418','1','0','PORTA LAPIZ DE VINILICO','','Sin Marca','Sin Talla','689','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('420','1','0','PALAS FLEXIBLES BRIG. MAYOR CP-10461','','Sin Marca','Sin Talla','10597','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('421','1','0','PARCHE DOBLE CUADRO DE HONOR CP-1733','','Sin Marca','Sin Talla','1769','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('423','1','0','PARCHE TRIPLE SERVICIO','','Sin Marca','Sin Talla','2261','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('424','1','3','PARCHES OLIMPICOS','','Sin Marca','Sin Talla','1008','168','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('425','1','3','BOTON DORADO 23 MM P/LARGA','','WATERBURY','Sin Talla','952','90','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('427','1','4','QUEPIS IM.','','Sin Marca','Sin Talla','5634','144','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('428','1','3','CUBRECAMA CHENILLE','','Sin Marca','Sin Talla','18339','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('429','1','3','CUBRE COLCHON','','Sin Marca','Sin Talla','11444','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('431','1','3','PALAS FLEXIBLES 3 A','','Sin Marca','Sin Talla','2261','8','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('435','1','0','PALAS FLEXIBLES BRIGADIER','','Sin Marca','Sin Talla','7140','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('436','1','0','PALAS RIGIDAS BRIGADIER','','Sin Marca','Sin Talla','6324','80','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('437','1','0','CAMISA MANGA CORTA HOMBRE','','Sin Marca','M','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('438','1','3','PIOCHA INFANTERIA DE MARINA','','Sin Marca','Sin Talla','3327','14','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('439','1','0','CORBATA NEGRA RAZO','','Sin Marca','Sin Talla','3039','184','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('440','1','7','CAMISETA LANILLA M/C','CAMISETA LANILLA MANGA CORTA','CARTERS','Sin Talla','3060','96','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('441','1','3','BILLETERA CUERO, LOGO E.N.','','ESCUELA NAVAL','Sin Talla','6657','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('443','1','0','PIJAMA GAMUZA AZUL','','Sin Marca','Sin Talla','12936','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('446','1','7','BOLSO DEPORTIVO E.N.','','Sin Marca','Sin Talla','11893','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('450','1','3','MAQUINA AFEITAR MACH III CP-1947','','Sin Marca','Sin Talla','1947','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('457','1','0','PALAS RIGIDA E.N.','','Sin Marca','Sin Talla','5431','49','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('458','1','0','AUTOADHESIVO LOGO E.N.','','Sin Marca','Sin Talla','246','1185','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('461','1','6','PASTA DENTAL','PASTA DENTAL','Sin Marca','Sin Talla','1348','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('464','1','0','SACAPUNTA METALICO','','Sin Marca','Sin Talla','216','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('465','1','3','ESCOBILLA DE ZAPATO C/BETUNERA','','Sin Marca','Sin Talla','1656','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('466','1','0','PEGAMENTO STIC-FIX EN BARRA','','Sin Marca','Sin Talla','462','16','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('470','1','0','TRAJE DE BA','','Sin Marca','Sin Talla','9077','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('473','1','0','PALAS RIGIDA BRIGADIER MAYOR','','Sin Marca','Sin Talla','7422','17','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('475','1','3','VASO PLASTICO','','Sin Marca','Sin Talla','362','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('478','1','0','ESCUADRA STAEDTLER 45','','Sin Marca','Sin Talla','937','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('479','1','0','VALE DE ROPA','VALE DE ROPA','ESNAVAL','Sin Talla','1795','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('480','1','7','MEDIAS AZULES DEPORTIVAS','','Sin Marca','Sin Talla','1606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('481','1','0','PALAS FLEXIBLE 2 A','','Sin Marca','Sin Talla','2261','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('483','1','7','PARKA IMPERMEABLE','','Sin Marca','Sin Talla','52712','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('487','1','7','BIKINI ALGODON','','Sin Marca','Sin Talla','1895','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('493','1','0','CAMISA BLANCA PECHERA','','Sin Marca','Sin Talla','6885','150','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('494','1','3','BOTON NEGRO PARA GORRA','BOTON NEGRO PARA GORRA','ARMADA C. AB.','Sin Talla','1057','257','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('495','1','0','BOTIN CON TACO','','Sin Marca','Sin Talla','44813','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('496','1','7','PANTALON DEPORTIVO','PANTALON DEPORTIVO','CARTERS','Sin Talla','6152','31','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('498','1','0','PALA FLEXIBLE BRIGADIER','','Sin Marca','Sin Talla','5630','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('499','1','7','CALCETAS BLANCA CORTA DEPORT.','','Sin Marca','Sin Talla','1578','122','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('500','1','3','DESODORANTE CORPORAL, SP','','Sin Marca','Sin Talla','1214','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('503','1','7','CINTURON NEGRO','CINTURON NEGRO','Sin Marca','Sin Talla','2366','76','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('504','1','3','PITO DE MANIOBRA','','Sin Marca','Sin Talla','4407','23','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('506','1','6','MAQUINA DE AFEITAR','MAQUINA  DE AFEITAR','DG','Sin Talla','2979','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('507','1','7','CAMISETA DRY FIT','CAMISETA DRY FIT','CARTERS','XL','8078','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('510','1','0','SALIDA DE CANCHA','','Sin Marca','Sin Talla','39872','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('511','1','3','ESCOBILLA MAGNETICA','','Sin Marca','CHICO','1206','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('513','1','0','BLOQUEADOR LABIAL',' BLOQUEADOR LABIAL','Sin Marca','Sin Talla','1814','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('514','1','3','FRAZADA','','PLAZA Y MEDIA','Sin Talla','8912','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('515','1','3','PORTA TIN GIRATORIO','','Sin Marca','Sin Talla','1056','115','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('516','1','3','ESCUDO GORRA HOMBRE','','ESNAVAL','Sin Talla','6798','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('517','1','3','LIGAS PARA BOTA','','Sin Marca','Sin Talla','1188','56','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('518','1','0','BOLSO DESEMBARCO','','Sin Marca','Sin Talla','12029','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('520','1','7','TELA BLANCA PARA SUTACH','TELA PARA SOUTACHE','Sin Marca','Sin Talla','355','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('522','1','0','MINA FINA 0.7','','Sin Marca','Sin Talla','386','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('526','1','7','CAMISA PECHERA MUJER','','Sin Marca','Sin Talla','9882','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('532','1','7','PIJAMA BLANCO','','ESNAVAL','Sin Talla','8638','36','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('533','1','0','WOLLY POLLY','','Sin Marca','Sin Talla','34837','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('534','1','3','PRENDEDOR DE CORBATA','','Sin Marca','Sin Talla','3733','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('535','1','0','CUADERNO UNIVERSITARIO DE MATE','','Sin Marca','Sin Talla','556','160','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('536','1','6','ESPUMA DE AFEITAR','ESPUMA DE AFEITAR','Sin Marca','Sin Talla','4033','11','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('538','1','6','JABON DE BA','JABON DE BA','Sin Marca','Sin Talla','593','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('540','1','3','DISTINTIVO BRIGADIER','DISTINTIVO BRIGADIER','Sin Marca','Sin Talla','4829','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('541','1','3','DISTINTIVO BRIG.MAYOR T/SERVIC','DISTINTIVO BRIG.MAYOR T/SERVICIO','T.SERVICIO','Sin Talla','4743','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('542','1','0','VALE DE ROPA','','Sin Marca','Sin Talla','1591','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('543','1','7','CAMISA SMOKING PLIZADA','CAMISA SMOKING PLIZADA','ARAUCO','Sin Talla','16677','19','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('544','1','7','PALAS FLEXIBLE E.N.','PALAS FLEXIBLE E.N.','ESNAVAL','Sin Talla','5450','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('545','1','7','IMPERMEABLE NAVAL','','Sin Marca','Sin Talla','46599','11','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('546','1','0','COLLERA DE PU','','Sin Marca','Sin Talla','5504','52','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('547','1','0','PANTALON SARGA FINA CP-25298','','Sin Marca','Sin Talla','25905','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('548','1','3','COSMETIQUERO DE CUERO','','Sin Marca','Sin Talla','7762','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('549','1','0','ESCUDO GORRA MUJER','','Sin Marca','Sin Talla','5869','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('552','1','0','SERVILLETA GENERO BLANCA','','Sin Marca','Sin Talla','992','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('553','1','3','CALCETIN DE HILO NEGRO','','Sin Marca','Sin Talla','1620','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('554','1','0','BOXER HOMBRE','','CARTERS','XL','3090','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('555','1','0','PORTA GORRA HOMBRE','','Sin Marca','Sin Talla','6278','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('556','1','0','BUZO GRIS ESCUELA NAVAL CP-19188','','Sin Marca','Sin Talla','19591','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('557','1','7','CALCETIN DE INVIERNO','','Sin Marca','Sin Talla','1993','1232','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('558','1','0','CAMISA DOBLE PU','CAMISA DOBLE PU','BENSONS','47','10300','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('562','1','0','LIMPIA METAL, BRASSO','','Sin Marca','Sin Talla','3499','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('564','1','6','TOALLA BLANCA CHICA','','Sin Marca','Sin Talla','4349','116','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('567','1','7','CORBATIN RASO NEGRO','','Sin Marca','Sin Talla','2139','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('568','1','3','DISTINTIVO BRIG.T/PARADA','DISTINTIVO BRIG.T/PARADA','Sin Marca','Sin Talla','4379','51','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('569','1','6','ESCOBILLA DE U','','Sin Marca','Sin Talla','544','40','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('570','1','0','CAMISETA ANCLAS CRUZADA CP-5489','','Sin Marca','Sin Talla','5621','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('571','1','3','CORTAU','CORTAU','TRECK','Sin Talla','1005','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('573','1','0','CANDADO MEDIANO (140MM)','','Sin Marca','Sin Talla','2977','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('575','1','7','SLIP BLANCO','','Sin Marca','Sin Talla','1858','462','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('576','1','0','LAPIZ DE PASTA AZUL','','Sin Marca','Sin Talla','102','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('577','1','0','BLOCK DE C.U.C.','','Sin Marca','Sin Talla','1050','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('580','1','0','PEINETA DE BOLSILLO','','Sin Marca','Sin Talla','441','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('581','1','0','MINAS 0.5 REPUESTO','','Sin Marca','Sin Talla','523','18','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('582','1','0','TIRANTE PARA PANTALON','','Sin Marca','Sin Talla','3689','11','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('585','1','3','DISTINTIVO BRIG.T/SERVICIO','DISTINTIVO BRIG.T/SERVICIO','Sin Marca','Sin Talla','4257','55','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('586','1','0','PA','','Sin Marca','Sin Talla','793','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('587','1','3','PANTY ELASTICADA CAFFARENA','','Sin Marca','Sin Talla','2898','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('588','1','0','BLOCK DE CERTAMEN','','Sin Marca','Sin Talla','1658','46','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('589','1','0','CREMA GARNIER','','Sin Marca','Sin Talla','1076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('592','1','3','BRILLO LABIAL','','Sin Marca','Sin Talla','1760','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('593','1','3','DESODORANTE MUJER','','Sin Marca','Sin Talla','1527','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('594','1','0','FUNDA DE ALMOHADA','','Sin Marca','Sin Talla','940','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('595','1','0','PINZAS','','Sin Marca','Sin Talla','876','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('596','1','0','BOTON DORADO 13 MM','','OFICIAL','Sin Talla','755','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('597','1','6','FIJADOR CABELLO MUJER','GEL PARA CABELLO MUJER','Sin Marca','Sin Talla','3245','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('598','1','0','CAMISA BOBLE PU','','Sin Marca','Sin Talla','9654','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('599','1','0','PALAS FLEXIBLES 1','','Sin Marca','Sin Talla','2641','71','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('600','1','0','VOLUM EXPRESS MAYBELLINE','','Sin Marca','Sin Talla','4436','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('601','1','0','CHAQUETILLA SARGA FINA T-14 CP-23797','','Sin Marca','Sin Talla','23797','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('603','1','3','EXTENSOR P/CALZADO','','Sin Marca','Sin Talla','6022','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('604','1','6','SHAMPOO MUJER','SHAMPOO MUJER','Sin Marca','Sin Talla','1345','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('605','1','3','MALLA P/CABELLO','','Sin Marca','Sin Talla','877','17','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('610','1','3','LENTES DE NATACION','','Sin Marca','Sin Talla','6129','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('611','1','7','TRAJE DE BA','TRAJE DE BA','Sin Marca','DAMA S','12629','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('612','1','5','PANTINAS DE BA','PANTINAS DE BA','SPEEDO','Sin Talla','3200','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('614','1','3','PORTATRAJE NEGRO SIPPER','PORTATRAJE NEGRO SIPPER','SAXOLINE','Sin Talla','21599','31','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('615','1','3','CARTERA ESPECIAL','','Sin Marca','Sin Talla','31850','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('616','1','7','CORBATIN PARA HOMBRE','','Sin Marca','Sin Talla','1918','44','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('617','1','0','PANTALON DESFILE HOMBRE','','ESNAVAL','Sin Talla','24339','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('618','1','0','CAMISA DAMA DOBLE PU','','Sin Marca','Sin Talla','8721','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('620','1','7','CAPOTE NAVAL','','Sin Marca','Sin Talla','80920','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('621','1','7','CONJ. CLIMA FRIO TABACO CAPA 2','','Sin Marca','Sin Talla','21560','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('622','1','0','COLGADOR DE ROPA MADERA HOMBRE','','Sin Marca','Sin Talla','1012','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('623','1','3','CORTAU','CORTAU','Sin Marca','Sin Talla','1005','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('624','1','7','CUELLOS SENCILLOS','','Sin Marca','Sin Talla','910','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('625','1','3','ESCUDO GORRA FEMENINA','','Sin Marca','Sin Talla','6258','41','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('626','1','3','ESPEJO PARA CARTERA','ESPEJO PARA CARTERA','OFICIAL','Sin Talla','1350','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('627','1','7','FALDA PERS. NAVAL FEMENINO','','Sin Marca','Sin Talla','7429','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('628','1','3','FUNDA DE GORRA PERS. FEMENINO CP-7152','','Sin Marca','Sin Talla','7477','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('629','1','7','FUNDA DE GORRA MUJER','','ESNAVAL','Sin Talla','9601','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('630','1','7','TALONERA DE GEL','','Sin Marca','Sin Talla','4073','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('631','1','3','GAFA SOLAR UNIFORME L','','Sin Marca','Sin Talla','22531','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('632','1','3','GAFA SOLAR UNIFORME S','','Sin Marca','Sin Talla','23372','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('633','1','3','GALON HILO DE ORO 6,5 MM','','Sin Marca','Sin Talla','2501','30','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('634','1','3','PALAS FLEXIBLES EN','','Sin Marca','Sin Talla','6089','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('635','1','3','PIOCHAS NEGRAS','','Sin Marca','Sin Talla','7021','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('636','1','3','PIOCHAS BLANCA','','Sin Marca','Sin Talla','5950','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('637','1','7','PLANTILLAS DE GEL','','Sin Marca','Sin Talla','7778','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('638','1','3','GAFA SOLAR UNIFORME M','','Sin Marca','Sin Talla','22824','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('639','1','0','GALON HILO DE ORO CP-6118','','Sin Marca','Sin Talla','6347','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('640','1','3','BOINA NEGRA','','Sin Marca','Sin Talla','9631','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('641','1','7','AMBO SARGA FINA','AMBO SARGA FINA ','BENSONS','50L','57809','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('643','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','Sin Marca','Sin Talla','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('646','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','ESNAVAL','40','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('648','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','Sin Marca','44','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('649','1','7','AMBO COMBATE HOMBRE','','Sin Marca','46','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('650','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','ESNAVAL','48','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('651','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','ESCUELA NAVAL','50','34328','14','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('652','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','Sin Marca','52','34328','16','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('654','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','Sin Marca','XL','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('655','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','Sin Marca','XXL','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('657','1','7','BUZO DEPORTIVO GRIS','','Sin Marca','S','18618','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('658','1','7','BUZO DEPORTIVO GRIS','','Sin Marca','M','18618','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('659','1','7','BUZO DEPORTIVO GRIS CP-0','','Sin Marca','XS','18267','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('660','1','7','BUZO DEPORTIVO GRIS','','Sin Marca','L','18618','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('661','1','7','BUZO DEPORTIVO GRIS','','Sin Marca','XL','18618','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('668','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','Sin Marca','37','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('671','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','42','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('672','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','38','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('673','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','Sin Marca','42','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('678','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','36','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('680','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','39','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('683','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','Sin Marca','37','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('684','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','36','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('686','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','Sin Marca','40','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('687','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','44','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('689','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','AMERICAN SHOES','35','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('690','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','Sin Marca','46','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('692','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','41','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('703','1','7','AMBO SARGA FINA HOMBRE','','Sin Marca','44R','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('706','1','7','AMBO SARGA FINA HOMBRE','AMBO SARGA FINA HOMBRE','Sin Marca','46R','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('707','1','7','AMBO SARGA FINA HOMBRE','AMBO SARGA FINA HOMBRE','Sin Marca','46L','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('709','1','7','AMBO SARGA FINA HOMBRE','AMBO SARGA FINA HOMBRE','Sin Marca','48R','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('710','1','7','TENIDA SARGA FINA 14-A HOMBRE','TENIDA SARGA FINA 14-A HOMBRE','Sin Marca','48L','56718','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('711','1','7','TENIDA SARGA FINA 14-A HOMBRE','TENIDA SARGA FINA 14-A HOMBRE','Sin Marca','50R','56718','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('712','1','7','AMBO SARGA FINA HOMBRE','AMBO SARGA FINA HOMBRE','Sin Marca','52L','74703','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('715','1','7','AMBO SARGA FINA HOMBRE','AMBO SARGA FINA HOMBRE','Sin Marca','54R','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('716','1','7','AMBO SARGA FINA HOMBRE','AMBO SARGA FINA HOMBRE','Sin Marca','54L','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('721','1','7','AMBO SRGA FINA MUJER','','Sin Marca','40L','56089','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('723','1','3','AMBO SARGA FINA MUJER','','Sin Marca','44R','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('724','1','7','AMBO SARGA FINA MUJER','','Sin Marca','44L','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('725','1','7','AMBO SARGA FINA MUJER','','Sin Marca','46L','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('726','1','7','AMBO SARGA FINA MUJER','','Sin Marca','48C','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('727','1','7','AMBO SARGA FINA MUJER','','Sin Marca','48R','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('728','1','7','AMBO SARGA FINA MUJER','','Sin Marca','50R','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('729','1','7','AMBO SARGA FINA MUJER','','Sin Marca','52L','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('730','1','3','GORRA CON FUNDA BLANCA','','Sin Marca','7 1/8','19972','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('731','1','3','GORRA CON FUNDA BLANCA','','Sin Marca','7 3/8','19972','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('732','1','3','GORRA CON FUNDA BLANCA','','Sin Marca','7 5/8','19972','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('733','1','3','GORRA CON FUNDA BLANCA','','Sin Marca','7','19972','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('734','1','3','GORRA CON FUNDA BLANCA','','Sin Marca','7 1/2','19972','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('735','1','3','GORRA CON FUNDA BLANCA','','Sin Marca','7 3/4','19972','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('740','1','3','PANTALON SARGA FINA','','Sin Marca','42R','14715','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('750','1','3','PANTALON SARGA FINA HOMBRE','PANTALON SARGA FINA HOMBRE','Sin Marca','48R','18186','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('751','1','3','PANTALON SARGA FINA','','Sin Marca','48L','14715','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('758','1','3','PANTALON SARGA FINA','','Sin Marca','54R','14715','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('761','1','3','PANTALON SARGA FINA','','Sin Marca','56R','14715','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('767','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','40L','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('768','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','42R','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('769','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','42L','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('770','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','44R','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('771','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','44L','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('772','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','46C','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('773','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','46R','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('774','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','46L','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('775','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','48C','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('778','1','3','PANTALON SARGA FINA MUJER','','Sin Marca','50C','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('780','1','7','CALZONCILLO LARGO','CALZONCILLO LARGO','Sin Marca','M','6467','41','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('783','1','7','CAMISA PECHERA VARON','CAMISA PECHERA VARON ','Sin Marca','37','11822','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('785','1','7','CAMISA PECHERA HOMBRE','CAMISA PECHERA VARON','Sin Marca','39','10528','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('786','1','7','CAMISA PECHERA HOMBRE','CAMISA PECHERA VARON','Sin Marca','40','10528','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('787','1','7','CAMISA PECHERA HOMBRE','CAMISA PECHERA HOMBRE','Sin Marca','41','10528','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('788','1','7','CAMISA PECHERA HOMBRE','','Sin Marca','42','10528','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('789','1','7','CAMISA PECHERA HOMBRE','','Sin Marca','43','10528','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('804','1','7','CAMISA PECHERA MUJER','CAMISA PECHERA MUJER','BENSONS','37','9882','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('809','1','7','BEATLE','','Sin Marca','M','5233','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('810','1','7','BEATLE','','Sin Marca','S','5233','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('811','1','7','BEATLE','','Sin Marca','L','5233','22','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('812','1','7','BEATLE','BEATLE','Sin Marca','XL','5233','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('813','1','7','BEATLE','','Sin Marca','XS','5233','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('815','1','7','SALIDA DE CANCHA','SALIDA DE CANCHA','ESCUELA NAVAL','M','39872','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('816','1','7','BUZO DEPORTIVO E.N.','','Sin Marca','L','39573','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('817','1','7','BUZO DEPORTIVO E.N.','','Sin Marca','XL','39573','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('818','1','7','BUZO DEPORTIVO E.N.','','Sin Marca','S','39573','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('819','1','7','BUZO DEPORTIVO E.N.','','Sin Marca','XXL','39573','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('825','1','7','CAMISA DAMA M/C','CAMISA DAMA M/C','BENSONS','33','9533','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('826','1','7','CAMISA DAMA M/C','CAMISA DAMA M/C','BENSONS','34','9533','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('827','1','7','CAMISA DAMA M/C','CAMISA DAMA M/C','BENSONS','35','9533','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('828','1','7','CAMISA DAMA M/C','CAMISA DAMA M/C','BENSONS','36','9533','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('829','1','7','CAMISA DAMA M/C','CAMISA DAMA M/C','BENSONS','37','9533','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('830','1','7','CAMISA DAMA M/C','CAMISA DAMA M/C','BENSONS','38','9533','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('831','1','7','CAMISA DAMA M/C','CAMISA DAMA M/C','BENSONS','41','9533','31','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('833','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','36','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('834','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','33','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('835','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','37','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('836','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','38','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('838','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','39','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('839','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','40','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('842','1','7','CHAPA DE PARADA CON ANCLAS','','Sin Marca','Sin Talla','3332','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('843','0','7','BARBOQUEJO NEGRO','','NEGRO','Sin Talla','4227','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('845','1','3','CINTILLO NEGRO PARA GORRA','','Sin Marca','Sin Talla','1940','265','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('853','1','5','ZAPATILLA CON CLAVO','ZAPATILLA CON CLAVO','JOMA','40','38199','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('864','1','7','PANTALON SARGA FINA','PANTALON BENSONS','Sin Marca','Sin Talla','14715','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('866','1','7','CAMISA DOBLE PU','CAMISA BENSONS','BENSONS','Sin Talla','10300','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('867','1','7','CAMISA PU','CAMISAS BENSONS','BENSONS','Sin Talla','11054','47','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('868','1','7','CAMISA PU','CAMISA BENSONS','BENSONS','Sin Talla','10187','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('869','1','7','CAMISA PU','CAMISA BENSONS','BENSONS','Sin Talla','10522','32','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('870','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA BENSONS','BENSONS','Sin Talla','9764','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('871','1','7','CAMISA DAMA M/C','CAMISA BENSONS','BENSONS','Sin Talla','9533','45','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('872','1','7','CAMISA DOBLE PU','CAMISA BENSONS','BENSONS','Sin Talla','11504','14','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('875','1','7','CAMISA PECHERA HOMBRE','CAMISAS BENSONS','ARAUCO','Sin Talla','10528','143','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('876','1','7','CUELLOS CAMISA PECHERA','CUELLOS BENSONS','BENSONS','Sin Talla','2532','334','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('879','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','43','45949','43','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('880','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','37','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('882','1','7','CAMISA DOBLE PU','CAMISA DOBLE PU','Sin Marca','Sin Talla','11504','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('883','1','7','CUELLOS CAMISA PECHERA','CUELLOS PARA CAMISA PRISMA','Sin Marca','Sin Talla','2532','149','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('887','1','7','AMBO COMBATE MUJER','AMBO COMBATE MUJER ','Sin Marca','46','33287','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('888','1','7','AMBO COMBATE MUJER','AMBO COMBATE MUJER ','Sin Marca','48','33287','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('889','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE VARON ','Sin Marca','48','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('891','1','7','PANTALON DESFILE HOMBRE','PANTALON DESFILE VARON (LEON AGUAYO)','Sin Marca','48','24339','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('896','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','Sin Marca','50','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('897','1','7','AMBO COMBATE HOMBRE','AMBO COMBATE HOMBRE','Sin Marca','54','34328','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('906','1','5','BOTA DE MARCHA','BOTA DE MARCHA','ARMADA C. AB.','40','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('913','1','5','BOTA DE MARCHA','BOTA DE MARCHA BATA','BATA','46','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('915','1','5','BOTA DE MARCHA','BOTA DE MARCHA CADET ASSAULT BOOT','CADET ASSAULT','43','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('917','1','5','BOTA DE MARCHA','BOTA DE MARCHA CADET ASSAULT BOOT','ARMADA C. AB.','39','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('918','1','5','BOTA DE MARCHA','BOTA DE MARCHA','ARMADA C. AB.','34','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('919','1','5','BOTA DE MARCHA','BOTA DE MARCHA','ARMADA C. AB.','48','40076','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('920','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','35','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('921','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA CALZARTE','CALZARTE','36','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('922','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','37','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('923','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','Sin Marca','38','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('926','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','40','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('927','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','AMERICAN SHOES','40','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('928','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','Sin Marca','41','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('929','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','42','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('930','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','43','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('931','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','44','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('932','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','48','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('933','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','45','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('935','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','46','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('943','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','46','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('949','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','38','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('950','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','AMERICAN SHOES','38','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('951','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','AMERICAN SHOES','39','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('952','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','40','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('953','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','CALZARTE','40','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('954','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','GUANTE','45','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('955','1','5','BOTIN PLANTA DE SUELA','BOTIN PLANTA DE SUELA','AMERICAN SHOES','47','45949','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('956','1','5','ZAPATILLA DE TROTE','ZAPATILLA DE TROTE','NIKE','38','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('957','1','5','ZAPATILLA DE TROTE','ZAPATILLA DE TROTE','NIKE','40','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('958','1','5','ZAPATILLA DE TROTE','ZAPATILLA DE TROTE','NIKE','41','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('959','1','5','ZAPATILLA DE TROTE','ZAPATILLA DE TROTE','NIKE','42','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('961','1','5','ZAPATILLA DE TROTE','ZAPATILLA DE TROTE','LOTTO','42','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('963','1','5','ZAPATILLA DE TROTE','ZAPATILLA DE TROTE','NIKE','39','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('971','1','5','ZAPATILLA DE TROTE','ZAPATILLA DE TROTE','PENALTY','40','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('972','1','5','BOTA COMBATE BELLEVILLE IM','BOTA COMBATE BELLEVILLE IM','BELLEVILLE','42','69216','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('977','1','3','BOTON DORADO 23 MM P/CORTA','BOTON DORADO PATA CORTA 23 MM','WATERBURY','S','941','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('981','1','3','FAJA PARA GALA','FAJA PARA GALA','Sin Marca','Sin Talla','9818','7','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('984','1','7','AMBO SARGA FINA MUJER','AMBO SARGA FINA CAOR','Sin Marca','M','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('985','1','7','BETUN NEGRO CAOR','BETUN NEGRO CAOR','Sin Marca','Sin Talla','537','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('986','1','7','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','Sin Marca','Sin Talla','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('987','1','7','BOTONES 23 MM PATA CORTA CAOR','BOTONES 23 MM PATA CORTA CAOR','Sin Marca','Sin Talla','802','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('988','1','7','LIMPIA METAL CAOR','LIMPIA METAL CAOR','Sin Marca','Sin Talla','2564','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('990','1','7','BUZO DEPORTIVO E.N.','BUZO DEPORTIVO E.N.','Sin Marca','Sin Talla','39573','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('992','1','7','CALCETIN DE HILO NEGRO','CALCETIN NEGRO HILO CAOR YATE','Sin Marca','M','1620','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('993','1','7','CALCETIN INVIERNO CAOR YATE','CALCETIN INVIERNO CAOR YATE','Sin Marca','Sin Talla','1605','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('994','1','7','CAMISA MEDIA MANGA CAOR YATE','CAMISA MEDIA MANGA CAOR YATE','Sin Marca','Sin Talla','8966','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('995','1','7','CAMISA PU','CAMISA PU','Sin Marca','Sin Talla','9455','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('996','1','7','CAMISA PU','CAMISA PU','Sin Marca','Sin Talla','10187','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('997','1','7','CAMISETA DEPORTIVA DRY FIT CAOR YATE','CAMISETA DEPORTIVA DRY FIT CAOR YATE','Sin Marca','Sin Talla','8482','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('998','1','7','CAMISETA INT. LANILLA MEDIA MANGA CAOR YATE','CAMISETA INT. LANILLA MEDIA MANGA CAOR YATE','Sin Marca','Sin Talla','3068','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('999','1','7','CANDADO CHICO CAOR YATE','CANDADO CHICO CAOR YATE','Sin Marca','Sin Talla','2831','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1000','0','7','CINTILLO PARA GORRA','CINTILLO NEGRO PARA GORRA CAOR YATE','Sin Marca','Sin Talla','1224','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1002','1','7','COLLERAS DE PU','COLLERAS DE PU','Sin Marca','Sin Talla','4348','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1003','1','7','CORBATA NEGRA RAZO CAOR YATE','CORBATA NEGRA RAZO CAOR YATE','Sin Marca','Sin Talla','2539','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1004','1','7','ESCOBILLA DE ZAPATOS C/BETUNERA CAOR YATE','ESCOBILLA DE ZAPATOS C/BETUNERA CAOR YATE','Sin Marca','Sin Talla','2015','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1006','1','7','ESCUDO GORRA HOMBRE CAOR YATE','ESCUDO GORRA HOMBRE CAOR YATE','Sin Marca','Sin Talla','6734','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1007','1','7','ESTRELLA BORDADA P/MANGA CAOR YATE','ESTRELLA BORDADA P/MANGA CAOR YATE','Sin Marca','Sin Talla','2418','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1008','1','7','FUNDA BLANCA PARA GORRA CAOR YATE','FUNDA BLANCA PARA GORRA CAOR YATE','Sin Marca','Sin Talla','4837','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1009','1','7','FUNDA DE ALMOHADA CAOR YATE','FUNDA DE ALMOHADA CAOR YATE','Sin Marca','Sin Talla','960','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1010','1','7','FUNDA NEGRA P/TENIDA CAOR YATE','FUNDA NEGRA P/TENIDA CAOR YATE','Sin Marca','Sin Talla','5398','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1011','1','7','GORRA CON FUNDA BLANCA CAOR YATE','GORRA CON FUNDA BLANCA CAOR YATE','Sin Marca','Sin Talla','14925','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1012','1','7','GORRO DE NAVEGACION CAOR YATE','GORRO DE NAVEGACION CAOR YATE','Sin Marca','Sin Talla','2467','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1013','1','7','GORRO NATACION CAOR YATE','GORRO NATACION CAOR YATE','Sin Marca','Sin Talla','3797','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1014','1','7','HAWAIANAS CAOR YATE','HAWAIANAS CAOR YATE','Sin Marca','Sin Talla','2710','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1015','1','7','JABON DE BA','JABON DE BA','Sin Marca','Sin Talla','396','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1016','1','7','WOLLY POLY CAOR YATE','WOLLY POLY CAOR YATE','Sin Marca','Sin Talla','26011','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1017','1','7','PALAS FLEXIBLES E.N. CAOR YATE','PALAS FLEXIBLES E.N. CAOR YATE','Sin Marca','Sin Talla','5172','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1018','1','7','PANTALON DEPORTIVO VARON AZUL CAOR YATE','PANTALON DEPORTIVO VARON AZUL CAOR YATE','Sin Marca','Sin Talla','5974','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1019','1','7','PANTALON SARGA FINA P/TALLA CAOR YATE','PANTALON SARGA FINA P/TALLA CAOR YATE','Sin Marca','Sin Talla','25298','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1020','1','7','PASTA DENTAL CAOR YATE','PASTA DENTAL CAOR YATE','Sin Marca','Sin Talla','935','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1021','1','7','PEALES NEGROS CAOR YATE','PEALES NEGROS CAOR YATE','Sin Marca','Sin Talla','952','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1022','1','7','SABANAS BLANCAS E.N.  CAOR YATE','SABANAS BLANCAS E.N.  CAOR YATE','Sin Marca','Sin Talla','3242','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1023','1','7','BOLSO DESEMBARCO MODELO E.N.  CAOR YATE','BOLSO DESEMBARCO MODELO E.N.  CAOR YATE','Sin Marca','Sin Talla','11925','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1024','1','7','SERVILLETA DE GENERO BLANCA  CAOR YATE','SERVILLETA DE GENERO BLANCA  CAOR YATE','Sin Marca','Sin Talla','346','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1025','1','7','TENIDA SERVICIO VARON  CAOR YATE','TENIDA SERVICIO VARON  CAOR YATE','Sin Marca','Sin Talla','57833','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1026','1','7','TOALLA CHICA BLANCA  CAOR YATE','TOALLA CHICA BLANCA  CAOR YATE','Sin Marca','Sin Talla','3748','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1027','1','7','TOALLA GRANDE BLANCA  CAOR YATE','TOALLA GRANDE BLANCA  CAOR YAT','Sin Marca','Sin Talla','5372','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1028','1','7','TRAJE DE BA','TRAJE DE BA','Sin Marca','Sin Talla','8729','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1029','1','7','ZAPATILLA CAOR YATE','ZAPATILLA CAOR YATE','Sin Marca','Sin Talla','22881','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1030','1','7','HAWAIANAS (PANTINAS ) CAOR YATE','HAWAIANAS (PANTINAS ) CAOR YATE','Sin Marca','Sin Talla','6141','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1031','1','7','PA','PA','Sin Marca','Sin Talla','486','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1032','1','7','CORDON TRICOLOR','CORDON TRICOLOR CAOR YATE','ESNAVAL','Sin Talla','600','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1033','1','7','ESCOBILLA DE DIENTES CAOR YATE','ESCOBILLA DE DIENTES CAOR YATE','Sin Marca','Sin Talla','1802','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1034','1','7','COLLAR PARA HERRETE CAOR YATE','COLLAR PARA HERRETE CAOR YATE','Sin Marca','Sin Talla','1108','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1035','1','7','PIJAMA  CAOR YATE','PIJAMA  CAOR YATE','Sin Marca','Sin Talla','12554','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1036','1','7','PLACAS DE IDENTIFICACION CAOR YATE','PLACAS DE IDENTIFICACION CAOR YATE','Sin Marca','Sin Talla','1873','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1037','1','7','CAMISA MANGA CORTA CAOR YATE','CAMISA MANGA CORTA CAOR YATE','Sin Marca','Sin Talla','9700','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1038','1','7','CANDADO MEDIANO CAOR YATE','CANDADO MEDIANO CAOR YATE','Sin Marca','Sin Talla','4114','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1039','1','7','ANOTADOR NAVAL CAOR YATE','ANOTADOR NAVAL CAOR YATE','Sin Marca','Sin Talla','2200','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1040','1','7','ESCUDO GORRA FEMEN CAOR YATE','ESCUDO GORRA FEMEN CAOR YATE','Sin Marca','Sin Talla','5753','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1041','1','7','TRAJE DE BA','TRAJE DE BA','SPEEDO','Sin Talla','13000','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1043','1','7','SHORT CAFU SPEEDO','SHORT CAFU SPEEDO','SPEEDO','Sin Talla','4990','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1044','1','7','SHORT ADIDAS','SHORT ADIDAS','ADIDAS','Sin Talla','13990','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1045','1','5','BOTIN PLANTA DE GOMA','BOTIN PLANTA DE GOMA','GUANTE','Sin Talla','45478','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1046','1','0','CANDADO MEDIANO','CANDADO MEDIANO','ODIS','MEDIANO','3857','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1052','1','7','BOXER VARON EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','2865','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1096','1','6','BATA BA','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','28977','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1100','1','7','BIKINI ALGODON EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','1792','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1107','1','3','BOLSO DESEMB. EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','11925','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1109','1','5','BOTAS MARCHA EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','39079','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1110','1','7','BOTON DORADO 13 MM','EQUIPO INICIAL 2012','WATERBURY','Sin Talla','755','115','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1111','1','7','BOTON DORADO 16 MM','EQUIPO INICIAL 2012','WATERBURY','Sin Talla','900','299','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1112','1','7','BOTON DORADO 23 MM P/CORTA','EQUIPO INICIAL 2012','WATERBURY','Sin Talla','941','43','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1113','1','7','BOTON DORADO 23 MM P/LARGA','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','952','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1118','1','7','CALCETA BLANCA C/DEP. EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','1427','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1119','1','7','CALCETIN HILO NEGRO EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','1555','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1122','1','7','CALZA LYCRA EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','7437','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1126','1','7','CAMISETA DEP. DAMA EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','6956','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1127','1','7','CAMISETA DEP. VARON EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','8042','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1128','1','8','CANCIONERO NAVAL EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','1197','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1135','1','7','CHAQUETON DE ABRIGO','EQUIPO INICIAL 2012','ARMADA C. AB.','Sin Talla','57971','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1147','1','3','CORDON TRICOLOR EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','578','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1162','1','6','ESCOBILLA DE ROPA EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','1500','18','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1172','1','7','FUNDA DE ALMOHADA','EQUIPO INICIAL 2012','Sin Marca','MEDIANO','940','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1178','1','3','GORRA PERS. FEM EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','37643','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1191','1','6','JABON ASEO','JABON ASEO ','Sin Marca','Sin Talla','212','97','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1194','1','3','LENTES DE NATACION','LENTES DE NATACION','SPEEDO','Sin Talla','6129','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1201','1','3','MALLA CABELLO EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','876','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1221','1','7','PANTALETA MUJER EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','2535','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1226','1','7','PANTY ELASTICADA EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','2838','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1244','1','3','PLACA IDENTIFICACION','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','3000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1247','1','7','POLERON NAVEGACION','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','16537','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1257','1','11','REGLA 30 CM','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','88','42','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1261','1','7','SABANAS BLANCAS EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','3242','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1264','1','6','SERV. GENERO BLANCA EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','346','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1270','1','7','SOSTEN BLANCO EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','6005','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1280','1','7','TRAJE BA','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','8729','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1286','1','5','ZAPATO NEGRO FEMENINO EQ. INICIAL 2012','EQUIPO INICIAL 2012','Sin Marca','Sin Talla','23643','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1287','1','7','PALAS RIGIDAS T1','PALAS RIGIDAS T1','Sin Marca','Sin Talla','7501','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1288','1','7','PALAS FLEXIBLES T1','PALAS FLEXIBLES T1','Sin Marca','Sin Talla','7000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1289','1','7','CHAQUETILLA SARGA FINA 14-A HO','CHAQUETILLA SARGA FINA 14-A HOMBRE','BENSONS','38R','31839','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1293','1','7','CHAQUETILLA 14 A','CHAQUETILLA 14 A','BENSONS','46R','31885','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1294','1','7','CHAQUETILLA SARGA FINA 14-A HO','CHAQUETILLA SARGA FINA 14-A HOMBRE','BENSONS','48R','31839','35','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1295','1','7','CHAQUETILLA SARGA FINA 14-A HO','CHAQUETILLA SARGA FINA 14-A HOMBRE','BENSONS','52R','31839','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1297','1','7','CHAQUETILLA SARGA FINA 14 A HO','CHAQUETILLA 14 A','BENSONS','42C','32650','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1301','1','7','CHAQUETILLA SARGA FINA 14-A HO','CHAQUETILLA SARGA FINA 14-A HOMBRE','BENSONS','52C','31839','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1302','1','7','CHAQUETILLA 14 A','CHAQUETILLA 14 A','BENSONS','54C','31885','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1307','1','7','CHAQUETILLA SARGA FINA 14-A HO','CHAQUETILLA SARGA FINA 14-A HOMBRE','BENSONS','46L','31839','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1308','1','7','CHAQUETILLA SARGA FINA 14-A HO','CHAQUETILLA SARGA FINA 14-A HOMBRE','BENSONS','48L','31839','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1309','1','7','CHAQUETILLA 14 A','CHAQUETILLA 14 A','BENSONS','50L','31885','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1310','1','7','CHAQUETILLA SARGA FINA 14-A HO','CHAQUETILLA SARGA FINA 14-A HOMBRE','BENSONS','52L','31839','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1311','1','7','CHAQUETILLA SARGA FINA 14-A MU','CHAQUETILLA 14 A MUJER','BENSONS','38R','33665','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1312','1','7','CHAQUETILLA SARGA FINA 14-A MU','CHAQUETILLA 14 A MUJER','BENSONS','40R','33665','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1313','1','7','CHAQUETILLA SARGA FINA 14-A MU','CHAQUETILLA 14 A MUJER','BENSONS','42R','33665','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1315','1','7','CHAQUETILLA SARGA FINA 14-A MU','CHAQUETILLA 14 A MUJER','BENSONS','38L','33665','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1317','1','7','PANTALON SARGA FINA HOMBRE','PANTALON SARGA FINA','BENSONS','40R','18186','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1321','1','7','PANTALON SARGA FINA HOMBRE','PANTALON SARGA FINA','BENSONS','48R','18186','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1325','1','7','PANTALON SARGA FINA HOMBRE','PANTALON SARGA FINA HOMBRE','BENSONS','44C','18186','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1327','1','7','PANTALON SARGA FINA HOMBRE','PANTALON SARGA FINA HOMBRE','BENSONS','48C','18186','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1337','1','7','PANTALON SARGA FINA HOMBRE','PANTALON SARGA FINA','BENSONS','52L','18186','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1340','1','7','PANTALON SARGA FINA MUJER','PANTALON SARGA FINA MUJER','BENSONS','42R','16466','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1344','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','37','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1345','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','39','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1346','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','40','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1347','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','41','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1348','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','42','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1349','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','43','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1350','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','44','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1351','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','45','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1352','1','7','CAMISA MANGA CORTA HOMBRE','CAMISA MANGA CORTA HOMBRE','BENSONS','38','9764','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1381','1','7','PIJAMA POLAR','PIJAMA POLAR ','CARTERS','M','16165','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1421','1','6','SERVILLETA BLANCA EQUIPO 2012','SERVILLETA BLANCA EQUIPO 2012','Sin Marca','Sin Talla','385','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1426','1','3','TOALLA BLANCA GRANDE','TOALLA BLANCA GRANDE EQUIPO 2012','Sin Marca','Sin Talla','5002','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1449','1','6','SEDA DENTAL','SEDA DENTAL','Sin Marca','Sin Talla','1814','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1474','1','3','CARTERA DE CUERO NEGRA','CARTERA DE CUERO NEGRA','SAXOLINE','Sin Talla','33607','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1479','1','5','BOTIN DE MUJER','BOTIN DE MUJER','GUANTE','37','44728','12','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1480','1','5','BOTIN CON TACO','BOTIN DE MUJER','GUANTE','38','44813','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1484','1','5','ZAPATO REINA','ZAPATO REINA ','GUANTE','35','29381','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1486','1','5','ZAPATO REINA','ZAPATO REINA ','GUANTE','38','29381','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1487','1','5','ZAPATO REINA','ZAPATO REINA ','GUANTE','40','29381','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1576','1','3','APELLIDO AMBO COMBATE','APELLIDO AMBO COMBATE','Sin Marca','Sin Talla','1276','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1580','1','3','COLGADOR ROPA DAMA','COLGADOR ROPA DAMA','Sin Marca','Sin Talla','1131','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1581','1','3','COLLERA DE CUELLO','COLLERA DE CUELLO','Sin Marca','Sin Talla','857','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1587','1','8','MANUAL FORMACION NAVAL','MANUAL FORMACION NAVAL','Sin Marca','Sin Talla','18489','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1590','1','3','PORTA GORRA','PORTA GORRA','Sin Marca','Sin Talla','6429','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1600','1','7','CAMISETA ANCLAS CRUZADAS','CAMISETA ANCLAS','Sin Marca','Sin Talla','5251','69','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1605','1','3','HERRETE','HERRETE','Sin Marca','Sin Talla','1135','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1607','1','3','MALETIN','MALETIN','Sin Marca','Sin Talla','34373','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1608','1','11','MANUAL CADETE','MANUAL CADETE','Sin Marca','Sin Talla','6132','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1609','1','3','PORTA UTILES DE ASEO','PORTA UTILES DE ASEO','SAXOLINE','Sin Talla','5453','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1614','1','3','FUNDA DE GORRA','FUNDA GORRA','ARMADA C. AB.','Sin Talla','5721','24','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1619','1','0','CAMISETA IM MANGA CORTA','CAMISETA IM MANGA CORTA','Sin Marca','Sin Talla','3275','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1620','1','0','CINTURON VERDE','CINTURON VERDE','Sin Marca','Sin Talla','2021','8','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1621','1','0','FUNDA DE CUERO PARA ESPADAS','FUNDA DE CUERO PARA ESPADAS','Sin Marca','Sin Talla','15360','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1622','1','0','BLOCK CUC','BLOCK CUC','Sin Marca','Sin Talla','683','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1627','1','3','INSIGNIA SOLAPA MUJER','INSIGNIA SOLAPA FEMENINO','ARMADA C. AB.','Sin Talla','9317','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1632','1','7','AMBO SARGA FINA HOMBRE','AMBO SARGA FINA HOMBRE','BENSONS','56L','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1634','1','7','AMBO SARGA FINA MUJER','AMBO SARGA FINA MUJER','BENSONS','44C','67034','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1636','1','7','AMBO SARGA FINA MUJER','AMBO SARGA FINA MUJER','BENSONS','46R','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1637','1','7','AMBO SARGA FINA MUJER','AMBO SARGA FINA MUJER','BENSONS','38L','67034','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1642','1','5','BOTA DE MARCHA','BOTA DE MARCHA','BATA','36','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1643','1','5','BOTA DE MARCHA','BOTA DE MARCHA','BATA','45','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1644','1','5','BOTA DE MARCHA','BOTA DE MARCHA','BATA','47','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1651','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','41','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1652','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','42','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1653','1','7','CAMISA MANGA LARGA HOMBRE','CAMISA MANGA LARGA HOMBRE','BENSONS','43','8606','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1655','1','7','CAMISA PU','CAMISA PU','BENSONS','35','11054','12','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1656','1','7','CAMISA PU','CAMISA PU','BENSONS','36','11054','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1657','1','7','CAMISA PU','CAMISA PU','BENSONS','37','11054','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1658','1','7','CAMISA PU','CAMISA PU','BENSONS','38','11054','20','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1659','1','7','CAMISA PU','CAMISA PU','BENSONS','39','11054','39','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1660','1','7','CAMISA PU','CAMISA PU','BENSONS','40','11054','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1662','1','7','CAMISA PU','CAMISA PU','BENSONS','43','11054','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1663','1','7','CAMISA PU','CAMISA PU','BENSONS','44','11054','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1666','1','3','SACO DE DORMIR','SACO DE DORMIR','Sin Marca','Sin Talla','4793','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1673','1','9','ESTUCHE PARA LAPICES','ESTUCHE PARA LAPICES','Sin Marca','Sin Talla','3577','16','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1674','1','13','AFTER SHAVE','AFTER SHAVE','Sin Marca','Sin Talla','5581','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1675','1','11','CUADERNO CALIGRAFIA','CUADERNO CALIGRAFIA','Sin Marca','Sin Talla','853','120','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1676','1','6','ENJUAGUE BUCAL','ENJUAGUE BUCAL','Sin Marca','Sin Talla','845','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1677','1','7','BOXER HOMBRE','BOXER','CARTERS','M','3090','24','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1678','1','4','CAMISA PECHERA MUJER','CAMISA PECHERA MUJER','BENSONS','39','9882','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1684','1','7','CAMISA PU','CAMISA PU','BENSONS','38','10522','14','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1685','1','7','CAMISA PU','CAMISA PU','BENSONS','40','10522','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1700','1','7','PANTALETA MUJER','PANTALETA MUJER','CARTERS','L','2820','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1701','1','7','CAMISA DOBLE PU','CAMISA PU','BENSONS','42','10300','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1704','1','7','CAMISA PU','CAMISA PU','BENSONS','42','10522','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1707','1','0','LIBRO DE INGLES BESCO WEB B3','LIBRO BESCO WEB BE3','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1708','1','0','LIBRO DE INGLES BESCO WEB BE4','LIBRO BESCO WEB 4','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1709','1','0','LIBRO DE INGLES BESCO WEB BE5','LIBRO BESCO WEB BE 5','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1710','1','0','LIBRO DE INGLES BESCO WEB BE6','LIBRO BESCO WEB BE6','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1711','1','0','LIBRO DE INGLES BESCO WEB BE7','LIBRO BESCO WEB BE7','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1712','1','8','\"MANUAL PARA CADETES \"\"ORIENTACION PROFESIONAL\"\"\"','\"MANUAL PARA CADETES \"\"ORIENTACION PROFESIONAL\"\"\"','Sin Marca','Sin Talla','18294','124','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1713','1','8','CARTILLA NAUTICA','CARTILLA NAUTICA','IMPRENTA','Sin Talla','12600','85','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1714','1','8','LIBRO INGLES BESCO REFILL BE2','LIBRO INGLES BESCO REFILL BE 2','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1715','1','8','LIBRO DE INGLES BESCO REFILL B','LIBRO DE INGLES BESCO REFILL BE 3 DE 2DO. A','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1716','1','0','LIBRO DE INGLES BESCO REFILL BE 4','LIBRO DE INGLES BESCO REFILL BE 4','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1717','1','0','LIBRO DE INGLES BESCO REFILL BE 6','LIBRO DE INGLES BESCO REFILL BE 6','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1718','1','8','LIBRO DE INGLES BESCO REFILL BE5','LIBRO DE INGLES BESCO REFILL BE5','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1719','1','8','LIBRO DE INGLES BESCO REFILL BE6','LIBRO DE INGLES BESCO REFILL BE6','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1720','1','8','LIBRO DE INGLES BESCO REFILL BE8','LIBRO DE INGLES BESCO REFILL BE8','Sin Marca','Sin Talla','40000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1721','1','8','LIBRO INGLES BESCO REFILL BE 4','LIBRO INGLES BESCO REFILL BE 4','Sin Marca','Sin Talla','40000','28','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1722','1','4','FUNDA DE GORRA','FUNDA DE GORRA  ','Sin Marca','M','5721','67','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1724','1','7','GUANTES DE CUERO CAFE NRO. 9','GUANTES DE CUERO CAFE NRO. 9','Sin Marca','Sin Talla','9032','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1725','1','7','GUANTE DE CUERO CAFE NRO. 8  1/2','GUANTE DE CUERO CAFE NRO. 8  1/2','Sin Marca','Sin Talla','9032','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1726','1','7','PANTALON BLANCO CON MARRUECO','PANTALON BLANCO CON MARRUECO','Sin Marca','Sin Talla','16500','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1727','1','7','FUNDA GORRA FEMENINA N','FUNDA GORRA FEMENINA N','Sin Marca','Sin Talla','13135','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1728','1','7','FUNDA GORRA FEMENINA N','FUNDA GORRA FEMENINA N','Sin Marca','Sin Talla','13135','20','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1729','1','7','FUNDA GORRA FEMENINA N','FUNDA GORRA FEMENINA N','Sin Marca','Sin Talla','13153','18','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1730','1','7','FUNDA GORRA FEMENINA N','FUNDA GORRA FEMENINA N','Sin Marca','Sin Talla','12852','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1731','1','7','GORRA FEMENINA N','GORRA FEMENINA N','Sin Marca','Sin Talla','59168','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1732','1','7','GUANTES DE CUERO BLANCO N','GUANTES DE CUERO BLANCO N','Sin Marca','N','9984','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1733','1','7','GUANTES DE CUERO BLANCO N','GUANTES DE CUERO BLANCO N','Sin Marca','N','9984','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1734','1','7','GUANTES DE CUERO BLANCO N','GUANTES DE CUERO BLANCO N','Sin Marca','N','9984','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1735','1','7','CALCETIN DE HILO NEGRO','CALCETIN DE HOMBRE','OFICIAL','Sin Talla','1620','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1736','1','5','ZAPATO AMERICANO BATE N','ZAPATO AMERICANO BATE N','Sin Marca','Sin Talla','52000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1737','1','7','CAMISA DOBLE PU','CAMISA DOBLE PU','Sin Marca','42L','11504','39','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1740','1','7','GALON HILO DE HORO 16MM.','GALON HILO DE HORO 16MM.','Sin Marca','Sin Talla','4024','26','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1741','1','7','VISERA PARA CAPITAN DE FRAGATA','VISERA PARA CAPITAN DE FRAGATA','Sin Marca','Sin Talla','11900','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1742','1','7','PALA FLEXIBLE PARA SUBTENIENTE','PALA FLEXIBLE PARA SUBTENIENTE','Sin Marca','Sin Talla','3570','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1743','1','7','PALA RIGIDA CAPITAN DE FRAGATA','PALA RIGIDA CAPITAN DE FRAGATA','Sin Marca','Sin Talla','4986','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1744','1','7','PALA RIGIDA TENIENTE SEGUNDO','PALA RIGIDA TENIENTE SEGUNDO','Sin Marca','Sin Talla','4986','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1745','1','7','AMBO BLANCO','AMBO BLANCO','Sin Marca','Sin Talla','73200','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1746','1','7','CINTURON BLANCO','CINTURON BLANCO','Sin Marca','Sin Talla','2134','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1747','1','7','CAMISA BLANCA MANGA CORTA','CAMISA BLANCA MANGA CORTA','Sin Marca','Sin Talla','7140','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1750','1','7','AMBO SARGA FINA 14- A  VARON','AMBO SARGA FINA 14- A  VARON','Sin Marca','Sin Talla','64816','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1751','1','7','SMOKING NEGRO VARON','SMOKING NEGRO VARON','Sin Marca','46R','87854','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1752','1','7','CAMISA SMOKING VARON','CAMISA SMOKING VARON','Sin Marca','40R','18445','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1753','1','3','CARTERA SMOKING FMENINA','CARTERA SMOKING FMENINA','Sin Marca','Sin Talla','49058','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1754','1','7','SOLAPIN GAMAS','SOLAPIN GAMAS','Sin Marca','Sin Talla','11900','32','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1755','1','7','CALCETIN HILO BLANCO','CALCETIN HILO BLANCO','Sin Marca','Sin Talla','1604','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1756','1','7','INSIGNIA BORDADA ESCUDO E.N.','INSIGNIA BORDADA ESCUDO E.N.','Sin Marca','Sin Talla','1500','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1757','1','0','BANDERIN CHICO ESNAVAL','BANDERIN CHICO ESNAVAL','Sin Marca','Sin Talla','500','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1760','1','5','ZAPATO REINA COLOR BLANCO','ZAPATO REINA COLOR BLANCO','Sin Marca','Sin Talla','27421','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1761','1','7','WOLLY POLLY IM','WOLLY POLLY IM','Sin Marca','Sin Talla','9341','22','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1762','1','7','TENIDAS DE COMBATE IM','TENIDAS DE COMBATE IM','Sin Marca','Sin Talla','49139','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1763','1','7','PARCHE ESNAVAL PARA BUZO COMBATE','PARCHE ESNAVAL PARA BUZO COMBATE','Sin Marca','Sin Talla','2000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1764','1','7','CREMA LABIAL','CREMA LABIAL','Sin Marca','Sin Talla','1726','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1766','1','7','BANDERA CHILENA HILO SEDA','BANDERA CHILENA HILO SEDA','Sin Marca','Sin Talla','1785','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1768','1','0','PALA FLEXIBLE CAPITAN DE FRAGATA','PALA FLEXIBLE CAPITAN DE FRAGATA','Sin Marca','Sin Talla','5273','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1769','1','0','PALA RIGIDA TENIDA 11-A','PALA RIGIDA TENIDA 11-A','Sin Marca','Sin Talla','5260','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1770','1','0','FUNDA GORRA KINGFORT','FUNDA GORRA KINGFORT','Sin Marca','Sin Talla','10169','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1771','1','0','GORRA PARA OFICIAL MASCULINO KINGFORT','GORRA PARA OFICIAL MASCULINO KINGFORT','Sin Marca','Sin Talla','30571','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1772','1','0','PALA FLEXIBLE G.M.','PALA FLEXIBLE G.M.','Sin Marca','Sin Talla','5273','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1773','1','0','PALA RIGIDA G.M.','PALA RIGIDA G.M.','Sin Marca','Sin Talla','6528','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1774','1','0','GUANTES DE CUERO BLANCO','GUANTES DE CUERO BLANCO','Sin Marca','Sin Talla','9981','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1775','1','0','ZAPATO NEGRO PLANTA PU','ZAPATO NEGRO PLANTA PU','Sin Marca','Sin Talla','22849','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1776','1','0','CARTERA BLANCA','CARTERA BLANCA','Sin Marca','Sin Talla','42343','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1777','1','0','AMBO BLANCO FEMENINO','AMBO BLANCO FEMENINO','Sin Marca','Sin Talla','57188','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1778','1','0','ZAPATO BLANCO FEMENINO','ZAPATO BLANCO FEMENINO','Sin Marca','Sin Talla','33772','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1779','1','0','FUNDA PARA SABLE','FUNDA PARA SABLE','Sin Marca','Sin Talla','16366','76','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1780','1','0','CARTERA NEGRA FEMENINA','CARTERA NEGRA FEMENINA','Sin Marca','Sin Talla','41088','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1781','1','0','FRASCO CORRECTOR LIQUIDO','FRASCO CORRECTOR LIQUIDO','Sin Marca','Sin Talla','316','12','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1782','1','12','ESTUCHE SENCILLO','ESTUCHE SENCILLO','Sin Marca','Sin Talla','1038','12','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1818','1','4','GORRA FEMENINA 23','GORRA FEMENINA 23','ARMADA C. AB.','Sin Talla','61657','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1851','1','7','PEALES','PEALES','ARMADA C. AB.','Sin Talla','1219','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1856','1','3','SABLE OFICIAL TALLA 96','SABLE OFICIAL TALLA 96','ARMADA C. AB.','Sin Talla','255174','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1857','1','3','SABLE OFICIAL 96','SABLE OFICIAL 96','ARMADA C. AB.','Sin Talla','258491','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1858','1','3','SABLE OFICIAL 98','SABLE OFICIAL 98','ARMADA C. AB.','Sin Talla','258491','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1861','1','7','PIJAMA BLANCO ','PIJAMA BLANCO','Sin Marca','M','8638','43','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1862','1','7','PIJAMA BLANCO ','PIJAMA BLANCO','Sin Marca','L','8638','12','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1864','1','7','GUANTES DE CUERO CAFE','GUANTES DE CUERO CAFE','ARMADA C. AB.','N','9529','27','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1865','1','3','DRAGONAS OF','DRAGONAS OF','ARMADA C. AB.','Sin Talla','14438','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1868','1','5','ZAPATO NEGRO PLANTA PU','ZAPATO NEGRO PLANTA PU','ARMADA C. AB.','44','22849','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1906','1','5','ZAPATO NEGRO PLANTA PU','ZAPATO NEGRO PLANTA PU','ARMADA C. AB.','40','22849','8','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1907','1','5','ZAPATO NEGRO PLANTA PU','ZAPATO NEGRO PLANTA PU','ARMADA C. AB.','41','22849','12','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1908','1','5','ZAPATO NEGRO PLANTA PU','ZAPATO NEGRO PLANTA PU','ARMADA C. AB.','43','22849','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1923','1','4','CAMISA BLANCA M/LARGA FEM','CAMISA BLANCA M/LARGA FEM','ARMADA C. AB.','36R','11876','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1953','1','4','SMOKING FEMENINO','SMOKING FEMENINO','MAVESA','40','84788','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1954','1','4','CAMISA SMOKING MUJER','CAMISA SMOKING MUJER','Sin Marca','36R','19990','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1955','1','4','CAMISA SMOKING MUJER','CAMISA SMOKING MUJER','Sin Marca','38R','19990','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1973','1','3','SABLE OFICIAL GAMA','SABLE OFICIAL GAMA','Sin Marca','Sin Talla','255174','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1975','1','3','DRAGONAS GAMA','DRAGONAS GAMA','Sin Marca','Sin Talla','33934','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1976','1','3','HERRETE GAMA','HERRETE GAMA','Sin Marca','Sin Talla','2115','16','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1994','1','7','PANTALON SARGA FINA GAMA','PANTALON SARGA FINA GAMA','Sin Marca','Sin Talla','13793','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2005','1','7','BUZO AZUL','BUZO AZUL','Sin Marca','L','40460','22','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2019','1','7','CAMISA PU','CAMISA PU','BENSONS','42L','11884','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2044','1','3','PALAS FLEXIBLE TTE 1','PALAS FLEXIBLE TTE 1','Sin Marca','Sin Talla','7140','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2045','1','3','PALAS RIGIDA TTE 1','PALAS RIGIDA TTE 1','Sin Marca','Sin Talla','7735','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2046','1','3','PALAS RIGIDA CC  SANIDAD','PALAS RIGIDA CC  SANIDAD','Sin Marca','Sin Talla','7140','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2047','1','3','PALAS FLEXIBLE CC  SANIDAD','PALAS FLEXIBLE CC  SANIDAD','Sin Marca','Sin Talla','7140','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2057','1','3','SOUTACHE COMPLETO','SOUTACHE COMPLETO','Sin Marca','Sin Talla','4809','69','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2058','1','3','PLACA IDENTIF. BLANCA CAOR','PLACA IDENTIF. BLANCA CAOR','Sin Marca','Sin Talla','5000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2059','1','3','PLACA IDENTIF. NEGRA CAOR','PLACA IDENTIF. NEGRA CAOR','Sin Marca','Sin Talla','5000','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2062','1','8','LIBRO NAVEGACION A VELA','LIBRO NAVEGACION A VELA','Sin Marca','Sin Talla','15400','220','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('6969','1','0','prueba','descripcion','marca','asd','15210','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('4','1','7','','','','','59554','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('142','1','3','','','','','600','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('152','1','3','','','','','2806','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('166','1','3','','','','','3676','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('186','1','3','','','','','1814','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('215','1','7','','','','','2013','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('315','1','0','','','','','312','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('468','1','0','','','','','144','50','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('606','1','6','','','','','1084','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('644','1','7','','','','','33287','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('662','1','7','','','','','44813','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('665','1','5','','','','','44813','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('717','1','7','','','','','74703','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('814','1','7','','','','','5233','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('885','1','7','','','','','33287','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('886','1','7','','','','','33287','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('902','1','7','','','','','22091','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('908','1','5','','','','','40076','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('939','1','5','','','','','38199','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('941','1','5','','','','','23413','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('970','1','5','','','','','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('976','1','7','','','','','34837','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('982','1','0','','','','','4990','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1001','0','7','','','','','1974','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1133','1','7','','','','','74734','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1292','1','7','','','','','31839','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1478','1','5','','','','','44728','7','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1481','1','5','','','','','44728','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1482','1','5','','','','','44728','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1541','1','3','','','','','2641','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1671','1','13','','','','','3390','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1672','1','13','','','','','1790','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1681','1','7','','','','','15352','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1706','1','5','','','','','24192','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1739','1','7','','','','','51348','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1758','1','0','','','','','2000','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1759','1','0','','','','','2000','11','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1767','1','7','','','','','8731','7','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1784','1','7','','','','','26178','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1785','1','7','','','','','26178','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1840','1','4','','','','','19459','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1847','1','4','','','','','48318','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1848','1','7','','','','','15825','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1852','1','7','','','','','17408','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1853','1','7','','','','','17408','8','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1854','1','7','','','','','17408','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1855','1','7','','','','','17408','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1957','1','4','','','','','2677','16','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1960','1','4','','','','','1298','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1961','1','4','','','','','6752','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1962','1','4','','','','','9052','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1963','1','4','','','','','9052','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1964','1','4','','','','','19459','28','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1965','1','4','','','','','2598','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1966','1','4','','','','','1612','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1974','1','3','','','','','9529','38','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1977','1','5','','','','','22849','19','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1981','1','4','','','','','92686','16','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1982','1','3','','','','','5273','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1983','1','4','','','','','92686','5','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1984','1','3','','','','','9403','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1985','1','3','','','','','9317','15','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1986','1','3','','','','','104798','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1990','1','7','','','','','31985','0','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1992','1','7','','','','','7922','9','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1993','1','7','','','','','3063','13','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('1996','1','7','','','','','12429','2','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2002','1','3','','','','','10710','50','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2003','1','5','','','','','6940','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2016','1','7','','','','','11884','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2017','1','7','','','','','11884','6','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2036','1','7','','','','','11009','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2037','1','7','','','','','11009','4','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2056','1','7','','','','','11009','3','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('2097','1','7','','','','','11009','10','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('5656','1','0','1','asd','a','a','12','1','')~
INSERT INTO `producto` (`idproducto`,`estado_idestado`,`subcategoria_idsubcategoria`,`nombre`,`descripcion`,`marca`,`talla`,`precio`,`cantidad`,`img`) VALUES
('9999','1','4','nombre','descripcion','marca','M','123456','11','pedidosOnline52-prueba.jpg')~



-- -------------------------------------------~
-- TABLE DATA subcategoria~
-- -------------------------------------------~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('0','4','Sin Familia')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('2','4','Libreria')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('3','3','Accesorio')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('4','1','Tenida')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('5','2','Calzado')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('6','4','Aseo')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('7','1','Ropa')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('8','4','Libros')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('9','4','Lapices')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('10','4','Cartilla')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('11','4','Escritorio')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('12','4','Menaje')~
INSERT INTO `subcategoria` (`idsubcategoria`,`categoria_idcategoria`,`nombre`) VALUES
('13','4','Cosméticos')~



-- -------------------------------------------~
-- TABLE DATA tipo_usuario~
-- -------------------------------------------~
INSERT INTO `tipo_usuario` (`idtipo_usuario`,`nombre`) VALUES
('1','administrador')~
INSERT INTO `tipo_usuario` (`idtipo_usuario`,`nombre`) VALUES
('2','vendedor')~
INSERT INTO `tipo_usuario` (`idtipo_usuario`,`nombre`) VALUES
('3','cadete')~
INSERT INTO `tipo_usuario` (`idtipo_usuario`,`nombre`) VALUES
('4','cliente')~



-- -------------------------------------------~
-- TABLE DATA usuario~
-- -------------------------------------------~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('1','1','1','17558919-8','c893bad68927b457dbed39460e6afd62','Sebastián','Franco Brantes','H','2014-07-21 10:12:36','seb.frab@gmail.com')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('8','3','1','prueba','c893bad68927b457dbed39460e6afd62','prueba','prueba','H','2014-07-14 15:46:24','prueba@prueba.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('3','3','1','17960714-k','c893bad68927b457dbed39460e6afd62','Bayron','Diaz','H','2014-07-11 18:06:27','')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('9','3','1','cadete','239065c4aa235b54edfbe23be799786d','cadete','cadete','M','2014-07-14 17:51:01','cadete@cadete.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('10','2','1','vendedor','239065c4aa235b54edfbe23be799786d','vendedor','vendedor','H','2014-07-17 16:22:09','')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('331','3','1','11621558-6','239065c4aa235b54edfbe23be799786d','Herman','Pizarro','H','2014-07-17 16:19:25','')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('309','4','1','17910115-7','10115','Joaquín Andres','COCA Kohler','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('310','4','1','18782418-4','82418','Nicolás Antonio','NAVARRO Tardón','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('311','4','1','18634831-1','34831','Marcelo Alejandro','MANNETT Olivares','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('330','4','1','17703437-1','3437','Josefina De Los Angeles','PIÑEIRO Azócar','M','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('328','4','1','18586391-3','86391','Lukas Cristóbal','ERRICKSON Jiménez','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('329','4','1','18664966-4','64966','Francisco Javier','MUNITA Morales','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('327','4','1','18582752-6','82752','Carlos Matías','BELMAR Silva','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('326','4','1','18348900-3','48900','Martín Nicolas','PEREIRA Araya','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('324','4','1','18201512-1','1512','Raul Eduardo','VILLEGAS Oelckers','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('325','4','0','19091207-8','91207','Francisca','CASTILLO Aravena','M','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('323','4','1','19324263-4','24263','Juan José','ROSALES Morales','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('322','4','1','18201262-9','1262','Maria Jose','ARAYA Aguilera','M','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('320','4','1','18170489-6','70489','Martin','BINIMELIS Wilson','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('319','4','1','18643050-6','43050','Pablo Ignacio','MENDOZA Jara','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('318','4','1','18475847-4','75847','Joaquín Vicente','MARDONES Bustamante','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('317','4','1','18476711-2','76711','Vicente Antonio','ESCOBAR Blanc','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('316','4','1','19180368-K','80368','Vitas Valentín Didake','DANILLA Lacrampette','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('315','4','1','18577069-9','77069','Jose Domingo','GONZALEZ Bellalta','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('314','4','1','18373347-8','73347','Vicente Andres','MALDONADO Leiva','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('313','4','1','17214005-K','14005','Mauricio Andres','MUÑOZ Manríquez','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('308','4','1','18635632-2','35632','Benjamín','OSSA Varas','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('307','4','1','22883541-2','83541','Karla Belen','CAVIEDES Arzola','M','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('306','4','1','18783066-4','83066','Renzo Francisco','NORERO Allimant','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('304','4','1','19699442-4','99442','Pablo Andres','GANGA Marcade','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~
INSERT INTO `usuario` (`idusuario`,`tipo_usuario_idtipo_usuario`,`estado_idestado`,`username`,`password_2`,`nombres`,`apellidos`,`sexo`,`last_login`,`email`) VALUES
('305','4','1','18274072-1','74072','Jorge Eduardo','MATUS Madrid','H','0000-00-00 00:00:00','prueba@escuelanaval.cl')~



-- -------------------------------------------~
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS~
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS~
-- -------------------------------------------~
-- -------------------------------------------~
-- END BACKUP~
-- -------------------------------------------~
