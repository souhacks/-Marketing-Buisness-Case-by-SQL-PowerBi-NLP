-- SQL statement to join dim_customers with dim_geography to enrich customer data with geographic information
SELECT * FROM marketing_buisness_case.`dbo.geography`;
SELECT * FROM marketing_buisness_case.`dbo.customers`;

SELECT c.CustomerID,
c.CustomerName, 
c.Email,
c.Gender,
c.Age,
g.Country,
g.City
FROM marketing_buisness_case.`dbo.customers` c
LEFT JOIN marketing_buisness_case.`dbo.geography` g
ON c.GeographyID = g.GeographyID 