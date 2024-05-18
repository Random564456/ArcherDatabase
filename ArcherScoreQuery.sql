SELECT
    ArcherTable.FirstName,
    ArcherTable.LastName,
    ArcherTable.Age,
    ArcherTable.Gender,
    ScoreTable.EndNumber,
    ScoreTable.Distance,
    ScoreTable.TotalScore,
    CategoryTable.Class,
    CompetitionTable.CompetitionName,
    RoundTable.RoundName
FROM
    ScoreTable
        JOIN
    ArcherTable ON ScoreTable.ArcherID = ArcherTable.ArcherID
        JOIN
    CategoryTable ON ScoreTable.CategoryID = CategoryTable.CategoryID
        JOIN
    CompetitionTable ON CategoryTable.CompetitionID = CompetitionTable.CompetitionID
        JOIN
    RoundTable ON CategoryTable.RoundName = RoundTable.RoundName
ORDER BY
    ArcherTable.LastName, ArcherTable.FirstName, ScoreTable.ScoreID;

