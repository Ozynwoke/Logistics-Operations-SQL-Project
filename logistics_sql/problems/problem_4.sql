-- PROBLEM 4: Most active route (highest shipment count)

/*
QUESTION:
Which route has handled the highest number of shipments?

TASK:
Return:
- route_id
- origin
- destination
- shipment_count
Limit to the top route only.
*/

SELECT
    r.route_id,
    r.origin,
    r.destination,
    COUNT(s.shipment_id) AS shipment_count
FROM Routes r
JOIN Shipments s 
    ON r.route_id = s.route_id
GROUP BY r.route_id, r.origin, r.destination
ORDER BY shipment_count DESC
LIMIT 1;
