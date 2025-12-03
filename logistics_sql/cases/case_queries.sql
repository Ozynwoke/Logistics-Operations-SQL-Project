-- ======================================
-- CASE WHEN QUERIES for Logistics Project
-- ======================================

-- 1. Categorize shipments by weight
SELECT 
    shipment_id,
    weight_kg,
    CASE
        WHEN weight_kg < 100 THEN 'Light'
        WHEN weight_kg BETWEEN 100 AND 500 THEN 'Medium'
        ELSE 'Heavy'
    END AS weight_category
FROM Shipments
ORDER BY shipment_id;

-- 2. Categorize vehicle maintenance frequency
SELECT 
    v.vehicle_id,
    v.plate_number,
    COUNT(m.maintenance_id) AS maintenance_count,
    CASE
        WHEN COUNT(m.maintenance_id) = 0 THEN 'No Maintenance'
        WHEN COUNT(m.maintenance_id) <= 2 THEN 'Low Maintenance'
        ELSE 'High Maintenance'
    END AS maintenance_category
FROM Vehicles v
LEFT JOIN Maintenance_Log m 
    ON v.vehicle_id = m.vehicle_id
GROUP BY v.vehicle_id, v.plate_number
ORDER BY maintenance_count DESC;

-- 3. Categorize routes by distance
SELECT
    route_id,
    origin,
    destination,
    distance_km,
    CASE
        WHEN distance_km < 200 THEN 'Short Route'
        WHEN distance_km BETWEEN 200 AND 600 THEN 'Medium Route'
        ELSE 'Long Route'
    END AS route_category
FROM Routes
ORDER BY distance_km;

-- 4. Categorize customers by total shipment cost
SELECT
    c.customer_id,
    c.name AS customer_name,
    SUM(s.cost) AS total_cost,
    CASE
        WHEN SUM(s.cost) < 50000 THEN 'Low Value'
        WHEN SUM(s.cost) BETWEEN 50000 AND 200000 THEN 'Medium Value'
        ELSE 'High Value'
    END AS customer_category
FROM Customers c
LEFT JOIN Shipments s 
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_cost DESC;

-- 5. Categorize drivers by assignment count
SELECT
    d.driver_id,
    d.name AS driver_name,
    COUNT(a.assignment_id) AS assignment_count,
    CASE
        WHEN COUNT(a.assignment_id) = 0 THEN 'Unassigned'
        WHEN COUNT(a.assignment_id) <= 3 THEN 'Moderate Load'
        ELSE 'High Load'
    END AS load_category
FROM Drivers d
LEFT JOIN Assignments a 
    ON d.driver_id = a.driver_id
GROUP BY d.driver_id, d.name
ORDER BY assignment_count DESC;
