-- UNION & UNION ALL QUERIES 

-- 1. Combine active and inactive drivers into one list
SELECT 
    name AS person_name,
    'Driver' AS role,
    status
FROM Drivers

UNION ALL

SELECT
    plate_number AS person_name,
    'Vehicle' AS role,
    status
FROM Vehicles;


-- 2. List all dates where any logistics activity happened (pickup, delivery, fuel, maintenance)
SELECT pickup_date AS activity_date, 'Shipment Pickup' AS activity_type
FROM Shipments

UNION

SELECT delivery_date AS activity_date, 'Shipment Delivery' AS activity_type
FROM Shipments
WHERE delivery_date IS NOT NULL

UNION

SELECT date AS activity_date, 'Fuel Log Entry' AS activity_type
FROM Fuel_Log

UNION

SELECT date AS activity_date, 'Maintenance Log Entry' AS activity_type
FROM Maintenance_Log
ORDER BY activity_date;


-- 3. List all IDs from different tables for auditing purposes
SELECT shipment_id AS record_id, 'Shipment' AS source
FROM Shipments

UNION ALL

SELECT driver_id AS record_id, 'Driver' AS source
FROM Drivers

UNION ALL

SELECT vehicle_id AS record_id, 'Vehicle' AS source
FROM Vehicles;


-- 4. Combine short, medium, and long routes into one consolidated label set
SELECT 
    route_id,
    origin,
    destination,
    'Short Route' AS category
FROM Routes
WHERE distance_km < 200

UNION

SELECT 
    route_id,
    origin,
    destination,
    'Medium Route' AS category
FROM Routes
WHERE distance_km BETWEEN 200 AND 600

UNION

SELECT 
    route_id,
    origin,
    destination,
    'Long Route' AS category
FROM Routes
WHERE distance_km > 600;


-- 5. List customers and vehicles in a single column for similarity searches
SELECT 
    name AS label,
    'Customer' AS type
FROM Customers

UNION ALL

SELECT 
    plate_number AS label,
    'Vehicle' AS type
FROM Vehicles;
