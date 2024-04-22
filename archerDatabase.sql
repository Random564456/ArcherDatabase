--This is a comment. Comment the first three lines if you can't create a database somehow.
DROP DATABASE IF EXISTS ArcherDatabase;
CREATE DATABASE ArcherDatabase;
USE ArcherDatabase;

DROP TABLE IF EXISTS ArrowTable;
DROP TABLE IF EXISTS RoundTable;
DROP TABLE IF EXISTS ScoreTable;
DROP TABLE IF EXISTS CompetitionTable;
DROP TABLE IF EXISTS DivisionTable;
DROP TABLE IF EXISTS ClubScorerTable;
DROP TABLE IF EXISTS ArcherTable;

CREATE TABLE ArcherTable(
	ArcherID INT NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	PhoneNumber VARCHAR(10),
	Street VARCHAR(50),
	Surburb VARCHAR(20),
	City VARCHAR(20),
	Postcode CHAR(4),
	Age SMALLINT(2),
	Gender VARCHAR(30),
	PRIMARY KEY(ArcherID)
);

CREATE TABLE ClubScorerTable(
	ClubScorerID INT NOT NULL,
	FirstName VARCHAR(20) NOT NULL,
	LastName VARCHAR(20) NOT NULL,
	PhoneNumber VARCHAR(10),
	Street VARCHAR(50),
	Surburb VARCHAR(20),
	City VARCHAR(20),
	Postcode CHAR(4),
	Age SMALLINT(2),
	Gender VARCHAR(30),
	PRIMARY KEY(ClubScorerID)
);

CREATE TABLE DivisionTable(
	DivisionID INT NOT NULL,
	Gender VARCHAR(30),
	Age SMALLINT(2),
	Recurve SMALLINT(1),
	Compound SMALLINT(1),
	RecurveBarebow SMALLINT(1),
	CompoundBarebow SMALLINT(1),
	Longbow SMALLINT(1),
	PRIMARY KEY(DivisionID)
);

CREATE TABLE CompetitionTable(
	CompetitionID INT NOT NULL,
	DivisionID INT,
	ArcherID INT,
	startDate DATE,
	startTime TIME,
	PRIMARY KEY(CompetitionID),
	FOREIGN KEY(DivisionID) REFERENCES DivisionTable(DivisionID),
	FOREIGN KEY(ArcherID) REFERENCES ArcherTable(ArcherID)
);

CREATE TABLE ScoreTable(
	ScoreID INT NOT NULL,
	ArcherID INT,
	CompetitionID INT,
	TotalScore INT,
	PRIMARY KEY(ScoreID),
	FOREIGN KEY(ArcherID) REFERENCES ArcherTable(ArcherID),
	FOREIGN KEY(CompetitionID) REFERENCES CompetitionTable(CompetitionID)
);

CREATE TABLE RoundTable(
	RoundID INT NOT NULL,
	CompetitionID INT,
	ScoreID INT,
	TargetDistance DOUBLE,
	ArrowAmount SMALLINT(3),
	PRIMARY KEY(RoundID),
	FOREIGN KEY(CompetitionID) REFERENCES CompetitionTable(CompetitionID),
	FOREIGN KEY(ScoreID) REFERENCES ScoreTable(ScoreID)
);

CREATE TABLE ArrowTable(
	ArrowID INT NOT NULL,
	ArcherID INT,
	RoundID INT,
	Arrow1 INT,
	Arrow2 INT,
	Arrow3 INT,
	Arrow4 INT,
	Arrow5 INT,
	Arrow6 INT,
	PRIMARY KEY(ArrowID),
	FOREIGN KEY(ArcherID) REFERENCES ArcherTable(ArcherID),
	FOREIGN KEY(RoundID) REFERENCES RoundTable(RoundID)
);