DROP DATABASE IF EXISTS `bookbiz`;
CREATE DATABASE IF NOT EXISTS `bookbiz`; 
USE `bookbiz`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

-- --------------------------------------
--  TABLE AUTHOR
-- --------------------------------------
CREATE TABLE `Authors` (
	`AuthorID` 			int NOT NULL AUTO_INCREMENT,
	`FirstName` 		varchar (20) NOT NULL ,
	`LastName` 			varchar (20) NOT NULL ,
    `Country` 			varchar (20) NOT NULL ,
  	PRIMARY KEY (`AuthorID`),	
	INDEX `AuthorID` (`AuthorID` ASC),
	INDEX `LastName` (`LastName` ASC),
	INDEX `FirstName` (`FirstName` ASC)	
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE PUBLISHERS
-- --------------------------------------
CREATE TABLE `Publishers` (
    `PublisherID`            int NOT NULL AUTO_INCREMENT,
    `PublisherName`          varchar (60) NULL,
    `City`   				 varchar (30) NULL,
    `Region`   				 varchar (30) NULL,
    `Country`                varchar (30) NULL,
    PRIMARY KEY (`PublisherID`), 
    INDEX `PublisherID` (`PublisherID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE EDITORS
-- --------------------------------------
CREATE TABLE `Editors` (
    `EditorID`              int NOT NULL AUTO_INCREMENT,
    `EditorName`          	varchar (60) NULL,
    `City`   				varchar (30) NULL,
    `Region`   				varchar (30) NULL,
    `Country`               varchar (30) NULL,
    PRIMARY KEY (`EditorID`), 
    INDEX `EditorID` (`EditorID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE BOOKS
-- --------------------------------------
CREATE TABLE `Books` (
	`BookID` 		    int NOT NULL AUTO_INCREMENT,
	`BookTitle` 		varchar (40) NOT NULL,
    `Genre` 		    varchar (20) NULL,
	`AuthorID` 			int NULL,	
	`PublisherID` 		int NULL ,
	`EditorID` 			int NULL,	
	`PublicationYear` 	int(4) NULL,
    `Price`				DECIMAL(10,2) NULL,
    `RoyaltyPayment` 	DECIMAL(2,2),
  	PRIMARY KEY (`BookID`),	
    FOREIGN KEY (`AuthorID`) REFERENCES `Authors` (`AuthorID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION, 
	FOREIGN KEY (`PublisherID`) REFERENCES `Publishers` (`PublisherID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION, 
	FOREIGN KEY (`EditorID`) REFERENCES `Editors` (`EditorID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION, 
	INDEX `BookID` (`BookID` ASC),
	INDEX `BookTitle` (`BookTitle` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE CUSTOMERS
-- --------------------------------------
CREATE TABLE `Customers` (
    `CustomerID`        int NOT NULL AUTO_INCREMENT,
    `CustomerName` 		varchar (40) NOT NULL,
    PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE ORDERS
-- --------------------------------------
CREATE TABLE `Orders` (
    `OrderID` 			int NOT NULL AUTO_INCREMENT,
    `CustomerID`        int NOT NULL,
    `OrderDate`         datetime NOT NULL UNIQUE,
    PRIMARY KEY (`OrderID`),
    FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION    
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE ORDER DETAILS
-- --------------------------------------
CREATE TABLE `OrderDetails` (
    `OrderID`          int NOT NULL,
    `BookID`           int NOT NULL,
    `Quantity`         int NULL,
    PRIMARY KEY (`OrderID`,`BookID`),
    FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,    
    FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;


