-- Comman Table Expression for identify and tag duplicate record

SELECT * FROM marketing_buisness_case.`dbo.customer_journey`;

WITH DuplicateRecords AS (
    SELECT 
        JourneyID,
        CustomerID, 
        ProductID,
        VisitDate,
        Stage,
        Action,
        Duration,
        ROW_NUMBER() OVER (
           PARTITION BY CustomerID, ProductID, VisitDate, Stage, Action
        ORDER BY JourneyID) AS row_num
     FROM marketing_buisness_case.`dbo.customer_journey`   
)
-- Select all records from cte where row_number > 1, which indices duplicate 
SELECT * FROM DuplicateRecords
-- WHERE row_num > 1 
ORDER BY JourneyID;

-- Outer query selects the final cleaned and standardized data
-- First, calculate the average duration for each group
SELECT 
        JourneyID,
        CustomerID, 
        ProductID,
        VisitDate,
        Stage,
        Action,
        coalesce(Duration, avg_duration) AS Duration
FROM 
   (
      -- Subquery to process and clean the data
      SELECT
        JourneyID,
        CustomerID, 
        ProductID,
        VisitDate,
        UPPER(Stage) AS Stage,
        Action,
        Duration,
	    AVG(Duration) OVER (partition by VisitDate) AS avg_duration,
        row_number() OVER(
          partition by CustomerID, ProductID, VisitDate, upper(Stage), Action
          ORDER BY JourneyID
        ) AS row_num
        FROM 
        marketing_buisness_case.`dbo.customer_journey`) AS subquery 
WHERE 
row_num = 1
ORDER BY JourneyID;
      