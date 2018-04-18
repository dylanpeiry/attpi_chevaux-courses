-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema HorseRaces
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema HorseRaces
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HorseRaces` DEFAULT CHARACTER SET utf8 ;
USE `HorseRaces` ;

-- -----------------------------------------------------
-- Table `HorseRaces`.`RACES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HorseRaces`.`RACES` (
  `idRace` INT NOT NULL,
  `nameRace` VARCHAR(100) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `hippodrome` VARCHAR(45) NOT NULL,
  `country` VARCHAR(50) NOT NULL,
  `distance` INT NOT NULL,
  `dateRace` DATE NOT NULL,
  PRIMARY KEY (`idRace`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HorseRaces`.`HORSES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HorseRaces`.`HORSES` (
  `idHorse` INT NOT NULL,
  `nameHorse` VARCHAR(100) NOT NULL,
  `barn` VARCHAR(100) NOT NULL,
  `nativeCountry` VARCHAR(50) NOT NULL,
  `residenceCountry` VARCHAR(50) NOT NULL,
  `birthDate` DATE NOT NULL,
  PRIMARY KEY (`idHorse`),
  UNIQUE INDEX `nameHorse_UNIQUE` (`nameHorse` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HorseRaces`.`SCORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `HorseRaces`.`SCORES` (
  `time` INT NOT NULL,
  `RACES_idRace` INT NOT NULL,
  `HORSES_idHorse` INT NOT NULL,
  INDEX `fk_Scores_Races_idx` (`RACES_idRace` ASC),
  INDEX `fk_Scores_Horses1_idx` (`HORSES_idHorse` ASC),
  CONSTRAINT `fk_Scores_Races`
    FOREIGN KEY (`RACES_idRace`)
    REFERENCES `HorseRaces`.`RACES` (`idRace`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Scores_Horses1`
    FOREIGN KEY (`HORSES_idHorse`)
    REFERENCES `HorseRaces`.`HORSES` (`idHorse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;