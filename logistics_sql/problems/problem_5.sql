-- PROBLEM 5: Vehicle with the worst fuel efficiency

/*
QUESTION:
Which vehicle has the worst fuel efficiency, measured as the
highest average fuel cost per liter?

TASK:
Return:
- vehicle_id
- plate_number
- avg_cost_per_liter
Limit to the worst-performing vehicle.
*/

SELECT
    v.vehicle_id,
    v.plate_number,
    AVG(f.cost / f.liters) AS avg_cost_per_liter
FROM Vehicles v
JOIN Fuel_Log f 
    ON v.vehicle_id = f.vehicle_id
WHERE f.liters > 0
GROUP BY v.vehicle_id, v.plate_number
ORDER BY avg_cost_per_liter DESC
LIMIT 1;
