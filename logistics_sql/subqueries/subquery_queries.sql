-- SUBQUERY QUERIES 

-- 1. Customers with total shipment cost above overall average
SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(s.cost) AS total_customer_cost
FROM Customers c
JOIN Shipments s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name
HAVING SUM(s.cost) > (
    SELECT AVG(total_cost)
    FROM (
        SELECT SUM(cost) AS total_cost
        FROM Shipments
        GROUP BY customer_id
    ) AS customer_totals
);

-- 2. Vehicles whose total maintenance cost is above the fleet average
SELECT
    v.vehicle_id,
    v.plate_number,
    SUM(m.cost) AS total_maintenance_cost
FROM Vehicles v
JOIN Maintenance_Log m ON v.vehicle_id = m.vehicle_id
GROUP BY v.vehicle_id, v.plate_number
HAVING SUM(m.cost) > (
    SELECT AVG(total_cost)
    FROM (
        SELECT SUM(cost) AS total_cost
        FROM Maintenance_Log
        GROUP BY vehicle_id
    ) AS maintenance_totals
);

-- 3. Routes with above-average shipment weight
SELECT
    r.route_id,
    r.origin,
    r.destination,
    SUM(s.weight_kg) AS total_route_weight
FROM Routes r
JOIN Shipments s ON r.route_id = s.route_id
GROUP BY r.route_id, r.origin, r.destination
HAVING SUM(s.weight_kg) > (
    SELECT AVG(weight_total)
    FROM (
        SELECT SUM(weight_kg) AS weight_total
        FROM Shipments
        GROUP BY route_id
    ) AS route_weights
);

-- 4. Drivers with more assignments than the average driver
SELECT
    d.driver_id,
    d.name AS driver_name,
    COUNT(a.assignment_id) AS assignment_count
FROM Drivers d
LEFT JOIN Assignments a ON d.driver_id = a.driver_id
GROUP BY d.driver_id, d.name
HAVING COUNT(a.assignment_id) > (
    SELECT AVG(assign_count)
    FROM (
        SELECT COUNT(assignment_id) AS assign_count
        FROM Assignments
        GROUP BY driver_id
    ) AS driver_assignments
);

-- 5. Shipments heavier than the average shipment weight for their route
SELECT
    s.shipment_id,
    s.route_id,
    s.weight_kg,
    route_avg.avg_weight AS route_average_weight
FROM Shipments s
JOIN (
    SELECT
        route_id,
        AVG(weight_kg) AS avg_weight
    FROM Shipments
    GROUP BY route_id
) AS route_avg
ON s.route_id = route_avg.route_id
WHERE s.weight_kg > route_avg.avg_weight;
