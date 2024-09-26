select * from customer_churn_import
select * from customer_churn2
ALTER TABLE customer_churn_import
RENAME COLUMN `Monthly Charge` TO Monthly_Charge;

ALTER TABLE customer_churn_import
RENAME COLUMN `Churn Label` TO churn_Label;

ALTER TABLE customer_churn_import
RENAME COLUMN `Churn Reason` TO churn_Reason;

ALTER TABLE customer_churn_import
RENAME COLUMN `Payment Method` TO Payment_Method;
#Query 1: Considering the top 5 groups with the highest

SELECT Age, Gender, Contract, AVG(Monthly_Charge) AS AvgMonthlyCharges
FROM customer_churn_import
WHERE Churn_Label = 'Yes'
GROUP BY Age, Gender, Contract
ORDER BY AvgMonthlyCharges DESC
LIMIT 5;
#Query_2
SELECT Churn_Reason, COUNT(*) AS Frequency
FROM customer_churn_import
WHERE Churn_Label = 'Yes' 
AND Churn_Reason IS NOT NULL
GROUP BY Churn_Reason
ORDER BY Frequency DESC;

#Query_3

SELECT Payment_Method, COUNT(*) AS TotalCustomers, 
       SUM(CASE WHEN Churn_Label = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers
FROM customer_churn_import
GROUP BY Payment_Method;

