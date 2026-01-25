-- Order med produkter
SELECT o.order_id, p.namn, r.antal, r.pris_vid_kop
FROM [Order] o
JOIN Orderrad r ON o.order_id = r.order_id
JOIN Produkt p ON r.produkt_id = p.produkt_id;

-- Produkter med kategori
SELECT p.namn, k.namn AS kategori
FROM Produkt p
JOIN Kategori k ON p.kategori_id = k.kategori_id;
