-- MySQL Script generated by MySQL Workbench
-- Tue Nov 26 16:27:25 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema transportessr
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema transportessr
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `transportessr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `transportessr` ;

-- -----------------------------------------------------
-- Table `transportessr`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`usuario` (
  `id` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `Apellido` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `Correo` VARCHAR(100) NOT NULL,
  `fecha_Nacimiento` DATE NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`tipo_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`tipo_cliente` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`cliente` (
  `id` INT NOT NULL,
  `tipo_Cliente` INT NOT NULL,
  `fecha_Registro` DATE NOT NULL,
  `status` TINYINT(1) NOT NULL,
  INDEX `id` (`id` ASC) VISIBLE,
  INDEX `tipo_Cliente` (`tipo_Cliente` ASC) VISIBLE,
  CONSTRAINT `cliente_ibfk_1`
    FOREIGN KEY (`id`)
    REFERENCES `transportessr`.`usuario` (`id`),
  CONSTRAINT `cliente_ibfk_2`
    FOREIGN KEY (`tipo_Cliente`)
    REFERENCES `transportessr`.`tipo_cliente` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`tipo_transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`tipo_transporte` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `asientos` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`tipo_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`tipo_servicio` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripción` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`servicio` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `transporte` INT NOT NULL,
  `tipo_Servicio` INT NOT NULL,
  `precio` FLOAT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `transporte` (`transporte` ASC) VISIBLE,
  INDEX `tipo_Servicio` (`tipo_Servicio` ASC) VISIBLE,
  CONSTRAINT `servicio_ibfk_1`
    FOREIGN KEY (`transporte`)
    REFERENCES `transportessr`.`tipo_transporte` (`id`),
  CONSTRAINT `servicio_ibfk_2`
    FOREIGN KEY (`tipo_Servicio`)
    REFERENCES `transportessr`.`tipo_servicio` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`carga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`carga` (
  `id` INT NOT NULL,
  `descripción` VARCHAR(200) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`marca_transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`marca_transporte` (
  `id` INT NOT NULL,
  `descripción` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`modelo_transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`modelo_transporte` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `marca` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `marca` (`marca` ASC) VISIBLE,
  CONSTRAINT `modelo_transporte_ibfk_1`
    FOREIGN KEY (`marca`)
    REFERENCES `transportessr`.`marca_transporte` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_transporte` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`sucursal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`sucursal` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `ubicación` VARCHAR(250) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `contacto` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`transporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`transporte` (
  `placa` VARCHAR(20) NOT NULL,
  `tipo` INT NOT NULL,
  `carga` INT NOT NULL,
  `modelo` INT NOT NULL,
  `marca` INT NOT NULL,
  `estado` INT NOT NULL,
  `sucursal` INT NOT NULL,
  `año` VARCHAR(4) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`placa`),
  INDEX `tipo` (`tipo` ASC) VISIBLE,
  INDEX `carga` (`carga` ASC) VISIBLE,
  INDEX `modelo` (`modelo` ASC) VISIBLE,
  INDEX `marca` (`marca` ASC) VISIBLE,
  INDEX `estado` (`estado` ASC) VISIBLE,
  INDEX `sucursal` (`sucursal` ASC) VISIBLE,
  CONSTRAINT `transporte_ibfk_1`
    FOREIGN KEY (`tipo`)
    REFERENCES `transportessr`.`tipo_transporte` (`id`),
  CONSTRAINT `transporte_ibfk_2`
    FOREIGN KEY (`carga`)
    REFERENCES `transportessr`.`carga` (`id`),
  CONSTRAINT `transporte_ibfk_3`
    FOREIGN KEY (`modelo`)
    REFERENCES `transportessr`.`modelo_transporte` (`id`),
  CONSTRAINT `transporte_ibfk_4`
    FOREIGN KEY (`marca`)
    REFERENCES `transportessr`.`marca_transporte` (`id`),
  CONSTRAINT `transporte_ibfk_5`
    FOREIGN KEY (`estado`)
    REFERENCES `transportessr`.`estado_transporte` (`id`),
  CONSTRAINT `transporte_ibfk_6`
    FOREIGN KEY (`sucursal`)
    REFERENCES `transportessr`.`sucursal` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`destino`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`destino` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `dirección` VARCHAR(250) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`cargo` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_empleado` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`salario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`salario` (
  `id` INT NOT NULL,
  `cargo` INT NOT NULL,
  `monto_Base` FLOAT NOT NULL,
  `inicio_Vigencia` DATE NOT NULL,
  `fin_Vigencia` DATE NOT NULL,
  `viaticos` FLOAT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `cargo` (`cargo` ASC) VISIBLE,
  CONSTRAINT `salario_ibfk_1`
    FOREIGN KEY (`cargo`)
    REFERENCES `transportessr`.`cargo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`dias_descanso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`dias_descanso` (
  `id` INT NOT NULL,
  `dias` INT NOT NULL,
  `nombre_Dias` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`empleado` (
  `id` INT NOT NULL,
  `cargo` INT NOT NULL,
  `sucursal` INT NOT NULL,
  `estado` INT NOT NULL,
  `salario` INT NOT NULL,
  `descanso_Dias` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `cargo` (`cargo` ASC) VISIBLE,
  INDEX `sucursal` (`sucursal` ASC) VISIBLE,
  INDEX `estado` (`estado` ASC) VISIBLE,
  INDEX `salario` (`salario` ASC) VISIBLE,
  INDEX `descanso_Dias` (`descanso_Dias` ASC) VISIBLE,
  CONSTRAINT `empleado_ibfk_1`
    FOREIGN KEY (`id`)
    REFERENCES `transportessr`.`usuario` (`id`),
  CONSTRAINT `empleado_ibfk_2`
    FOREIGN KEY (`cargo`)
    REFERENCES `transportessr`.`cargo` (`id`),
  CONSTRAINT `empleado_ibfk_3`
    FOREIGN KEY (`sucursal`)
    REFERENCES `transportessr`.`sucursal` (`id`),
  CONSTRAINT `empleado_ibfk_4`
    FOREIGN KEY (`estado`)
    REFERENCES `transportessr`.`estado_empleado` (`id`),
  CONSTRAINT `empleado_ibfk_5`
    FOREIGN KEY (`salario`)
    REFERENCES `transportessr`.`salario` (`id`),
  CONSTRAINT `empleado_ibfk_6`
    FOREIGN KEY (`descanso_Dias`)
    REFERENCES `transportessr`.`dias_descanso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`chofer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`chofer` (
  `id` INT NOT NULL,
  `licencia` VARCHAR(200) NOT NULL,
  `especialidad` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `especialidad` (`especialidad` ASC) VISIBLE,
  CONSTRAINT `chofer_ibfk_1`
    FOREIGN KEY (`id`)
    REFERENCES `transportessr`.`empleado` (`id`),
  CONSTRAINT `chofer_ibfk_2`
    FOREIGN KEY (`especialidad`)
    REFERENCES `transportessr`.`tipo_transporte` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`tipo_envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`tipo_envio` (
  `id` INT NOT NULL,
  `categoría` VARCHAR(100) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`reservacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`reservacion` (
  `id` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  `id_Servicio` INT NOT NULL,
  `fecha_Reserva` DATETIME NOT NULL,
  `fecha_Modificacion` DATETIME NOT NULL,
  `Fecha_Cancelacion` DATETIME NOT NULL,
  `transporte` VARCHAR(20) NOT NULL,
  `destino` INT NOT NULL,
  `origen` INT NOT NULL,
  `chofer_Asignado` INT NOT NULL,
  `sucursal` INT NOT NULL,
  `tipo_Envio` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_Cliente` (`id_Cliente` ASC) VISIBLE,
  INDEX `id_Servicio` (`id_Servicio` ASC) VISIBLE,
  INDEX `transporte` (`transporte` ASC) VISIBLE,
  INDEX `destino` (`destino` ASC) VISIBLE,
  INDEX `origen` (`origen` ASC) VISIBLE,
  INDEX `chofer_Asignado` (`chofer_Asignado` ASC) VISIBLE,
  INDEX `sucursal` (`sucursal` ASC) VISIBLE,
  INDEX `tipo_Envio` (`tipo_Envio` ASC) VISIBLE,
  CONSTRAINT `reservacion_ibfk_1`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `transportessr`.`cliente` (`id`),
  CONSTRAINT `reservacion_ibfk_2`
    FOREIGN KEY (`id_Servicio`)
    REFERENCES `transportessr`.`servicio` (`id`),
  CONSTRAINT `reservacion_ibfk_3`
    FOREIGN KEY (`transporte`)
    REFERENCES `transportessr`.`transporte` (`placa`),
  CONSTRAINT `reservacion_ibfk_4`
    FOREIGN KEY (`destino`)
    REFERENCES `transportessr`.`destino` (`id`),
  CONSTRAINT `reservacion_ibfk_5`
    FOREIGN KEY (`origen`)
    REFERENCES `transportessr`.`destino` (`id`),
  CONSTRAINT `reservacion_ibfk_6`
    FOREIGN KEY (`chofer_Asignado`)
    REFERENCES `transportessr`.`chofer` (`id`),
  CONSTRAINT `reservacion_ibfk_7`
    FOREIGN KEY (`sucursal`)
    REFERENCES `transportessr`.`sucursal` (`id`),
  CONSTRAINT `reservacion_ibfk_8`
    FOREIGN KEY (`tipo_Envio`)
    REFERENCES `transportessr`.`tipo_envio` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`ruta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`ruta` (
  `id` INT NOT NULL,
  `destino` INT NOT NULL,
  `origen` INT NOT NULL,
  `Distancia` VARCHAR(100) NOT NULL,
  `duración_Recorrido` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `destino` (`destino` ASC) VISIBLE,
  INDEX `origen` (`origen` ASC) VISIBLE,
  CONSTRAINT `ruta_ibfk_1`
    FOREIGN KEY (`destino`)
    REFERENCES `transportessr`.`destino` (`id`),
  CONSTRAINT `ruta_ibfk_2`
    FOREIGN KEY (`origen`)
    REFERENCES `transportessr`.`destino` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`gps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`gps` (
  `id` INT NOT NULL,
  `transporte` VARCHAR(20) NOT NULL,
  `Latitud` VARCHAR(250) NOT NULL,
  `Longitud` VARCHAR(250) NOT NULL,
  `fecha_Hora` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `transporte` (`transporte` ASC) VISIBLE,
  CONSTRAINT `gps_ibfk_1`
    FOREIGN KEY (`transporte`)
    REFERENCES `transportessr`.`transporte` (`placa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_envio` (
  `id` INT NOT NULL,
  `mombre` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`punto_ubicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`punto_ubicacion` (
  `id` INT NOT NULL,
  `ruta` INT NOT NULL,
  `Latitud` VARCHAR(250) NOT NULL,
  `Longitud` VARCHAR(250) NOT NULL,
  `descripción` VARCHAR(250) NOT NULL,
  `tiempo_Estimado` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ruta` (`ruta` ASC) VISIBLE,
  CONSTRAINT `punto_ubicacion_ibfk_1`
    FOREIGN KEY (`ruta`)
    REFERENCES `transportessr`.`ruta` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`seguimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`seguimiento` (
  `id` INT NOT NULL,
  `reservacion` INT NOT NULL,
  `ruta` INT NOT NULL,
  `transporte` VARCHAR(20) NOT NULL,
  `gps` INT NOT NULL,
  `fecha_Hora` DATETIME NOT NULL,
  `estado` INT NOT NULL,
  `punto_Actual` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reservacion` (`reservacion` ASC) VISIBLE,
  INDEX `ruta` (`ruta` ASC) VISIBLE,
  INDEX `transporte` (`transporte` ASC) VISIBLE,
  INDEX `gps` (`gps` ASC) VISIBLE,
  INDEX `estado` (`estado` ASC) VISIBLE,
  INDEX `punto_Actual` (`punto_Actual` ASC) VISIBLE,
  CONSTRAINT `seguimiento_ibfk_1`
    FOREIGN KEY (`reservacion`)
    REFERENCES `transportessr`.`reservacion` (`id`),
  CONSTRAINT `seguimiento_ibfk_2`
    FOREIGN KEY (`ruta`)
    REFERENCES `transportessr`.`ruta` (`id`),
  CONSTRAINT `seguimiento_ibfk_3`
    FOREIGN KEY (`transporte`)
    REFERENCES `transportessr`.`transporte` (`placa`),
  CONSTRAINT `seguimiento_ibfk_4`
    FOREIGN KEY (`gps`)
    REFERENCES `transportessr`.`gps` (`id`),
  CONSTRAINT `seguimiento_ibfk_5`
    FOREIGN KEY (`estado`)
    REFERENCES `transportessr`.`estado_envio` (`id`),
  CONSTRAINT `seguimiento_ibfk_6`
    FOREIGN KEY (`punto_Actual`)
    REFERENCES `transportessr`.`punto_ubicacion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`tipo_alerta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`tipo_alerta` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripción` VARCHAR(250) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`alerta_seguimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`alerta_seguimiento` (
  `id` INT NOT NULL,
  `id_Seguimiento` INT NOT NULL,
  `tipo_Alerta` INT NOT NULL,
  `Descripción` VARCHAR(250) NOT NULL,
  `fecha_Hora` DATETIME NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_Seguimiento` (`id_Seguimiento` ASC) VISIBLE,
  INDEX `tipo_Alerta` (`tipo_Alerta` ASC) VISIBLE,
  CONSTRAINT `alerta_seguimiento_ibfk_1`
    FOREIGN KEY (`id_Seguimiento`)
    REFERENCES `transportessr`.`seguimiento` (`id`),
  CONSTRAINT `alerta_seguimiento_ibfk_2`
    FOREIGN KEY (`tipo_Alerta`)
    REFERENCES `transportessr`.`tipo_alerta` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_chofer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_chofer` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_actual_chofer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_actual_chofer` (
  `id_Chofer` INT NOT NULL,
  `estado` INT NOT NULL,
  `fecha_Hora` DATETIME NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_Chofer`),
  INDEX `estado` (`estado` ASC) VISIBLE,
  CONSTRAINT `estado_actual_chofer_ibfk_1`
    FOREIGN KEY (`id_Chofer`)
    REFERENCES `transportessr`.`chofer` (`id`),
  CONSTRAINT `estado_actual_chofer_ibfk_2`
    FOREIGN KEY (`estado`)
    REFERENCES `transportessr`.`estado_chofer` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_factura` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripción` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_mantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_mantenimiento` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_pago` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`estado_sesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`estado_sesion` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`factura` (
  `id` INT NOT NULL,
  `reservacion` INT NOT NULL,
  `cliente` INT NOT NULL,
  `fecha_Emision` DATETIME NOT NULL,
  `estado_Factura` INT NOT NULL,
  `fecha_Vencimiento` DATE NOT NULL,
  `impuesto` INT NOT NULL,
  `descuento` FLOAT NOT NULL,
  `monto_Total` FLOAT NOT NULL,
  `sucursal` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `reservacion` (`reservacion` ASC) VISIBLE,
  INDEX `cliente` (`cliente` ASC) VISIBLE,
  INDEX `estado_Factura` (`estado_Factura` ASC) VISIBLE,
  INDEX `sucursal` (`sucursal` ASC) VISIBLE,
  CONSTRAINT `factura_ibfk_1`
    FOREIGN KEY (`reservacion`)
    REFERENCES `transportessr`.`reservacion` (`id`),
  CONSTRAINT `factura_ibfk_2`
    FOREIGN KEY (`cliente`)
    REFERENCES `transportessr`.`cliente` (`id`),
  CONSTRAINT `factura_ibfk_3`
    FOREIGN KEY (`estado_Factura`)
    REFERENCES `transportessr`.`estado_factura` (`id`),
  CONSTRAINT `factura_ibfk_4`
    FOREIGN KEY (`sucursal`)
    REFERENCES `transportessr`.`sucursal` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`historial_chofer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`historial_chofer` (
  `id` INT NOT NULL,
  `chofer` INT NOT NULL,
  `transporte` VARCHAR(20) NOT NULL,
  `fecha_Inicio` DATE NOT NULL,
  `fecha_Fin` DATE NOT NULL,
  `kilometraje` VARCHAR(100) NOT NULL,
  `notas` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `chofer` (`chofer` ASC) VISIBLE,
  INDEX `transporte` (`transporte` ASC) VISIBLE,
  CONSTRAINT `historial_chofer_ibfk_1`
    FOREIGN KEY (`chofer`)
    REFERENCES `transportessr`.`chofer` (`id`),
  CONSTRAINT `historial_chofer_ibfk_2`
    FOREIGN KEY (`transporte`)
    REFERENCES `transportessr`.`transporte` (`placa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`tipo_mantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`tipo_mantenimiento` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripción` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`taller`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`taller` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `ubicación` VARCHAR(250) NOT NULL,
  `contacto` VARCHAR(100) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`mantenimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`mantenimiento` (
  `id` INT NOT NULL,
  `transporte` VARCHAR(20) NOT NULL,
  `tipo_Mantenimiento` INT NOT NULL,
  `fecha_Ingreso` DATE NOT NULL,
  `taller` INT NOT NULL,
  `descripción` VARCHAR(200) NOT NULL,
  `costo` FLOAT NOT NULL,
  `estado_Mantenimiento` INT NOT NULL,
  `fecha_Salida` DATE NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `transporte` (`transporte` ASC) VISIBLE,
  INDEX `tipo_Mantenimiento` (`tipo_Mantenimiento` ASC) VISIBLE,
  INDEX `taller` (`taller` ASC) VISIBLE,
  INDEX `estado_Mantenimiento` (`estado_Mantenimiento` ASC) VISIBLE,
  CONSTRAINT `mantenimiento_ibfk_1`
    FOREIGN KEY (`transporte`)
    REFERENCES `transportessr`.`transporte` (`placa`),
  CONSTRAINT `mantenimiento_ibfk_2`
    FOREIGN KEY (`tipo_Mantenimiento`)
    REFERENCES `transportessr`.`tipo_mantenimiento` (`id`),
  CONSTRAINT `mantenimiento_ibfk_3`
    FOREIGN KEY (`taller`)
    REFERENCES `transportessr`.`taller` (`id`),
  CONSTRAINT `mantenimiento_ibfk_4`
    FOREIGN KEY (`estado_Mantenimiento`)
    REFERENCES `transportessr`.`estado_mantenimiento` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`metodo_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`metodo_pago` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`tipo_notificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`tipo_notificacion` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripción` VARCHAR(250) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`notificacion_cli`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`notificacion_cli` (
  `id` INT NOT NULL,
  `cliente` INT NOT NULL,
  `tipo_Notificacion` INT NOT NULL,
  `mensaje` VARCHAR(300) NOT NULL,
  `fecha_Hora` DATETIME NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `cliente` (`cliente` ASC) VISIBLE,
  INDEX `tipo_Notificacion` (`tipo_Notificacion` ASC) VISIBLE,
  CONSTRAINT `notificacion_cli_ibfk_1`
    FOREIGN KEY (`cliente`)
    REFERENCES `transportessr`.`cliente` (`id`),
  CONSTRAINT `notificacion_cli_ibfk_2`
    FOREIGN KEY (`tipo_Notificacion`)
    REFERENCES `transportessr`.`tipo_notificacion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`pago` (
  `id` INT NOT NULL,
  `factura` INT NOT NULL,
  `fecha_Pago` DATE NOT NULL,
  `monto` FLOAT NOT NULL,
  `metodo_Pago` INT NOT NULL,
  `estado_Pago` INT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `factura` (`factura` ASC) VISIBLE,
  INDEX `metodo_Pago` (`metodo_Pago` ASC) VISIBLE,
  INDEX `estado_Pago` (`estado_Pago` ASC) VISIBLE,
  CONSTRAINT `pago_ibfk_1`
    FOREIGN KEY (`factura`)
    REFERENCES `transportessr`.`factura` (`id`),
  CONSTRAINT `pago_ibfk_2`
    FOREIGN KEY (`metodo_Pago`)
    REFERENCES `transportessr`.`metodo_pago` (`id`),
  CONSTRAINT `pago_ibfk_3`
    FOREIGN KEY (`estado_Pago`)
    REFERENCES `transportessr`.`estado_pago` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`pago_chofer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`pago_chofer` (
  `id` INT NOT NULL,
  `chofer` INT NOT NULL,
  `viaje` INT NOT NULL,
  `dias_Viaje` INT NOT NULL,
  `salario` INT NOT NULL,
  `estado_Pago` INT NOT NULL,
  `monto_Total` FLOAT NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `chofer` (`chofer` ASC) VISIBLE,
  INDEX `viaje` (`viaje` ASC) VISIBLE,
  INDEX `salario` (`salario` ASC) VISIBLE,
  INDEX `estado_Pago` (`estado_Pago` ASC) VISIBLE,
  CONSTRAINT `pago_chofer_ibfk_1`
    FOREIGN KEY (`chofer`)
    REFERENCES `transportessr`.`chofer` (`id`),
  CONSTRAINT `pago_chofer_ibfk_2`
    FOREIGN KEY (`viaje`)
    REFERENCES `transportessr`.`reservacion` (`id`),
  CONSTRAINT `pago_chofer_ibfk_3`
    FOREIGN KEY (`salario`)
    REFERENCES `transportessr`.`salario` (`id`),
  CONSTRAINT `pago_chofer_ibfk_4`
    FOREIGN KEY (`estado_Pago`)
    REFERENCES `transportessr`.`estado_pago` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`pago_salario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`pago_salario` (
  `id` INT NOT NULL,
  `id_Salario` INT NOT NULL,
  `id_Empleado` INT NOT NULL,
  `estado_Pago` INT NOT NULL,
  `metodo_Pago` INT NOT NULL,
  `ultimo_Pago` DATE NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_Salario` (`id_Salario` ASC) VISIBLE,
  INDEX `id_Empleado` (`id_Empleado` ASC) VISIBLE,
  INDEX `estado_Pago` (`estado_Pago` ASC) VISIBLE,
  INDEX `metodo_Pago` (`metodo_Pago` ASC) VISIBLE,
  CONSTRAINT `pago_salario_ibfk_1`
    FOREIGN KEY (`id_Salario`)
    REFERENCES `transportessr`.`salario` (`id`),
  CONSTRAINT `pago_salario_ibfk_2`
    FOREIGN KEY (`id_Empleado`)
    REFERENCES `transportessr`.`empleado` (`id`),
  CONSTRAINT `pago_salario_ibfk_3`
    FOREIGN KEY (`estado_Pago`)
    REFERENCES `transportessr`.`estado_pago` (`id`),
  CONSTRAINT `pago_salario_ibfk_4`
    FOREIGN KEY (`metodo_Pago`)
    REFERENCES `transportessr`.`metodo_pago` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`permiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`permiso` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripción` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`rol` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripción` VARCHAR(200) NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`roles_permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`roles_permisos` (
  `id_Rol` INT NOT NULL,
  `permiso_id` INT NOT NULL,
  `status` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Rol`),
  INDEX `permiso_id` (`permiso_id` ASC) VISIBLE,
  CONSTRAINT `roles_permisos_ibfk_1`
    FOREIGN KEY (`id_Rol`)
    REFERENCES `transportessr`.`rol` (`id`),
  CONSTRAINT `roles_permisos_ibfk_2`
    FOREIGN KEY (`permiso_id`)
    REFERENCES `transportessr`.`permiso` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`usuario_online`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`usuario_online` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `contraseña` VARCHAR(100) NOT NULL,
  `fecha_Registro` DATE NOT NULL,
  `status` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `usuario_online_ibfk_1`
    FOREIGN KEY (`id`)
    REFERENCES `transportessr`.`usuario` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`sesion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`sesion` (
  `id` INT NOT NULL,
  `id_Usuario` INT NOT NULL,
  `fecha_Inicio` DATE NOT NULL,
  `fecha_Fin` DATE NOT NULL,
  `estado_Sesion` INT NOT NULL,
  `status` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_Usuario` (`id_Usuario` ASC) VISIBLE,
  INDEX `estado_Sesion` (`estado_Sesion` ASC) VISIBLE,
  CONSTRAINT `sesion_ibfk_1`
    FOREIGN KEY (`id_Usuario`)
    REFERENCES `transportessr`.`usuario_online` (`id`),
  CONSTRAINT `sesion_ibfk_2`
    FOREIGN KEY (`estado_Sesion`)
    REFERENCES `transportessr`.`estado_sesion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `transportessr`.`usuario_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `transportessr`.`usuario_roles` (
  `id_Usuario` INT NOT NULL,
  `id_Rol` INT NOT NULL,
  `status` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id_Usuario`),
  INDEX `id_Rol` (`id_Rol` ASC) VISIBLE,
  CONSTRAINT `usuario_roles_ibfk_1`
    FOREIGN KEY (`id_Usuario`)
    REFERENCES `transportessr`.`usuario` (`id`),
  CONSTRAINT `usuario_roles_ibfk_2`
    FOREIGN KEY (`id_Rol`)
    REFERENCES `transportessr`.`rol` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
