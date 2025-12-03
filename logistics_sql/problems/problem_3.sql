-- PROBLEM 3: Most frequently assigned driver

/*
QUESTION:
Which driver has been assigned to the highest number of shipments?

TASK:
Return:
- driver_id
- driver_name
- assignment_count
Limit to the top driver only.
*/

SELECT
    d.driver_id,
    d.name AS driver_name,
    COUNT(a.assignment_id) AS assignment_count
FROM Drivers d
JOIN Assignments a ON d.driver_id = a.driver_id
GROUP BY d.driver_id, d.name
ORDER BY assignment_count DESC
LIMIT 1;
