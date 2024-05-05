-- Filters scores by date range and orders by date and score

SELECT 
  a.FirstName, 
  a.LastName, 
  c.startDate, 
  s.TotalScore, 
  c.CompetitionID
FROM 
  ArcherTable a
  JOIN ScoreTable s ON a.ArcherID = s.ArcherID
  JOIN CompetitionTable c ON s.CompetitionID = c.CompetitionID
WHERE 
  a.ArcherID = 1 -- Replace 1 with the ArcherID you are querying for
  AND c.startDate BETWEEN '2024-01-01' AND '2024-12-31' -- Replace with the date range you want to query
ORDER BY 
  c.startDate DESC, 
  s.TotalScore DESC;

--Query to Enter Scores
INSERT INTO CompetitionTable(startTime, startDate) VALUES (10:24, 2024-05-06);
INSERT INTO RoundTable(TargetDistance, ArrowAmount) VALUES (12.34, 3);
INSERT INTO Division(Recurve, Compound, RecurveBarebow, CompoundBarebow, Longbow) 
VALUES (1, 1, 1, 1, 1);

-- Query to Look up Competition Results
SELECT 
a.ArcherID, c.CompetitionID, a.FirstName, a.LastName, s.TotalScore  
FROM 
ArcherTable a
JOIN ScoreTable s ON a.ArcherID = s.ArcherID
JOIN CompetitionTable c ON s.CompetitionID = c.CompetitionID
ORDER BY
c.CompetitionID DESC;

-- Query to Lookup Round Definition
SELECT * FROM RoundTable;
