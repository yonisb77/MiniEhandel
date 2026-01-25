USE MiniEhandel;
GO

-- ============================================
-- Views för Mini e-handel
-- ============================================

-- View 1: Ordrar med kundinformation
-- Visar order-id, datum, status samt kundens id, namn och e-post
CREATE VIEW vw_OrdersWithCustomers AS
SELECT 
    o.order_id,
    o.orderdatum,
    o.status,
    k.kund_id,
    k.namn AS kundnamn,
    k.email
FROM [Order] o
JOIN Kund k ON o.kund_id = k.kund_id;
GO

-- View 2: Produkter med lager och kategori
-- Visar produktnamn, pris, om aktiv, kategori och lagerantal
CREATE VIEW vw_ProductsWithStock AS
SELECT 
    p.produkt_id,
    p.namn AS produktnamn,
    p.pris,
    p.aktiv,
    k.namn AS kategori,
    l.kvantitet AS lager
FROM Produkt p
JOIN Kategori k ON p.kategori_id = k.kategori_id
JOIN Lager l ON p.produkt_id = l.produkt_id;
GO

-- View 3: Orderrader med produktnamn och radtotal
-- Visar order-id, produkt, antal, pris vid köp och beräknad radtotal
CREATE VIEW vw_OrderDetails AS
SELECT 
    r.order_id,
    p.namn AS produktnamn,
    r.antal,
    r.pris_vid_kop,
    (r.antal * r.pris_vid_kop) AS rad_total
FROM Orderrad r
JOIN Produkt p ON r.produkt_id = p.produkt_id;
GO
