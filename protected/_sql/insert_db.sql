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
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('backup','1','acceso a los backup, realizarlo, eliminarlos y restauración','','N;')~



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
('1','1','1','17558919-8','21232f297a57a5a743894a0e4a801fc3','Sebastián','Franco Brantes','H','2014-07-21 12:11:47','seb.frab@gmail.com')~