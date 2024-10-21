-- Query to find users who placed more than 5 orders in the last 6 months
SELECT u.UserID, u.Name, 
COUNT(o.OrderID) AS OrderCount
FROM Users u
JOIN Orders o 
ON u.UserID = o.UserID
WHERE o.OrderDate >= CURDATE() - INTERVAL 6 MONTH
GROUP BY u.UserID, u.Name
HAVING COUNT(o.OrderID) > 5;