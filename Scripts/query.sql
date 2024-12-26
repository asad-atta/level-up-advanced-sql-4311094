Select e1.firstName || ' ' || e1.lastName As employeeName,
e1.title,
e2.firstName || ' ' || e2.lastName || ' (' || e2.title || ')' As ManagerName
  From employee e1
LEFT JOIN employee e2 ON e1.managerId = e2.employeeId;

SELECT * 
FROM employee e 
LEFT JOIN sales s 
ON e.employeeId = s.employeeId 
WHERE e.title = 'Sales Person' 
AND s.employeeId IS NULL;
--s.salesAmount < 1

-- Using union as outer join, union all are not supported!
Select c.firstName || ' ' || c.lastName AS customerName,
c.email,
s.salesAmount, s.soldDate 
FROM customer c INNER JOIN sales s ON c.customerId = s.customerId

UNION 
-- customers with no sales
Select c.firstName || ' ' || c.lastName AS customerName,
c.email,
s.salesAmount, s.soldDate, c.customerId, s.salesId 
FROM customer c LEFT JOIN sales s ON c.customerId = s.customerId 
AND s.salesId IS NULL 
UNION 
-- Sales with no customers
Select c.firstName || ' ' || c.lastName AS customerName,
c.email,
s.salesAmount, s.soldDate,
c.customerId, s.salesId  
FROM sales s  LEFT JOIN customer c  ON  s.customerId = c.customerId
AND c.customerId IS NULL 