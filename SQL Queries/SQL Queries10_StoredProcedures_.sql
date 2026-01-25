USE MiniEhandel;
GO

-- ============================================
-- 10_StoredProcedures.sql
-- Stored Procedures för Mini e-handel
-- ============================================


-- 1. Skapa ny kund
CREATE PROCEDURE sp_CreateCustomer
    @namn NVARCHAR(150),
    @email NVARCHAR(150),
    @adress NVARCHAR(255)
AS
BEGIN
    INSERT INTO Kund (namn, email, adress)
    VALUES (@namn, @email, @adress);
END;
GO


-- 2. Skapa ny order för kund
CREATE PROCEDURE sp_CreateOrder
    @kund_id INT
AS
BEGIN
    INSERT INTO [Order] (kund_id, status)
    VALUES (@kund_id, 'skapad');
END;
GO


-- 3. Lägg till produkt i order + uppdatera lager
CREATE PROCEDURE sp_AddOrderItem
    @order_id INT,
    @produkt_id INT,
    @antal INT
AS
BEGIN
    DECLARE @pris DECIMAL(10,2);
    DECLARE @saldo INT;

    -- Hämta pris
    SELECT @pris = pris 
    FROM Produkt 
    WHERE produkt_id = @produkt_id;

    -- Hämta lagerkvantitet
    SELECT @saldo = kvantitet
    FROM Lager 
    WHERE produkt_id = @produkt_id;

    -- Kontrollera att det finns tillräckligt i lager
    IF (@saldo < @antal)
    BEGIN
        RAISERROR ('Ej tillräckligt i lager', 16, 1);
        RETURN;
    END

    -- Lägg till orderrad
    INSERT INTO Orderrad (order_id, produkt_id, antal, pris_vid_kop)
    VALUES (@order_id, @produkt_id, @antal, @pris);

    -- Uppdatera lager
    UPDATE Lager
    SET kvantitet = kvantitet - @antal
    WHERE produkt_id = @produkt_id;
END;
GO



-- 4. Bekräfta order
CREATE PROCEDURE sp_ConfirmOrder
    @order_id INT
AS
BEGIN
    UPDATE [Order]
    SET status = 'betald'
    WHERE order_id = @order_id;
END;
GO
