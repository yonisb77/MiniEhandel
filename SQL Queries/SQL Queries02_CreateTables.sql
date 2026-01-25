USE MiniEhandel;
GO

-- Tabell: Kategori
-- Lagrar produktkategorier
CREATE TABLE Kategori (
    kategori_id INT IDENTITY PRIMARY KEY,       
    namn NVARCHAR(100) NOT NULL UNIQUE,        
    beskrivning NVARCHAR(255)                  
);

-- Tabell: Produkt
-- Lagrar produkter och kopplar dem till kategori
CREATE TABLE Produkt (
    produkt_id INT IDENTITY PRIMARY KEY,      
    namn NVARCHAR(150) NOT NULL UNIQUE,        
    pris DECIMAL(10,2) NOT NULL CHECK (pris >= 0), 
    aktiv BIT NOT NULL DEFAULT 1,              
    kategori_id INT NOT NULL,                  
    CONSTRAINT FK_Produkt_Kategori FOREIGN KEY (kategori_id)
        REFERENCES Kategori(kategori_id)
);

-- Tabell: Lager
CREATE TABLE Lager (
    lager_id INT IDENTITY PRIMARY KEY,         
    produkt_id INT NOT NULL UNIQUE,           
    kvantitet INT NOT NULL CHECK (kvantitet >= 0), 
    CONSTRAINT FK_Lager_Produkt FOREIGN KEY (produkt_id)
        REFERENCES Produkt(produkt_id)
);

-- Tabell: Kund
-- Lagrar kundinformation
CREATE TABLE Kund (
    kund_id INT IDENTITY PRIMARY KEY,          -- Primärnyckel
    namn NVARCHAR(150) NOT NULL,               -- Kundnamn
    email NVARCHAR(150) NOT NULL UNIQUE,       -- E-postadress
    adress NVARCHAR(255),                      -- Adress
    skapad_datum DATETIME NOT NULL DEFAULT GETDATE() -- Skapandedatum
);

-- Tabell: Order
-- Lagrar kundbeställningar
CREATE TABLE [Order] (
    order_id INT IDENTITY PRIMARY KEY,         
    kund_id INT NOT NULL,                       
    orderdatum DATETIME NOT NULL DEFAULT GETDATE(), 
    status NVARCHAR(50) NOT NULL CHECK (status IN ('skapad','betald','skickad')),
    CONSTRAINT FK_Order_Kund FOREIGN KEY (kund_id)
        REFERENCES Kund(kund_id)
);

-- Tabell: Orderrad
-- Lagrar produkter per order
CREATE TABLE Orderrad (
    order_id INT NOT NULL,                     
    produkt_id INT NOT NULL,                    
    antal INT NOT NULL CHECK (antal > 0),      
    pris_vid_kop DECIMAL(10,2) NOT NULL,       
    CONSTRAINT PK_Orderrad PRIMARY KEY (order_id, produkt_id),
    CONSTRAINT FK_Orderrad_Order FOREIGN KEY (order_id)
        REFERENCES [Order](order_id),
    CONSTRAINT FK_Orderrad_Produkt FOREIGN KEY (produkt_id)
        REFERENCES Produkt(produkt_id)
);
