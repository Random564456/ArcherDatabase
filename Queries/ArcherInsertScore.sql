INSERT INTO StagingTable (ArcherID, CategoryID, Date, RoundName, Equipment, EndNumber, Distance, Arrow1, Arrow2, Arrow3, Arrow4, Arrow5, Arrow6)
VALUES
    (1, 1, '2024-05-18', 'Long Sydney', 'R', '1', '30m', '5', '6', '7', '8', '9', '10'),
    (2, 2, '2024-05-18', 'Long Sydney', 'R', '1', '50m', '6', '7', '8', '9', '10', '1');


INSERT INTO ScoreTable (CategoryID, ArcherID, EndNumber, Distance, Date, TotalScore)
SELECT
    (SELECT CategoryID FROM CategoryTable WHERE ArcherID = StagingTable.ArcherID AND RoundName = StagingTable.RoundName LIMIT 1) AS CategoryID,
    ArcherID,
    EndNumber,
    Distance,
    Date,
    0 AS TotalScore
FROM
    StagingTable;


UPDATE ScoreTable
    JOIN (
        SELECT
            StagingTable.ArcherID,
            StagingTable.EndNumber,
            StagingTable.Distance,
            SUM(
                    CAST(Arrow1 AS UNSIGNED) +
                    CAST(Arrow2 AS UNSIGNED) +
                    CAST(Arrow3 AS UNSIGNED) +
                    CAST(Arrow4 AS UNSIGNED) +
                    CAST(Arrow5 AS UNSIGNED) +
                    CAST(Arrow6 AS UNSIGNED)
            ) AS CalculatedTotalScore
        FROM StagingTable
        GROUP BY ArcherID, EndNumber, Distance
    ) AS SubQuery ON ScoreTable.ArcherID = SubQuery.ArcherID AND ScoreTable.EndNumber = SubQuery.EndNumber AND ScoreTable.Distance = SubQuery.Distance
SET ScoreTable.TotalScore = SubQuery.CalculatedTotalScore;

