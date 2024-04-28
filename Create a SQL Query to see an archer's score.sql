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
