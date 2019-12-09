-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table Figura
-- -----------------------------------------------------
CREATE TYPE figura AS (
  id INT,
  nombre VARCHAR(45),
  color VARCHAR(45),
  area FLOAT,
  perimetro FLOAT
)
;

CREATE TABLE IF NOT EXISTS T_Figura OF figura (
  PRIMARY KEY (id))
;


-- -----------------------------------------------------
-- Table Plano
-- -----------------------------------------------------
CREATE TYPE plano AS (
  id INT,
  fecha_entrega DATE,
  representacion VARCHAR(45),
  arquitecto VARCHAR(45),
  figuras figura[])
;

CREATE TABLE IF NOT EXISTS T_Plano OF plano (
	PRIMARY KEY (id, fecha_entrega))
;

-- -----------------------------------------------------
-- Table Proyecto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Proyecto (
  codigo INT NOT NULL,
  nombre VARCHAR(45) NULL,
  planos plano[],
  PRIMARY KEY (codigo))
;


-- -----------------------------------------------------
-- Table Jefe
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Jefe (
  codigo INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  direccion VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo, nombre))
;

-- ------------------------------
-- Type Coordenadas
-- ------------------------------
CREATE TYPE coordenadas AS (
	EjeX INT,
	EjeY INT)
;

-- -----------------------------------------------------
-- Table Linea
-- -----------------------------------------------------
CREATE TYPE linea AS (
  id INT,
  longitud FLOAT,
  origen coordenadas,
  final coordenadas)
;

CREATE TABLE IF NOT EXISTS T_Linea OF linea (
  PRIMARY KEY (id))
;

-- -----------------------------------------------------
-- Table Poligono
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Poligono (
	n_lineas INT NOT NULL,
	lineas linea[])
;

-- -----------------------------------------------------
-- Table Jefe_Proyecto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Jefe_Proyecto (
  codigoP INT NOT NULL,
  codigoJ INT NOT NULL,
  nombreJ VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigoP, codigoJ, nombreJ),
  CONSTRAINT codigoP
    FOREIGN KEY (codigoP)
    REFERENCES T_Proyecto (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT codigoJ
    FOREIGN KEY (codigoJ , nombreJ)
    REFERENCES T_Jefe (codigo , nombre)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT nombreJ
    FOREIGN KEY (codigoJ , nombreJ)
    REFERENCES T_Jefe (codigo , nombre)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table Plano_Proyecto
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Plano_Proyecto (
  codigoPr INT NOT NULL,
  idPl INT NOT NULL,
  fecha_entregaPl DATE NOT NULL,
  PRIMARY KEY (codigoPr, idPl, fecha_entregaPl),
  CONSTRAINT codigoPr
    FOREIGN KEY (codigoPr)
    REFERENCES T_Proyecto (codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT idPl
    FOREIGN KEY (fecha_entregaPl , idPl)
    REFERENCES T_Plano (fecha_entrega , id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fecha_entregaPl
    FOREIGN KEY (fecha_entregaPl , idPl)
    REFERENCES T_Plano (fecha_entrega , id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table Figura_Plano
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Figura_Plano (
  idP INT NOT NULL,
  idF INT NOT NULL,
  fecha_entregaP DATE NOT NULL,
  PRIMARY KEY (idP, idF, fecha_entregaP),
  CONSTRAINT idP
    FOREIGN KEY (fecha_entregaP , idP)
    REFERENCES T_Plano (fecha_entrega , id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT idF
    FOREIGN KEY (idF)
    REFERENCES T_Figura (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fecha_entregaP
    FOREIGN KEY (fecha_entregaP , idP)
    REFERENCES T_Plano (fecha_entrega , id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table Linea_Poligono
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS T_Linea_Poligono (
  idF INT NOT NULL,
  idL INT NOT NULL,
  PRIMARY KEY (idF, idL),
  CONSTRAINT idF
    FOREIGN KEY (idF)
    REFERENCES T_Figura (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT idL
    FOREIGN KEY (idL)
    REFERENCES T_Linea (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
