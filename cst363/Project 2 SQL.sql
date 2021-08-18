

-- ******************** PREPARED BY ****************
-- Javier Gonzalez and Bablu Banik
-- Team 8 also known as Los Angeles Valley Tech (LAVT)
-- Module Three
-- Date : 02/ 02 / 2021
-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



--  ****************** START OF SCHEMA ****************************
-- create the database
DROP DATABASE IF EXISTS moduleThree;
CREATE DATABASE moduleThree;

-- select the database
USE moduleThree;


CREATE TABLE `Patients` (
    `patientID` INT NOT NULL,
    `SSN` VARCHAR(11) NOT NULL,
    `Fname` VARCHAR(50) NOT NULL,
    `Lname` VARCHAR(50) NOT NULL,
    `age` DATE NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `State` VARCHAR(50) NOT NULL,
    `zipCode` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`patientID`)
);


CREATE TABLE `DoctorsInfo` (
    `DoctorID` INT NOT NULL,
    `SSN` VARCHAR(11) NOT NULL,
    `Fname` VARCHAR(50) NOT NULL,
    `Lname` VARCHAR(50) NOT NULL,
    `specialty` VARCHAR(50) NOT NULL,
    `ExperienceStartDate` DATE NOT NULL,
    PRIMARY KEY (`DoctorID`)
);



CREATE TABLE `PharmaceuticalCompany` (
    `Name` VARCHAR(50) NOT NULL,
    `phoneNumber` VARCHAR(50) NOT NULL,
    `pharmID` INT NOT NULL,
    PRIMARY KEY (`pharmID`)
);

CREATE TABLE `Drugs` (
    `drugID` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `formula` VARCHAR(50) NOT NULL,
    `pharmID` INT NOT NULL,
    PRIMARY KEY (`drugID`),
    FOREIGN KEY (pharmID)
        REFERENCES PharmaceuticalCompany (pharmID)
);

CREATE TABLE `Pharmacy` (
    `PharmacyID` INT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `address` VARCHAR(50) NOT NULL,
    `city` VARCHAR(50) NOT NULL,
    `State` VARCHAR(50) NOT NULL,
    `zipCode` VARCHAR(50) NOT NULL,
    `phoneNumber` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`PharmacyID`)
);

CREATE TABLE `PrimaryDoctor` (
    `PrimaryDoctorID` INT NOT NULL,
    `DoctorID` INT NOT NULL,
    `patientID` INT NOT NULL,
    PRIMARY KEY (`PrimaryDoctorID`),
    FOREIGN KEY (DoctorID)
        REFERENCES DoctorsInfo (DoctorID),
    FOREIGN KEY (patientID)
        REFERENCES Patients (patientID)
);



CREATE TABLE `Price` (
    `drugID` INT NOT NULL,
    `PharmacyID` INT NOT NULL,
    `priceAmount` NUMERIC(7 , 2 ) CHECK (`priceAmount` > 0),
    FOREIGN KEY (drugID)
        REFERENCES Drugs (drugID),
    FOREIGN KEY (PharmacyID)
        REFERENCES Pharmacy (PharmacyID)
);

CREATE TABLE `Prescription` (
    `prescriptionID` int primary key auto_increment,
    `DoctorID` INT NOT NULL,
    `patientID` INT NOT NULL,
    `OrderDate` DATE NOT NULL,
    `PharmacyID` INT NULL,
    `drugID` INT NOT NULL,
    `quantity` INT CHECK (`quantity` > 0),
    `orderFilled` INT DEFAULT 0 CHECK (`orderFilled` = 0 OR `orderFilled` = 1),
    `DateOrderFilled` DATE NULL,
    -- PRIMARY KEY (`prescriptionID`),
    FOREIGN KEY (DoctorID)
        REFERENCES DoctorsInfo (DoctorID),
    FOREIGN KEY (patientID)
        REFERENCES Patients (patientID),
    FOREIGN KEY (drugID)
        REFERENCES Drugs (drugID),
    FOREIGN KEY (PharmacyID)
        REFERENCES Pharmacy (PharmacyID)
) AUTO_INCREMENT= 21546489;

CREATE TABLE `Supervisors` (
    `supervisorID` INT NOT NULL,
    `Fname` VARCHAR(50) NOT NULL,
    `Lname` VARCHAR(50) NOT NULL,
    `employmentStartDate` DATE NOT NULL,
    `employmentEndDate` DATE NULL,
    `Active` INT DEFAULT 0 CHECK (`Active` = 0 OR `Active` = 1),
    PRIMARY KEY (`supervisorID`)
);

