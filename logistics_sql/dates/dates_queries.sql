-- ======================================
-- DATES QUERIES for Logistics SQL Project
-- ======================================

-- 1. Shipments by month of pickup
SELECT 
    DATE_TRUNC('month', pickup_date) AS pickup_month,
    COUNT(*) AS shipment_count
FROM Shipments
GROUP BY pickup_month
ORDER BY pickup_month;

-- 2. Delivery duration in days (pickup to delivery)
SELECT 
    shipment_id,
    pickup_date,
    delivery_date,
    delivery_date - pickup_date AS delivery_duration_days
FROM Shipments
WHERE delivery_date IS NOT NULL;

-- 3. Maintenance logs grouped by month
SELECT 
    DATE_TRUNC('month', date) AS maintenance_month,
    COUNT(*) AS maintenance_events
FROM Maintenance_Log
GROUP BY maintenance_month
ORDER BY maintenance_month;

-- 4. Fuel usage over time
SELECT
    DATE_TRUNC('month', date) AS fuel_month,
    SUM(liters) AS total_liters_used
FROM Fuel_Log
GROUP BY fuel_month
ORDER BY fuel_month;

-- 5. Drivers hired per year
SELECT
    EXTRACT(YEAR FROM hire_date) AS hire_year,
    COUNT(*) AS drivers_hired
FROM Drivers
GROUP BY hire_year
ORDER BY hire_year;
