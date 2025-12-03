-- PROBLEM 1: Top 3 highest revenue customers

/*
QUESTION:
Which customers generate the highest shipment revenue?

TASK:
Return the top 3 customers ranked by their total shipment cost.
Include:
- customer_id
- customer_name
- total_revenue
*/

SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(s.cost) AS total_revenue
FROM Customers c
JOIN Shipments s 
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_revenue DESC
LIMIT 3;

