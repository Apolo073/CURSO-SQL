-- -----------------------------------------------------
-- Schema BENCH-ETORRE
-- -----------------------------------------------------
CREATE SCHEMA `BENCH-ETORRE_2`;

-- -----------------------------------------------------
-- Table `BENCH-ETORRE`.`COMPANIAS_SERVICIO`
-- -----------------------------------------------------
CREATE TABLE `BENCH-ETORRE_2`.`COMPANIAS_SERVICIO` (
  `ID` SMALLINT NOT NULL AUTO_INCREMENT,
  `CUIL` INT UNSIGNED NULL,
  `RAZON_SOCIAL` VARCHAR(100) NULL,
  `NOMBRE_CORTO` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `BENCH-ETORRE`.`PROVINCIAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BENCH-ETORRE_2`.`PROVINCIAS` (
  `ID` TINYINT NOT NULL,
  `PROVINCIA` VARCHAR(45) NULL,
  `COORDENADAS_LONG` FLOAT NULL,
  `COORDENADAS_LAT` FLOAT NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `BENCH-ETORRE`.`ESPECIFICACIONES_TECNICAS`
-- -----------------------------------------------------
CREATE TABLE  `BENCH-ETORRE_2`.`ESPECIFICACIONES_TECNICAS` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `POTENCIA(HP)` SMALLINT NULL,
  `AÑO_FABRICACIÒN` YEAR NULL,
  `AÑO_REBUILT` YEAR NULL,
  `BOP(PSI)` SMALLINT NULL,
  `SISTEMA_CIRCULACIÒN(PSI)` SMALLINT NULL,
  `TOP_DRIVE` VARCHAR(2) NULL,
  `CRT` VARCHAR(2) NULL,
  `PLANCHADA_HIDRAULICA` VARCHAR(2) NULL,
  `SISTEMA_DESPLAZAMIENTO` VARCHAR(45) NULL,
  `MECANICO_ELECTRICO` VARCHAR(45) NULL,
  `ALTURA_TORRE` SMALLINT UNSIGNED NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `BENCH-ETORRE`.`EQUIPOS`
-- -----------------------------------------------------
CREATE TABLE `BENCH-ETORRE_2`.`EQUIPOS` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CIASERVICIO_ID` SMALLINT NOT NULL,
  `PROVINCIA_ID` TINYINT NOT NULL,
  `NOMBRE_EQUIPO` VARCHAR(10) NOT NULL,
  `TIPO` VARCHAR(45) NOT NULL,
  `COMENTARIOS` TEXT NULL,
  `ESPECIFICACIONES_TECNICAS_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
      FOREIGN KEY (`CIASERVICIO_ID`)
    REFERENCES `BENCH-ETORRE`.`COMPANIAS_SERVICIO` (`ID`),
    FOREIGN KEY (`PROVINCIA_ID`)
    REFERENCES `BENCH-ETORRE`.`PROVINCIAS` (`ID`),
    FOREIGN KEY (`ESPECIFICACIONES_TECNICAS_ID`)
    REFERENCES `BENCH-ETORRE`.`ESPECIFICACIONES_TECNICAS` (`ID`)
    );


-- -----------------------------------------------------
-- Table `BENCH-ETORRE`.`OPERADORAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BENCH-ETORRE_2`.`OPERADORAS` (
  `ID` SMALLINT NOT NULL AUTO_INCREMENT,
  `RAZON_SOCIAL` VARCHAR(100) NULL,
  `NOMBRE_CORTO` VARCHAR(15) NULL,
  `NOMBRE_CONTACTO` VARCHAR(45) NULL,
  `APELLIDO_CONTACTO` VARCHAR(45) NULL,
  `MAIL_CONTACTO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));

-- -----------------------------------------------------
-- Table `BENCH-ETORRE`.`CONTRATOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BENCH-ETORRE_2`.`CONTRATOS` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `EQUIPO_ID` INT NOT NULL,
  `OPERADORA_ID` SMALLINT NOT NULL,
  `NRO_DOCUMENTO` INT NOT NULL,
  `FECHA_INICIO` DATE NOT NULL,
  `FECHA_FIN` DATE NOT NULL,
  `OBJETIVO_OPERATIVO` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`),
      FOREIGN KEY (`EQUIPO_ID`)
    REFERENCES `BENCH-ETORRE`.`EQUIPOS` (`ID`),
      FOREIGN KEY (`OPERADORA_ID`)
    REFERENCES `BENCH-ETORRE`.`OPERADORAS` (`ID`));


-- -----------------------------------------------------
-- Table `BENCH-ETORRE`.`CONTACTOS_CIAS_SERVICIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BENCH-ETORRE_2`.`CONTACTOS_CIAS_SERVICIO` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `CIASERVICIO_ID` SMALLINT NOT NULL,
  `NOMBRE` VARCHAR(45) NULL,
  `APELLIDO` VARCHAR(45) NULL,
  `CARGO` VARCHAR(45) NULL,
  `MAIL` VARCHAR(45) NULL,
  `TELEFONO` INT NULL,
  PRIMARY KEY (`ID`),
    FOREIGN KEY (`CIASERVICIO_ID`)
    REFERENCES `BENCH-ETORRE`.`COMPANIAS_SERVICIO` (`ID`)
 );
