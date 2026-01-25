-- Uppdatera antalet som finns i lagret
UPDATE Lager
SET kvantitet = kvantitet - 1
WHERE produkt_id = 1;


-- Uppdatera orderstatus
UPDATE [Order]
SET status = 'betald'
WHERE order_id = 3;
