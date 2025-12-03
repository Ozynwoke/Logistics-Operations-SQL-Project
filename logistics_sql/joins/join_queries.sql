-- JOIN QUERIES 

-- 1. Join shipments with customers and vehicles
SELECT
    s.shipment_id,
    c.name AS customer_name,
    v.plate_number AS vehicle_plate,
    s.pickup_date,
    s.delivery_date,
    s.status
FROM Shipments s
JOIN Customers c ON s.customer_id = c.customer_id
LEFT JOIN Vehicles v ON s.vehicle_id = v.vehicle_id
ORDER BY s.shipment_id;

-- 2. Drivers and the vehicles they were assigned to
SELECT
    d.driver_id,
    d.name AS driver_name,
    v.vehicle_id,
    v.plate_number,
    a.assignment_date
FROM Drivers d
JOIN Assignments a ON d.driver_id = a.driver_id
JOIN Vehicles v ON a.vehicle_id = v.vehicle_id
ORDER BY a.assignment_date DESC;

-- 3. Shipments joined to routes for route performance insights
SELECT
    s.shipment_id,
    r.origin,
    r.destination,
    r.distance_km,
    s.weight_kg,
    s.cost
FROM Shipments s
JOIN Routes r ON s.route_id = r.route_id;

-- 4. Maintenance log with details of the affected vehicle
SELECT
    m.maintenance_id,
    m.date AS maintenance_date,
    m.type AS maintenance_type,
    m.cost AS maintenance_cost,
    v.plate_number,
    v.status AS vehicle_status
FROM Maintenance_Log m
JOIN Vehicles v ON m.vehicle_id = v.vehicle_id
ORDER BY m.date DESC;

-- 5. Fuel consumption joined with vehicles for cost analysis
SELECT
    f.fuel_id,
    f.date AS fuel_date,
    f.liters,
    f.cost,
    v.plate_number,
    v.type AS vehicle_type
FROM Fuel_Log f
JOIN Vehicles v ON f.vehicle_id = v.vehicle_id
ORDER BY f.date DESC;
