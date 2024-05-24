USE ArcherDatabase;

SELECT
    ArcherID,
    RoundName,
    MAX(TotalScore) AS PersonalBestScore
FROM
    ScoreTable,
    RoundTable
GROUP BY
    ArcherID, RoundName;