CREATE TABLE `Contracts` (
    `contractID` INT NOT NULL,
    `pharmID` INT NOT NULL,
    `PharmacyID` INT NULL,
    `StartDate` DATE NOT NULL,
    `EndDate` DATE NOT NULL,
    `conractText` VARCHAR(500) NOT NULL,
    `supervisorID` INT NOT NULL,
    PRIMARY KEY (`contractID`),
    FOREIGN KEY (pharmID)
        REFERENCES PharmaceuticalCompany (pharmID),
    FOREIGN KEY (supervisorID)
        REFERENCES Supervisors (supervisorID)
);




-- Patients

INSERT INTO Patients VALUES ('1','101-25-1151','Karley','Mercer','2001-09-03','1170 Berkshire Street','Fresno','ID','51170');
INSERT INTO Patients VALUES ('2','101-25-2170','Shannon','Barrera','1978-03-24','2171 Washington Street ','Van Nuys','RI','52171');
INSERT INTO Patients VALUES ('3','101-25-3170','Isabell','Howell','1976-01-04','3170 Washington Circle Oceanside','Clovies','MI','53170');
INSERT INTO Patients VALUES ('4','101-25-4171','Landon','Stewart','1977-01-24','4171 West Street ','Santa Monica','GA','54171');
INSERT INTO Patients VALUES ('5','101-25-5171','Sammy','Graham','1987-11-08','5171 Arlington Ave','Fresno','MA','55172');
INSERT INTO Patients VALUES ('6','101-25-6171','Shyla','Wolf','1952-02-02','6171 Washington Street ','Fresno','TX','56172');
INSERT INTO Patients VALUES ('7','101-25-7171','Odin','Horne','2009-09-08','7171 Iroquois St. ','Clovies','AL','57172');
INSERT INTO Patients VALUES ('8','101-25-8171','Elliana','Ferguson','1945-04-01','8171 Ashland St','Van Nuys','DE','58172');
INSERT INTO Patients VALUES ('9','101-25-9171','Alison','Blankenship','1948-08-10','9171 Edgemont Street ','Santa Monica','CA','59171');
INSERT INTO Patients VALUES ('10','101-26-0172','Imani','Cruz','1986-09-26','0172 Windsor Avenue ','Los Angeles','LA','60172');





-- DoctorsInfo

INSERT INTO DoctorsInfo VALUES ('1','101-67-4002','Aidyn','Castillo','ALLERGY & IMMUNOLOGY','1956-08-08');
INSERT INTO DoctorsInfo VALUES ('2','101-67-5021','Jesus','Collins','DERMATOLOGY','1994-07-04');
INSERT INTO DoctorsInfo VALUES ('3','101-67-6021','Heaven','Hancock','DIAGNOSTIC RADIOLOGY','1999-05-20');
INSERT INTO DoctorsInfo VALUES ('4','101-67-7021','Manuel','Barajas','EMERGENCY MEDICINE','1984-06-19');
INSERT INTO DoctorsInfo VALUES ('5','101-67-8021','Rylee','Chapman','MEDICAL GENETICS','1940-11-09');
INSERT INTO DoctorsInfo VALUES ('6','101-67-9020','Ty','Jefferson','OBSTETRICS AND GYNECOLOGY','1985-10-17');
INSERT INTO DoctorsInfo VALUES ('7','101-68-0020','Brycen','Bridges','OBSTETRICS AND GYNECOLOGY','1961-05-15');
INSERT INTO DoctorsInfo VALUES ('8','101-68-1021','Asa','Duffy','OPHTHALMOLOGY','1960-12-22');
INSERT INTO DoctorsInfo VALUES ('9','101-68-2020','Kolton','Ramirez','PEDIATRICS','1958-08-25');
INSERT INTO DoctorsInfo VALUES ('10','101-68-3020','Brielle','Davis','PSYCHIATRY','2001-12-17');




-- pharmaceuticalCompany

