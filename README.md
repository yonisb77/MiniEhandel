MiniEhandel – Databasprojekt

Detta projekt är en enkel SQL-databas för en nätbutik. Den innehåller tabeller för kategorier, varor, lager, kunder, ordrar och orderrader som är ihopkopplade med primär- och främmande nycklar.

Varje vara hör till en kategori och har pris, status och lagersaldo. Kunder sparas med unik e-post och ett automatiskt datum. Ordrar har status (skapad, betald, skickad) och orderrader sparar antal och pris vid köpet.

Databasen använder regler för att säkerställa korrekt data, till exempel att pris och antal inte kan vara negativa. Den innehåller även testdata och vyer för att visa samlad information om ordrar och produkter.
