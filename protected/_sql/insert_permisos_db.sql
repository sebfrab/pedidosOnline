-- -------------------------------------------;
-- TABLE DATA authitem;
-- -------------------------------------------;
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_usuario','1','acceso completo al mantenedor de usuarios','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('lista_productos','1','acceso para visualizar la lista de productos del sistema','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('carro','1','acceso al carro de compra','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_producto','1','acceso completo al mantenedor de productos','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_detalle_pedido','1','acceso completo a los detalles del pedido','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_pedidos','1','acceso completo a los pedidos realizados','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('pedidos','1','acceso a los pedidos','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('import_csv','1','importación de datos desde archivos .csv','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_subcategorias','1','acceso total al mantenedor de subcategorias','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_categorias','1','acceso total al mantenedor de categorias','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('mantenedor_tipo_usuario','1','acceso total al mantenedor de los tipos de usuario','','N;');
INSERT INTO `authitem` (`name`,`type`,`description`,`bizrule`,`data`) VALUES
('backup','1','acceso a los backup, realizarlo, eliminarlos y restauración','','N;');