-- Skapa ny order
INSERT INTO [Order] (kund_id, status)
VALUES (3, 'skapad');

-- Lägg till orderrad (orderitem)
INSERT INTO Orderrad (order_id, produkt_id, antal, pris_vid_kop)
VALUES (7, 4, 1, 399);

