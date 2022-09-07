-- MySQL Script generated by MySQL Workbench
-- Thu Aug 25 20:51:32 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CRAM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CRAM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CRAM` DEFAULT CHARACTER SET utf8 ;
USE `CRAM` ;

-- -----------------------------------------------------
-- Table `CRAM`.`Lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRAM`.`Lugar` (
  `IdLugar` VARCHAR(255) NOT NULL,
  `Nombre` TEXT NOT NULL,
  `Descripcion` TEXT NULL,
  `Filtros` TEXT NULL,
  `AgregadoALista` TINYINT NOT NULL,
  `Foto` LONGTEXT NULL,
  PRIMARY KEY (`IdLugar`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRAM`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRAM`.`Usuario` (
  `IdUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre` LONGTEXT NOT NULL,
  `Foto` TEXT NULL,
  `Password` LONGTEXT NOT NULL,
  `Username` VARCHAR(25) NOT NULL,
  `Mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  UNIQUE INDEX `idUsuario_UNIQUE` (`IdUsuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRAM`.`Lista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRAM`.`Lista` (
  `IdLista` INT NOT NULL AUTO_INCREMENT,
  `Nombre` TEXT NOT NULL,
  `Descripcion` TEXT NOT NULL,
  `IdUsuario` INT NOT NULL,
  PRIMARY KEY (`IdLista`),
  INDEX `fk_Lista_Usuario_idx` (`IdUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Lista_Usuario`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `CRAM`.`Usuario` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRAM`.`Seguido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRAM`.`Seguido` (
  `idSeguido` INT NOT NULL ,
  `IdUsuario` INT NOT NULL,
  PRIMARY KEY (`idSeguido`),
  INDEX `fk_Seguido_Usuario1_idx` (`IdUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Seguido_Usuario1`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `CRAM`.`Usuario` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRAM`.`Review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRAM`.`Review` (
  `IdReview` INT NOT NULL AUTO_INCREMENT,
  `Destacar` VARCHAR(80) NULL,
  `Descripcion` TEXT NOT NULL,
  `Comentarios` TEXT NULL,
  `IdLugar` VARCHAR(255) NOT NULL,
  `Puntaje` INT NOT NULL,
  `Titulo` VARCHAR(200) NOT NULL,
  `IdUsuario` INT NOT NULL,
   `Foto` LONGTEXT NULL,
 
  PRIMARY KEY (`IdReview`),
  INDEX `fk_Review_Usuario1_idx` (`IdUsuario` ASC) VISIBLE,
  CONSTRAINT `fk_Review_Usuario1`
    FOREIGN KEY (`IdUsuario`)
    REFERENCES `CRAM`.`Usuario` (`IdUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `CRAM`.`Filtros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRAM`.`filtros` (
  `idFiltros` int NOT NULL AUTO_INCREMENT,
  `Nombre` text NOT NULL,
  `IdLugar` VARCHAR(255) NOT NULL,
  INDEX `fk_filtros_Lugar1_idx` (`IdLugar` ASC) VISIBLE,
  PRIMARY KEY (`idFiltros`),
  UNIQUE KEY `idFiltros_UNIQUE` (`idFiltros`),
    CONSTRAINT `fk_filtros_Lugar1`
    FOREIGN KEY (`IdLugar`)
    REFERENCES `CRAM`.`Lugar` (`IdLugar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- -----------------------------------------------------
-- Table `CRAM`.`LugaresXLista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRAM`.`LugaresXLista` (
  `IdLista` INT NOT NULL,
  `IdLugar` VARCHAR(255) NOT NULL,
  INDEX `fk_LugaresXLista_Lista1_idx` (`IdLista` ASC) VISIBLE,
  INDEX `fk_LugaresXLista_Lugar1_idx` (`IdLugar` ASC) VISIBLE,
  PRIMARY KEY (`IdLista`),
  CONSTRAINT `fk_LugaresXLista_Lista1`
    FOREIGN KEY (`IdLista`)
    REFERENCES `CRAM`.`Lista` (`IdLista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LugaresXLista_Lugar1`
    FOREIGN KEY (`IdLugar`)
    REFERENCES `CRAM`.`Lugar` (`IdLugar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
