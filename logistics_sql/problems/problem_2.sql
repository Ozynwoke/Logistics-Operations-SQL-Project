-- PROBLEM 2: Vehicle with the highest total maintenance cost

/*
QUESTION:
Which vehicle has incurred the highest total maintenance cost?

TASK:
Return:
- vehicle_id
- plate_number
- total_maintenance_cost
- maintenance_count
Limit to the highest-cost vehicle only.
*/

SELECT
    v.vehicle_id,
    v.plate_number,
    SUM(m.cost) AS total_maintenance_cost,
    COUNT(m.maintenance_id) AS maintenance_count
FROM Vehicles v
JOIN Maintenance_Log m 
    ON v.vehicle_id = m.vehicle_id
GROUP BY v.vehicle_id, v.plate_number
ORDER BY total_maintenance_cost DESC
LIMIT 1;
