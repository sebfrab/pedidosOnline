CREATE TABLE estado (
  idestado INTEGER UNSIGNED NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  abreviatura VARCHAR(15) NOT NULL,
  PRIMARY KEY(idestado)
);

CREATE TABLE categoria (
  idcategoria INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NULL,
  PRIMARY KEY(idcategoria)
);

CREATE TABLE tipo_usuario (
  idtipo_usuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  PRIMARY KEY(idtipo_usuario)
);

CREATE TABLE authassignment (
  itemname VARCHAR(64) NOT NULL,
  userid VARCHAR(64) NOT NULL,
  bizrule TEXT NOT NULL,
  data TEXT NOT NULL,
  PRIMARY KEY(itemname, userid)
);

CREATE TABLE authitem (
  name VARCHAR(64) NOT NULL,
  type INTEGER(11) NOT NULL,
  description TEXT NOT NULL,
  bizrule TEXT NOT NULL,
  data TEXT NOT NULL,
  PRIMARY KEY(name)
);

CREATE TABLE authitemchild (
  parent VARCHAR(64) NOT NULL,
  child VARCHAR(64) NOT NULL,
  PRIMARY KEY(parent, child),
  INDEX child(child)
);

CREATE TABLE subcategoria (
  idsubcategoria INTEGER UNSIGNED NOT NULL,
  categoria_idcategoria INTEGER UNSIGNED NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  PRIMARY KEY(idsubcategoria),
  INDEX subcategoria_FKIndex1(categoria_idcategoria),
  FOREIGN KEY(categoria_idcategoria)
    REFERENCES categoria(idcategoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE usuario (
  idusuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tipo_usuario_idtipo_usuario INTEGER UNSIGNED NOT NULL,
  estado_idestado INTEGER UNSIGNED NOT NULL,
  username VARCHAR(50) NOT NULL,
  password_2 VARCHAR(200) NOT NULL,
  nombres VARCHAR(50) NOT NULL,
  apellidos VARCHAR(50) NOT NULL,
  sexo VARCHAR(1) NOT NULL,
  last_login DATETIME NULL,
  email VARCHAR(150) NULL,
  PRIMARY KEY(idusuario),
  INDEX usuario_FKIndex1(estado_idestado),
  INDEX usuario_FKIndex2(tipo_usuario_idtipo_usuario),
  FOREIGN KEY(estado_idestado)
    REFERENCES estado(idestado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tipo_usuario_idtipo_usuario)
    REFERENCES tipo_usuario(idtipo_usuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE producto (
  idproducto INTEGER UNSIGNED NOT NULL,
  estado_idestado INTEGER UNSIGNED NOT NULL,
  subcategoria_idsubcategoria INTEGER UNSIGNED NOT NULL,
  nombre VARCHAR(150) NOT NULL,
  descripcion TEXT NULL,
  marca VARCHAR(50) NOT NULL,
  talla VARCHAR(10) NOT NULL,
  precio INTEGER UNSIGNED NOT NULL,
  cantidad INTEGER UNSIGNED NOT NULL,
  img VARCHAR(350) NULL,
  PRIMARY KEY(idproducto),
  INDEX producto_FKIndex1(subcategoria_idsubcategoria),
  INDEX producto_FKIndex2(estado_idestado),
  FOREIGN KEY(subcategoria_idsubcategoria)
    REFERENCES subcategoria(idsubcategoria)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(estado_idestado)
    REFERENCES estado(idestado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE carro (
  idcarro BIGINT NOT NULL AUTO_INCREMENT,
  usuario_idusuario INTEGER UNSIGNED NOT NULL,
  producto_idproducto INTEGER UNSIGNED NOT NULL,
  fecha DATETIME NOT NULL,
  cantidad INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(idcarro),
  INDEX carro_FKIndex1(producto_idproducto),
  INDEX carro_FKIndex2(usuario_idusuario),
  FOREIGN KEY(producto_idproducto)
    REFERENCES producto(idproducto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE pedido (
  idpedido BIGINT NOT NULL AUTO_INCREMENT,
  estado_idestado INTEGER UNSIGNED NOT NULL,
  usuario_idusuario INTEGER UNSIGNED NOT NULL,
  fecha_pedido DATETIME NOT NULL,
  fecha_entrega DATETIME NULL,
  PRIMARY KEY(idpedido),
  INDEX pedido_FKIndex1(usuario_idusuario),
  INDEX pedido_FKIndex2(estado_idestado),
  FOREIGN KEY(usuario_idusuario)
    REFERENCES usuario(idusuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(estado_idestado)
    REFERENCES estado(idestado)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE detalle_pedido (
  iddetalle_pedido BIGINT NOT NULL AUTO_INCREMENT,
  pedido_idpedido BIGINT NOT NULL,
  producto_idproducto INTEGER UNSIGNED NOT NULL,
  cantidad INTEGER UNSIGNED NULL,
  PRIMARY KEY(iddetalle_pedido),
  INDEX detalle_pedido_FKIndex1(producto_idproducto),
  INDEX detalle_pedido_FKIndex2(pedido_idpedido),
  FOREIGN KEY(producto_idproducto)
    REFERENCES producto(idproducto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(pedido_idpedido)
    REFERENCES pedido(idpedido)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


