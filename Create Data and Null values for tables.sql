
INSERT INTO ArcherTable (ArcherID, FirstName, LastName, PhoneNumber, Street, Surburb, City, Postcode, Age, Gender)
VALUES
(1, 'Jane', 'Doe', '1234567890', '123 Archery Lane', 'Bowtown', 'Targetville', '1234', 28, 'Female'),
(2, 'John', 'Smith', NULL, '456 Quiver Street', 'Arrowood', 'Bullseye City', '5678', NULL, 'Male'),
(3, 'Alice', 'Johnson', '0987654321', '789 Bowstring Ave', 'Arrowood', 'Bullseye City', '9101', 35, 'Female'),
(4, 'Bob', 'Williams', NULL, '8 Holivern Rd', 'brisel', 'Chicargo', '2312', NULL, 'Male'),
(5, 'Charlie', 'Brown', '5555555555', '123 Elm Street', 'Oakville', 'Maple City', '6789', 42, 'Male');

-- Inserting data into ClubScorerTable
INSERT INTO ClubScorerTable (ClubScorerID, FirstName, LastName, PhoneNumber, Street, Surburb, City, Postcode, Age, Gender)
VALUES
(1, 'Alice', 'Johnson', '0987654321', '789 Bowstring Ave', 'Arrowood', 'Bullseye City', '9101', 35, 'Female'),
(2, 'Bob', 'Williams', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO DivisionTable (DivisionID, Gender, Age, Recurve, Compound, RecurveBarebow, CompoundBarebow, Longbow)
VALUES
(1, 'Female', NULL, 1, 1, 0, 0, 0), -- Female Open
(2, 'Male', NULL, 1, 1, 1, 1, 1), -- Male Open
(3, 'Female', 50, 1, 0, 0, 1, 0), -- Female 50+
(4, 'Male', 50, 1, 0, 0, 0, 1), -- Male 50+
(5, 'Female', 60, 0, 0, 0, 1, 1), -- Female 60+
(6, 'Male', 60, 0, 0, 0, 0, 1), -- Male 60+
(7, 'Female', 70, 1, 0, 0, 1, 1), -- Female 70+
(8, 'Male', 70, 1, 0, 1, 0, 0), -- Male 70+
(9, 'Female', 21, 0, 0, 0, 1, 1), -- Under 21 Female
(10, 'Male', 21, 0, 1, 0, 1, 1), -- Under 21 Male
(11, 'Female', 18, 0, 1, 1, 0, 0), -- Under 18 Female
(12, 'Male', 18, 1, 0, 0, 0, 1), -- Under 18 Male
(13, 'Female', 16, 0, 0, 0, 0, 1), -- Under 16 Female
(14, 'Male', 16, 1, 0, 0, 0, 1), -- Under 16 Male
(15, 'Female', 14, 0, 1, 0, 1, 1), -- Under 14 Female
(16, 'Male', 14, 0, 0, 0, 1, 1); -- Under 14 Male

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