INSERT INTO pharmaceuticalCompany VALUES ('North Hollywood PharmCompany','9102532380','1');
INSERT INTO pharmaceuticalCompany VALUES ('Van Nuys PharmCompany','9102533397','2');
INSERT INTO pharmaceuticalCompany VALUES ('West Hollywood PharmCompany','9102534396','3');
INSERT INTO pharmaceuticalCompany VALUES ('Fresno PharmCompany','9102535395','4');
INSERT INTO pharmaceuticalCompany VALUES ('KTown PharmCompany','9102536395','5');
INSERT INTO pharmaceuticalCompany VALUES ('East Hollywood PharmCompany','9102537395','6');
INSERT INTO pharmaceuticalCompany VALUES ('South Hollywood PharmCompany','9102538394','7');
INSERT INTO pharmaceuticalCompany VALUES ('Modesto PharmCompany','9102539393','8');
INSERT INTO pharmaceuticalCompany VALUES ('Lorton PharmCompany','9102540392','9');
INSERT INTO pharmaceuticalCompany VALUES ('Los Angeles PharmCompany','9102541391','10');




-- Drugs

INSERT INTO Drugs VALUES ('1','Eileen Sideways','adhesive system','5');
INSERT INTO Drugs VALUES ('2','Esther Gin','baclofen','5');
INSERT INTO Drugs VALUES ('3','Fibonaci Sequins','cabergoline Tablet','3');
INSERT INTO Drugs VALUES ('4','Gina Lotrimin','calcipotriene','9');
INSERT INTO Drugs VALUES ('5','Hedda Lettuce','nadolol','5');
INSERT INTO Drugs VALUES ('6','Heidi Haux','nandrolone','6');
INSERT INTO Drugs VALUES ('7','Helena Handbasket','necitumumab','7');
INSERT INTO Drugs VALUES ('8','Ida Slapter','needle','8');
INSERT INTO Drugs VALUES ('9','Ivy Profen','niacin','9');
INSERT INTO Drugs VALUES ('10','Izzy Uncut','nifurtimox','6');

-- pharmacy

INSERT INTO pharmacy VALUES ('1','Brennen Pharmacy','2541 Woodsman Ave.','Clovies','MA','12565','9106712565');
INSERT INTO pharmacy VALUES ('2','Char Pharmacy','3565 West Newcastle Ave.','North Hollywood','MI','13565','9106713565');
INSERT INTO pharmacy VALUES ('3','Noemi Pharmacy','4565 Chestnut St. ','Clovies','CO','14565','9106714565');
INSERT INTO pharmacy VALUES ('4','Zackary Pharmacy','5565 Lankershim Ave','Los Angeles','SD','15565','9106715565');
INSERT INTO pharmacy VALUES ('5','Laney Pharmacy','6565 Maple Avenue','Fresno','NY','16565','9106716565');
INSERT INTO pharmacy VALUES ('6','Esperanza Pharmacy','7565 Lankershim Ave','Santa Monica','AZ','17565','9106717565');
INSERT INTO pharmacy VALUES ('7','Troy Pharmacy','8565 Chestnut St. ','Clovies','DE','18565','9106718566');
INSERT INTO pharmacy VALUES ('8','Regan Pharmacy','9565 Mechanic Lane','Fresno','AR','19565','9106719565');
INSERT INTO pharmacy VALUES ('9','Keegan Pharmacy','0565 Virginia Ave.','Santa Monica','MA','20565','9106720565');
INSERT INTO pharmacy VALUES ('10','Charles Pharmacy','1565 Greystone Avenue','Santa Monica','SD','21565','9106721565');


-- PrimaryDoctor

INSERT INTO PrimaryDoctor VALUES ('1','5','1');
INSERT INTO PrimaryDoctor VALUES ('2','6','2');
INSERT INTO PrimaryDoctor VALUES ('3','5','3');
INSERT INTO PrimaryDoctor VALUES ('4','6','4');
INSERT INTO PrimaryDoctor VALUES ('5','5','5');
INSERT INTO PrimaryDoctor VALUES ('6','5','6');
INSERT INTO PrimaryDoctor VALUES ('7','5','7');
INSERT INTO PrimaryDoctor VALUES ('8','6','8');
INSERT INTO PrimaryDoctor VALUES ('9','6','9');
INSERT INTO PrimaryDoctor VALUES ('10','6','10');


-- Price

INSERT INTO Price VALUES ('1','5','15.26');
INSERT INTO Price VALUES ('2','6','524.31');
INSERT INTO Price VALUES ('3','7','26.12');
INSERT INTO Price VALUES ('5','2','256.23');
INSERT INTO Price VALUES ('6','3','15.26');
INSERT INTO Price VALUES ('7','4','524.31');
INSERT INTO Price VALUES ('1','1','26.12');
INSERT INTO Price VALUES ('2','5','524.31');
INSERT INTO Price VALUES ('3','3','256.23');
INSERT INTO Price VALUES ('4','4','15.26');
INSERT INTO Price VALUES ('5','7','524.31');
INSERT INTO Price VALUES ('5','5','524.31');
INSERT INTO Price VALUES ('6','8','26.12');
INSERT INTO Price VALUES ('8','10','256.23');
INSERT INTO Price VALUES ('10','8','256.23');


