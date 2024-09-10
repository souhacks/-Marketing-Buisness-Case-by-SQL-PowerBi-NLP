-- Query to categorise products based onn their price
SELECT ProductID, ProductName, Category,  
CASE WHEN Price < 50 THEN 'Low'
WHEN Price BETWEEN 50 AND 200 THEN 'Medium'
ELSE 'High' END
AS PriceCategory
FROM marketing_buisness_case.`dbo.products`;
