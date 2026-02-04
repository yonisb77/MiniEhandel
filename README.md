# 🛒 MiniEhandel – Databasprojekt
Yonis Bashir

**MiniEhandel** är ett SQL-baserat databasprojekt som modellerar grunden för en enkel nätbutik. Fokus ligger på **produkter, lager, kunder och orderhantering**, med korrekt användning av **primär- och främmande nycklar** för att säkerställa dataintegritet.

Projektet är utformat för att visa förståelse för **relationsdatabaser**, normalisering och affärslogik på databasenivå.

---

## 🎯 Syfte

Syftet med projektet är att skapa en strukturerad och konsekvent databas som kan:

* Hantera produkter och deras kategorier
* Hålla ordning på lagersaldo
* Spara kunder med unika uppgifter
* Skapa och följa ordrar med tillhörande orderrader
* Säkerställa korrekt data genom regler och begränsningar

---

## 🗄 Databasstruktur

### 📦 Kategorier

* Varje kategori har ett unikt ID och namn
* Används för att gruppera produkter

### 🛍 Produkter (Varor)

* Varje produkt tillhör exakt en kategori
* Innehåller information om:

  * Pris
  * Status (t.ex. aktiv/inaktiv)
  * Lagersaldo

### 🧮 Lager

* Håller reda på aktuellt lagersaldo per produkt
* Säkerställer att lagersaldot inte kan bli negativt

### 👤 Kunder

* Sparas med:

  * Unikt kund-ID
  * Unik e-postadress
  * Skapandedatum (sätts automatiskt)

### 📑 Ordrar

* Varje order är kopplad till en kund
* Orderstatus:

  * Skapad
  * Betald
  * Skickad

### 🧾 Orderrader

* Kopplar produkter till ordrar
* Sparar:

  * Antal
  * Pris vid köptillfället
* Möjliggör korrekt orderhistorik även om produktpriser ändras senare

---

## 🔑 Relationer & Dataintegritet

* Primär- och främmande nycklar används konsekvent
* Regler säkerställer att:

  * Pris och antal inte kan vara negativa
  * Kunder inte kan registreras med samma e-postadress
  * Orderrader alltid är kopplade till giltiga ordrar och produkter

---

## 👁 Vyer & Testdata

### 📊 Vyer

* Vy för att visa samlad orderinformation (kund, orderstatus, totalbelopp)
* Vy för produktöversikt med kategori och lagersaldo

### 🧪 Testdata

* Förifylld testdata för:

  * Kategorier
  * Produkter
  * Kunder
  * Ordrar och orderrader
* Gör databasen enkel att testa och demonstrera direkt

---

## 🔮 Framtida förbättringar

För att vidareutveckla databasen kan följande funktioner läggas till:

* Flera adresser per kund (leverans och faktura)
* Stöd för produktbilder och media
* Rabatt- och kampanjsystem
* Utökad orderhistorik med statuslogg
* Mer avancerade rapporter för försäljning och lager
* Index och eventuella triggers för bättre prestanda och affärslogik

---

## 📌 Sammanfattning

**MiniEhandel** är ett välstrukturerat databasprojekt som demonstrerar grundläggande och viktiga koncept inom SQL och databasteknik. Projektet lämpar sig väl för utbildningssyfte och som grund för vidareutveckling mot ett mer komplett e-handelssystem.
