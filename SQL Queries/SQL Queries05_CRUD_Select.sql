-- 1. Alla kunder
SELECT * FROM Kund; -- Hämtar alla kunder

-- 2. Alla skickade ordrar
SELECT * FROM [Order] 
WHERE status = 'skickad'; -- Endast ordrar som är skickade

-- 3. Skickade ordrar med kundnamn
SELECT o.order_id, o.orderdatum, o.status, k.namn AS kundnamn
FROM [Order] o
JOIN Kund k ON o.kund_id = k.kund_id
WHERE o.status = 'skickad'; -- Visar order med kundnamn

