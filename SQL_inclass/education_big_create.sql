DROP DATABASE IF EXISTS `education`;
CREATE DATABASE IF NOT EXISTS `education`; 
USE `education`;

SET NAMES UTF8MB4;
SET character_set_client = UTF8MB4;

-- --------------------------------------
--  TABLE COLLEGES
-- --------------------------------------

CREATE TABLE `Colleges` (
	`CollegeID` 		int NOT NULL AUTO_INCREMENT,
	`Name` 				varchar (20) NOT NULL,
	`Students` 			int NULL,	
	`City` 				varchar (15) NULL ,
	`Region` 			varchar (15) NULL ,	
	`Country` 			varchar (15) NULL ,
  	PRIMARY KEY (`CollegeID`),	
	INDEX `CollegeID` (`CollegeID` ASC),
	INDEX `Name` (`Name` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE STUDENTS
-- --------------------------------------

CREATE TABLE `Students` (
	`StudentID` 		int NOT NULL AUTO_INCREMENT,
	`CollegeID` 		int NOT NULL,	
	`FriendID` 			int NULL,		
	`FirstName` 		varchar (20) NOT NULL ,
	`LastName` 			varchar (20) NOT NULL ,	
	`BirthDate` 		date NULL ,
    `Salary`	        decimal(13,2),
	`Email` 			varchar (30) NULL ,
	`Phone` 		    varchar (24) NULL ,	
	`City` 				varchar (15) NULL ,
	`Region` 			varchar (15) NULL ,
	`Country` 			varchar (15) NULL ,
  	PRIMARY KEY (`StudentID`),	
	INDEX `StudentID` (`StudentID` ASC),
	INDEX `LastName` (`LastName` ASC),
	INDEX `FirstName` (`FirstName` ASC),	
	FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------
--  TABLE BOOKS
-- --------------------------------------

CREATE TABLE `Books` (
    `BookID`            int NOT NULL AUTO_INCREMENT,
    `Title`             varchar (60) NULL,
    `PubDate`   		date NULL,
    PRIMARY KEY (`BookID`), 
    INDEX `BookID` (`BookID` ASC)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------
--  TABLE COLLEGEBOOKS
-- --------------------------------------

CREATE TABLE `CollegeBooks` (
    `CollegeID`          int NOT NULL,
    `BookID`            int NOT NULL,
    PRIMARY KEY (`CollegeID`,`BookID`),
    FOREIGN KEY (`CollegeID`) REFERENCES `Colleges` (`CollegeID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,    
    FOREIGN KEY (`BookID`) REFERENCES `Books` (`BookID`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION 
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------
--  POPULATE COLLEGES
-- --------------------------------------

INSERT INTO `Colleges` VALUES(1,'MIT',11,'Cambridge','MA','USA');
INSERT INTO `Colleges` VALUES(2,'Brown',9,'Providence','RI','USA');
INSERT INTO `Colleges` VALUES(3,'Dartmouth',6,'Hanover','NH','USA');
INSERT INTO `Colleges` VALUES(4,'Stanford',17,'Stanford','CA','USA');
INSERT INTO `Colleges` VALUES(5,'Yale',12,'New Haven','CT','USA');
INSERT INTO `Colleges` VALUES(6,'Columbia',31,'New York','NY','USA');
INSERT INTO `Colleges` VALUES(7,'Harvard',23,'Cambridge','MA','USA');
INSERT INTO `Colleges` VALUES(8,'Princeton',9,'Princeton','NJ','USA');
INSERT INTO `Colleges` VALUES(9,'Johns Hopkins',24,'Baltimore','MD','USA');
INSERT INTO `Colleges` VALUES(10,'Northwestern',21,'Evanston','IL','USA');

INSERT INTO `Colleges` VALUES(11,'Duke',15,'Durham','NC','USA');
INSERT INTO `Colleges` VALUES(12,'Cornell',22,'Ithaca','NY','USA');
INSERT INTO `Colleges` VALUES(13,'Notre Dame',9,'Notre Dame','IN','USA');
INSERT INTO `Colleges` VALUES(14,'UCLA',32,'Los Angeles','CA','USA');
INSERT INTO `Colleges` VALUES(15,'Berkeley',42,'Berkeley','CA','USA');
INSERT INTO `Colleges` VALUES(16,'Georgetown',5,'Washington','DC','USA');
INSERT INTO `Colleges` VALUES(17,'Michigan',45,'Ann Arbor','MI','USA');
INSERT INTO `Colleges` VALUES(18,'USC',44,'Los Angeles','CA','USA');
INSERT INTO `Colleges` VALUES(19,'Tufts',11,'Medford','MA','USA');
INSERT INTO `Colleges` VALUES(20,'NYU',51,'New York','NY','USA');


-- --------------------------------------
--  POPULATE STUDENTS
-- --------------------------------------

INSERT INTO `Students` VALUES(1,1,10,'Nancy','Davolio','1948-12-08',23000,'nancy@gmail.com','(360) 234-8488','Seattle','WA','USA');
INSERT INTO `Students` VALUES(2,9,5,'Andrew','Fuller','1952-02-19',100000,'andrew@yahoo.com',NULL,'Dallas','TX','USA');
INSERT INTO `Students` VALUES(3,8,1,'Janet','Leverling','1963-08-30',56000,'janet@hotmail.com','(786) 634-4522','Miami','FL','USA');
INSERT INTO `Students` VALUES(4,3,9,'Margaret','Peacock','1937-09-19',78000,'maggie@outlook.com',NULL,'Phoenix','AZ','USA');
INSERT INTO `Students` VALUES(5,4,2,'Steven','Buchanan','1955-03-04',155000,'steve@apple.com',NULL,'Denver','CO','USA');
INSERT INTO `Students` VALUES(6,7,8,'Michael','Suyama','1963-07-02',90000,'mike@icloud.com','(541) 544-7733','Portland','OR','USA');
INSERT INTO `Students` VALUES(7,6,3,'Robert','King','1960-05-29',200000,'rob@gmail.com',NULL,'San Francisco','CA','USA');
INSERT INTO `Students` VALUES(8,5,7,'Laura','Callahan','1958-01-09',300000,'laura@gmail.com','(901) 425-8913','Memphis','TN','USA');
INSERT INTO `Students` VALUES(9,2,4,'Anne','Dodsworth','1966-01-27',76000,'anne@msn.com',NULL,'Portland','ME','USA');
INSERT INTO `Students` VALUES(10,1,6,'Ivy','Johnson','1986-01-20',89000,'ivy@gmail.com',NULL,'Chicago','IL','USA');

INSERT INTO `Students` VALUES(11,1,NULL,'Ana','Trujillo','1998-10-08',56000,'ana@gmail.com','(360) 457-2258','Seattle','WA','USA');
INSERT INTO `Students` VALUES(12,9,NULL,'Thomas','Hardy','1992-12-09',93000,'tom@yahoo.com',NULL,'Austin','TX','USA');
INSERT INTO `Students` VALUES(13,5,NULL,'Antonio','Moreno','1993-03-23',56000,'tony@hotmail.com',NULL,'Miami','FL','USA');
INSERT INTO `Students` VALUES(14,7,NULL,'Elizabeth','Brown','1997-01-11',100000,'beth@outlook.com','(480) 324-2178','Phoenix','AZ','USA');
INSERT INTO `Students` VALUES(15,3,NULL,'Ann','Devon','1995-04-24',150000,'ann@apple.com',NULL,'Denver','CO','USA');
INSERT INTO `Students` VALUES(16,2,NULL,'Ariel','Cruz','1993-02-12',200000,'ariel@icloud.com','(541) 652-4565','Portland','OR','USA');
INSERT INTO `Students` VALUES(17,6,NULL,'Giovanni','Rovelli','1990-09-19',34000,'gio@gmail.com','(415) 665-2255','San Francisco','CA','USA');
INSERT INTO `Students` VALUES(18,10,NULL,'Marie','Bertrand','1998-09-29',67000,'marie@gmail.com',NULL,'Memphis','TN','USA');
INSERT INTO `Students` VALUES(19,4,NULL,'Philip','Cramer','1996-07-17',71000,'phil@msn.com','(207) 4436-6524','Portland','ME','USA');
INSERT INTO `Students` VALUES(20,8,NULL,'Michael','Holz','1996-02-25',24000,'michael@gmail.com',NULL,'Chicago','IL','USA');


-- --------------------------------------
--  TABLE BOOKS - INPUT DATA
-- --------------------------------------

INSERT INTO `Books` VALUES(1,'Physics 101','1985-06-21');
INSERT INTO `Books` VALUES(2,'Math 101','1995-03-15');
INSERT INTO `Books` VALUES(3,'History 101','1974-05-29');
INSERT INTO `Books` VALUES(4,'Biology 101','1995-08-10');
INSERT INTO `Books` VALUES(5,'English 101','2011-09-21');
INSERT INTO `Books` VALUES(6,'Chemistry 101','2015-04-11');
INSERT INTO `Books` VALUES(7,'Spanish 101','2008-09-05');
INSERT INTO `Books` VALUES(8,'Engr 101','1993-11-23');
INSERT INTO `Books` VALUES(9,'Geo 101','1968-12-5');
INSERT INTO `Books` VALUES(10,'Biz 101','1979-01-20');

-- --------------------------------------
--  TABLE COLLEGEBOOKS - INPUT DATA
-- --------------------------------------

INSERT INTO `CollegeBooks` VALUES(1,1);
INSERT INTO `CollegeBooks` VALUES(1,2);
INSERT INTO `CollegeBooks` VALUES(1,3);
INSERT INTO `CollegeBooks` VALUES(4,4);
INSERT INTO `CollegeBooks` VALUES(5,5);
INSERT INTO `CollegeBooks` VALUES(6,6);
INSERT INTO `CollegeBooks` VALUES(7,7);
INSERT INTO `CollegeBooks` VALUES(7,8);
INSERT INTO `CollegeBooks` VALUES(7,9);
INSERT INTO `CollegeBooks` VALUES(1,10);
INSERT INTO `CollegeBooks` VALUES(2,10);
INSERT INTO `CollegeBooks` VALUES(3,10);