-- prescription



INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (5,7,'1956-08-08',9,4,2,1,'1956-08-08');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (6,8,'1994-07-04',10,5,9,1,'1994-07-04');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (7,9,'1999-05-20',1,6,3,1,'1999-05-20');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (4,10,'1984-06-19',4,7,9,1,'1984-06-19');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (5,4,'1940-11-09',5,8,15,1,'1940-11-09');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (6,5,'1985-10-17',6,1,26,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (7,6,'1961-05-15',7,2,56,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (8,8,'1960-12-22',4,7,2,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (9,9,'1958-08-25',5,8,2,1,'1958-08-25');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (10,10,'2001-12-17',6,9,1,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (5,3,'2021-01-28',5,8,5,1,'2021-01-29');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (5,3,'2021-01-28',5,8,2,1,'2021-01-29');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',NULL,1,4,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',NULL,1,4,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',NULL,1,4,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',NULL,1,3,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',NULL,1,3,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',NULL,1,2,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (5,3,'2021-01-29',10,8,2,1,'2021-01-29');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',NULL,1,2,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',3,1,2,1,'2021-01-29');
INSERT INTO prescription  (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',1,1,2,1,'2021-01-29');
INSERT INTO prescription  (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (2,10,'2021-01-29',NULL,1,2,0,NULL);
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (5,3,'2021-01-30',5,1,7,1,'2021-01-30');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (5,3,'2021-01-30',5,2,12,1,'2021-01-30');
INSERT INTO prescription (DoctorID, patientID, OrderDate, PharmacyID, drugID, quantity, orderFilled, DateOrderFilled) VALUES (5,3,'2021-01-30',5,5,6,1,'2021-01-30');

INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,7,'1956-08-08',9,4,2,1,'1956-08-08');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (6,8,'1994-07-04',10,5,9,1,'1994-07-04');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (7,9,'1999-05-20',1,6,3,1,'1999-05-20');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (4,10,'1984-06-19',4,7,9,1,'1984-06-19');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,4,'1940-11-09',5,8,15,1,'1940-11-09');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (6,5,'1985-10-17',1,1,26,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (7,6,'1961-05-15',7,2,56,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (8,8,'1960-12-22',4,7,2,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (9,9,'1958-08-25',5,8,2,1,'1958-08-25');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (10,10,'2001-12-17',6,9,1,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,3,'2021-01-28',5,8,5,1,'2021-01-29');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,3,'2021-01-28',5,8,2,1,'2021-01-29');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',NULL,1,4,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',NULL,1,4,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',NULL,1,4,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',NULL,1,3,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',NULL,1,3,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',NULL,1,2,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,3,'2021-01-29',10,8,2,1,'2021-01-29');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',1,1,2,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',3,1,2,1,'2021-01-29');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',1,1,2,1,'2021-01-29');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,10,'2021-01-29',NULL,1,2,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,3,'2021-01-30',5,1,7,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,3,'2021-01-30',5,2,12,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,3,'2021-01-30',5,5,6,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,3,'2021-01-30',10,8,3,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,5,'2021-01-30',NULL,10,1,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,5,'2021-01-30',8,10,1,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (3,4,'2021-01-30',7,3,5,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (2,1,'2021-01-30',NULL,6,1,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (1,1,'2021-01-30',4,7,1,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (7,6,'2021-01-30',4,4,8,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (4,7,'2021-01-30',8,6,45,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (1,9,'2021-01-30',NULL,1,34,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (6,8,'2021-01-30',6,2,100,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (5,5,'2021-01-30',7,3,11,1,'2021-01-30');
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (9,4,'2021-01-30',NULL,9,200,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (1,6,'2021-01-31',NULL,1,1,0,NULL);
INSERT INTO `prescription` (`DoctorID`,`patientID`,`OrderDate`,`PharmacyID`,`drugID`,`quantity`,`orderFilled`,`DateOrderFilled`) VALUES (1,1,'2021-01-31',NULL,1,1,0,NULL);

-- supervisors

INSERT INTO supervisors VALUES ('1','Devin','Lam','1956-08-08',NULL,'1');
INSERT INTO supervisors VALUES ('2','Brycen','Mccann','1994-07-04',NULL,'1');
INSERT INTO supervisors VALUES ('3','Trent','Mccormick','1999-05-20','2003-05-20','0');
INSERT INTO supervisors VALUES ('4','Hugo','Pratt','1984-06-19','1999-05-20','0');
INSERT INTO supervisors VALUES ('5','Helena','Cortez','1940-11-09',NULL,'1');
INSERT INTO supervisors VALUES ('6','Kamila','Donovan','1985-10-17','1999-05-20','0');
INSERT INTO supervisors VALUES ('7','Julien','Rojas','1961-05-15',NULL,'1');
INSERT INTO supervisors VALUES ('8','Cecelia','Larsen','1960-12-22',NULL,'1');
INSERT INTO supervisors VALUES ('9','Neveah','Zhang','1958-08-25',NULL,'1');
INSERT INTO supervisors VALUES ('10','Ethan','Lucas','2001-12-17',NULL,'1');



-- Contracts

INSERT INTO Contracts VALUES ('1','1','1','1956-08-08','2025-08-08','some text','5');
INSERT INTO Contracts VALUES ('2','1','2','1994-07-04','2025-08-08','some text','6');
INSERT INTO Contracts VALUES ('3','1','3','1999-05-20','2025-08-08','some text','9');
INSERT INTO Contracts VALUES ('4','1','4','1984-06-19','2025-08-08','some text','5');
INSERT INTO Contracts VALUES ('5','1','5','1940-11-09','2025-08-08','some text','9');
INSERT INTO Contracts VALUES ('6','1','6','1985-10-17','2025-08-08','some text','5');
INSERT INTO Contracts VALUES ('7','1','7','1961-05-15','2025-08-08','some text','9');
INSERT INTO Contracts VALUES ('8','1','8','1960-12-22','2025-08-08','some text','4');
INSERT INTO Contracts VALUES ('9','1','9','1958-08-25','2025-08-08','some text','1');
INSERT INTO Contracts VALUES ('10','1','10','2001-12-17','2025-08-08','some text','2');
INSERT INTO Contracts VALUES ('11','2','1','1985-10-17','2025-08-08','some text','5');
INSERT INTO Contracts VALUES ('12','2','2','1961-05-15','2025-08-08','some text','9');
INSERT INTO Contracts VALUES ('13','3','3','1960-12-22','2025-08-08','some text','10');
INSERT INTO Contracts VALUES ('14','4','9','1985-10-17','2025-08-08','some text','1');


--  ****************** END OF SCHEMA ****************************

-- 1. How can I compare drug prices among pharmacies?

SELECT 
    d.name AS dragName, p.priceAmount, ph.name AS pharmacyName
FROM
    pharmacy ph
        JOIN
    price p ON ph.PharmacyID = p.PharmacyID
        JOIN
    drugs d ON p.drugID = d.drugID
GROUP BY ph.PharmacyID
ORDER BY d.name;


--  2.  What is the total number of patients for doctors with patients?
SELECT 
    d.Fname, d.Lname, COUNT(p.patientID) AS numberOfPatients
FROM
    DoctorsInfo d
        JOIN
    PrimaryDoctor pd ON d.DoctorID = pd.DoctorID
        JOIN
    Patients p ON p.patientID = pd.patientID
GROUP BY d.DoctorID, d.Fname;

-- 3. How many Pharmaceutical Companies have at least 2 contracts? 

SELECT 
    p.pharmID, p.Name, COUNT(*) AS NumberOfContracts
FROM
    PharmaceuticalCompany p
        JOIN
    Contracts c ON c.pharmID = p.pharmID
GROUP BY p.pharmID , p.Name
HAVING NumberOfContracts >= 2;

-- 4 Which drugs are priced above the average price for all drugs sold?

SELECT 
    d.drugID,
    d.name AS DrugName,
    ph.name AS PharmacyName,
    priceAmount
FROM
    Drugs d
        JOIN
    Price p ON p.drugID = d.drugID
        JOIN
    Pharmacy ph ON ph.PharmacyID = p.PharmacyID
WHERE
    priceAmount > (SELECT 
            AVG(priceAmount)
        FROM
            Price)
ORDER BY d.drugID;


-- 5. How many drugs does each Pharmaceutical Company sell?

SELECT 
    p.pharmID, p.Name, COUNT(d.pharmID) AS DrugsSold
FROM
    PharmaceuticalCompany p
        JOIN
    Drugs d ON d.pharmID = p.pharmID
GROUP BY p.pharmID , p.Name
ORDER BY DrugsSold DESC;


--  ****************** END OF FIVE QUERIES **************************** 