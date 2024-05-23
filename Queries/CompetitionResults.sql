USE ArcherDatabase;

SELECT
    c.CompetitionName,
    a.FirstName,
    a.LastName,
    ct.Class,
    s.TotalScore,
    s.Date
FROM
    CompetitionTable c
        JOIN
    CategoryTable ct ON c.CompetitionID = ct.CompetitionID
        JOIN
    ArcherTable a ON ct.ArcherID = a.ArcherID
        JOIN
    ScoreTable s ON ct.CategoryID = s.CategoryID
ORDER BY
    c.CompetitionName,
    s.TotalScore DESC;
