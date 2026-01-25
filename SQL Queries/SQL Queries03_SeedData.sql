USE MiniEhandel;
GO

-- Lägger till kategorier
INSERT INTO Kategori (namn, beskrivning) VALUES
('Elektronik','Elektroniska produkter'),
('Kläder','Kläder'),
('Böcker','Böcker');

-- Lägger till produkter kopplade till kategorier
INSERT INTO Produkt (namn, pris, kategori_id) VALUES
('Laptop', 9999, 1),          -- Elektronik
('Mobiltelefon', 8999, 1),    -- Elektronik
('Hörlurar', 199, 1),         -- Elektronik
('T-shirt', 399, 2),          -- Kläder
('Keps', 249, 2),             -- Kläder
('Jacka', 1799, 2),           -- Kläder
('Barnbok', 49, 3),           -- Böcker
('Romanbok', 299, 3);         -- Böcker

-- Lägger till lagerantal för produkterna
INSERT INTO Lager (produkt_id, kvantitet) VALUES
(1, 11),   -- Laptop
(2, 25),   -- Mobiltelefon
(3, 50),   -- Hörlurar
(4, 21),   -- T-shirt
(5, 10),   -- Keps
(6, 12),   -- Jacka
(7, 5),    -- Barnbok
(8, 8);    -- Romanbok

-- Lägger till kunder
INSERT INTO Kund (namn, email, adress) VALUES
('Anna Andersson','anna@test.se','Stockholm'),
('Björn Berg','bjorn@test.se','Göteborg'),
('Carla Carlsson','carla@test.se','Malmö'),
('David Demo','david@test.se','Uppsala'),
('Eva Eriksson','eva@test.se','Västerås'),
('Filip Falk','filip@test.se','Örebro');

-- Lägger till ordrar kopplade till kunder
INSERT INTO [Order] (kund_id, status) VALUES
(1,'skapad'),
(2,'skapad'),
(3,'skapad'),
(4,'skickad'),
(5,'skickad'),
(6,'betald');

-- Lägger till orderrader med produkter och antal
INSERT INTO Orderrad (order_id, produkt_id, antal, pris_vid_kop) VALUES
(1,2,1,8999),  
(2,4,2,399),    
(3,7,1,49),     
(4,5,2,249),   
(4,8,1,299),   
(5,1,1,9999),  
(5,6,1,1799),   
(6,2,1,8999),   
(6,3,1,199);    
