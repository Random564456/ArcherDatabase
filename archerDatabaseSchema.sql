-- C233 ARCHERDATABASE CONFIG FILE

DROP DATABASE IF EXISTS ArcherDatabase;
CREATE DATABASE ArcherDatabase;
USE ArcherDatabase;

DROP TABLE IF EXISTS ArrowTable;
DROP TABLE IF EXISTS CategoryTable;
DROP TABLE IF EXISTS RoundTable;
DROP TABLE IF EXISTS CompetitionTable;
DROP TABLE IF EXISTS ScoreTable;
DROP TABLE IF EXISTS TargetSizeTable;
DROP TABLE IF EXISTS EquipmentTable;
DROP TABLE IF EXISTS CategoryEquipmentTable;
DROP TABLE IF EXISTS EndScoreTable;
DROP TABLE IF EXISTS StagingTable;

-- TABLES
CREATE TABLE ArcherTable(
	ArcherID INT NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	Age INT,
	Gender ENUM('M', 'F'),
	PRIMARY KEY(ArcherID)
);

CREATE TABLE RoundTable(
	RoundName VARCHAR(255) NOT NULL,
    ArrowsAtDistance10m CHAR(10) DEFAULT '0',
    ArrowsAtDistance20m CHAR(10) DEFAULT '0',
    ArrowsAtDistance30m CHAR(10) DEFAULT '0',
    ArrowsAtDistance40m CHAR(10) DEFAULT '0',
    ArrowsAtDistance50m CHAR(10) DEFAULT '0',
    ArrowsAtDistance60m CHAR(10) DEFAULT '0',
    ArrowsAtDistance70m CHAR(10) DEFAULT '0',
    ArrowsAtDistance80m CHAR(10) DEFAULT '0',
    ArrowsAtDistance90m CHAR(10) DEFAULT '0',
    PRIMARY KEY (RoundName)
);

CREATE TABLE CompetitionTable(
	CompetitionID INT NOT NULL,
	CompetitionName VARCHAR(255),
    Championship VARCHAR(255) DEFAULT NULL,    
	PRIMARY KEY(CompetitionID)
);

CREATE TABLE TargetSizeTable(
	Target CHAR(1),
    FaceSize VARCHAR(255),
    PRIMARY KEY (Target)
);

CREATE TABLE CategoryTable(
	CategoryID INT NOT NULL,
    ArcherID INT NOT NULL,
    CompetitionID INT NOT NULL,
    RoundName VARCHAR(255) NOT NULL,
    Class VARCHAR(255) NOT NULL,
	PRIMARY KEY(CategoryID),
    FOREIGN KEY(ArcherID) REFERENCES ArcherTable(ArcherID),
    FOREIGN KEY(CompetitionID) REFERENCES CompetitionTable(CompetitionID),
    FOREIGN KEY(RoundName) REFERENCES RoundTable(RoundName)
);

CREATE TABLE ScoreTable(
    ScoreID INT NOT NULL AUTO_INCREMENT,
    CategoryID INT NOT NULL,
    ArcherID INT NOT NULL,
    EndNumber ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12') NULL,
    Distance ENUM('20m', '30m', '40m', '50m', '60m', '70m', '90m') NULL,
    Date DATE NOT NULL,
    TotalScore INT NOT NULL,
    PRIMARY KEY(ScoreID),
    FOREIGN KEY(CategoryID) REFERENCES CategoryTable(CategoryID),
    FOREIGN KEY(ArcherID) REFERENCES ArcherTable(ArcherID)
);

CREATE TABLE EndScoreTable(
    EndID INT NOT NULL AUTO_INCREMENT,
    ScoreID INT NOT NULL,
    Arrow1 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow2 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow3 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow4 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow5 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow6 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    PRIMARY KEY(EndID),
    FOREIGN KEY(ScoreID) REFERENCES ScoreTable(ScoreID)
);

CREATE TABLE EquipmentTable
(
	Equipment VARCHAR(5) NOT NULL,
    EquipmentName VARCHAR(255) NOT NULL,
    PRIMARY KEY (Equipment)
);

CREATE TABLE CategoryEquipmentTable(
	RoundName VARCHAR(255) NOT NULL,
    Category VARCHAR(255) NOT NULL,
    DefaultEquipment VARCHAR(255) NOT NULL,
    FOREIGN KEY (RoundName) REFERENCES RoundTable(RoundName)
);

DROP TABLE IF EXISTS StagingTable;

CREATE TABLE StagingTable (
    StagingID INT NOT NULL AUTO_INCREMENT,
    ArcherID INT NOT NULL,
    CategoryID INT NOT NULL,
    Date DATE NOT NULL,
    RoundName VARCHAR(255) NOT NULL,
    Equipment VARCHAR(5) NOT NULL,
    EndNumber ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'),
    Distance ENUM('20m', '30m', '40m', '50m', '60m', '70m', '90m'),
    Arrow1 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow2 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow3 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow4 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow5 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    Arrow6 ENUM('1', '2', '3', '4', '5', '6', '7', '8', '9', '10') NOT NULL,
    PRIMARY KEY (StagingID),
    FOREIGN KEY (ArcherID) REFERENCES ArcherTable(ArcherID),
    FOREIGN KEY (CategoryID) REFERENCES CategoryTable(CategoryID),
    FOREIGN KEY (RoundName) REFERENCES RoundTable(RoundName),
    FOREIGN KEY (Equipment) REFERENCES EquipmentTable(Equipment)
);