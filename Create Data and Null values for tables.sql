-- Inserting data into ArcherTable
INSERT INTO ArcherTable (ArcherID, FirstName, LastName, PhoneNumber, Street, Suburb, City, Postcode, Age, Gender)
VALUES
(1, 'Jane', 'Doe', '1234567890', '123 Archery Lane', 'Bowtown', 'Targetville', '1234', 28, 'Female'),
(2, 'John', 'Smith', NULL, '456 Quiver Street', 'Arrowood', 'Bullseye City', '5678', NULL, 'Male');

-- Inserting data into ClubScorerTable
INSERT INTO ClubScorerTable (ClubScorerID, FirstName, LastName, PhoneNumber, Street, Suburb, City, Postcode, Age, Gender)
VALUES
(1, 'Alice', 'Johnson', '0987654321', '789 Bowstring Ave', 'Arrowood', 'Bullseye City', '9101', 35, 'Female'),
(2, 'Bob', 'Williams', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Inserting data into DivisionTable
INSERT INTO DivisionTable (DivisionID, Gender, Age, Recurve, Compound, RecurveBarebow, CompoundBarebow, Longbow)
VALUES
(1, 'Male', NULL, 1, 0, 0, 0, 0),
(2, 'Female', NULL, 0, 1, 0, 0, 0);

-- Inserting data into CompetitionTable
INSERT INTO CompetitionTable (CompetitionID, DivisionID, ArcherID, startDate, startTime)
VALUES
(1, 1, 1, '2024-04-29', '08:00:00'),
(2, 2, 2, '2024-04-30', NULL);

-- Inserting data into ScoreTable
INSERT INTO ScoreTable (ScoreID, ArcherID, CompetitionID, TotalScore)
VALUES
(1, 1, 1, 250),
(2, 2, 2, NULL);

-- Inserting data into RoundTable
INSERT INTO RoundTable (RoundID, CompetitionID, ScoreID, TargetDistance, ArrowAmount)
VALUES
(1, 1, 1, 50, 6),
(2, 2, 2, 70, NULL);

-- Inserting data into ArrowTable
INSERT INTO ArrowTable (ArrowID, ArcherID, RoundID, Arrow1, Arrow2, Arrow3, Arrow4, Arrow5, Arrow6)
VALUES
(1, 1, 1, 9, 7, 5, 10, 8, NULL),
(2, 2, 2, 8, 9, NULL, NULL, 6, 5);
