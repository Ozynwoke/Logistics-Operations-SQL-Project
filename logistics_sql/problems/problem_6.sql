-- PROBLEM 6: Late deliveries

/*
QUESTION:
Which shipments were delivered later than their expected route duration?

TASK:
Compare:
- actual_hours = (delivery_date - pickup_date) in hours
- estimated_hours = route.estimated_time_hours

Return late shipments only.
*/

SELECT
    s.shipment_id,
    c.name AS customer_name,
    r.origin || ' → ' || r.destination AS route,
    r.estimated_time_hours AS estimated_hours,
    EXTRACT(EPOCH FROM (s.delivery_date::timestamp - s.pickup_date::timestamp)) / 3600.0 
        AS actual_hours
FROM Shipments s
JOIN Customers c ON s.customer_id = c.customer_id
JOIN Routes r     ON s.route_id = r.route_id
WHERE s.delivery_date IS NOT NULL
  AND (EXTRACT(EPOCH FROM (s.delivery_date::timestamp - s.pickup_date::timestamp)) / 3600.0)
        > r.estimated_time_hours
ORDER BY 
    (EXTRACT(EPOCH FROM (s.delivery_date::timestamp - s.pickup_date::timestamp)) / 3600.0)
      - r.estimated_time_hours DESC;
