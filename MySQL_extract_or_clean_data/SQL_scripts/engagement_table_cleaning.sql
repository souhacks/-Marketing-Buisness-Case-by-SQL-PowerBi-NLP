-- Query to normalize and clean the engagement data
SELECT * FROM marketing_buisness_case.`dbo.engagement_data`;

SELECT EngagementID, 
       ContentID, 
       CampaignID, 
       ProductID,
      UPPER(REPLACE(ContentType, 'Socialmedia', 'SocialMedia')) AS ContentType,
       SUBSTRING_INDEX(ViewsClicksCombined, '-', 1) AS Views,
       SUBSTRING_INDEX(ViewsClicksCombined, '-', -1) AS Clicks,
       Likes,
       DATE_FORMAT(EngagementDate, '%d/%m/%y') AS EngagementDate
FROM marketing_buisness_case.`dbo.engagement_data`;