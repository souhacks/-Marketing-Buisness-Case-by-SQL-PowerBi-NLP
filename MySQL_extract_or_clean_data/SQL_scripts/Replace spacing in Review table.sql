-- Query to clea whitespace issues in the ReviewText column

SELECT ReviewID, CustomerID, ProductID, ReviewDate, Rating, REPLACE(ReviewText, '  ', ' ') AS ReviewText
FROM marketing_buisness_case.`dbo.customer_reviews`