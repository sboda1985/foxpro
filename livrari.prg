*====================================================================
* SUBIECTUL NR. 2 - Baza de date "livrari.dbf"
*====================================================================

* Biztosítjuk, hogy tiszta lappal induljunk, és beállítjuk a dátumformátumot
CLOSE ALL
CLEAR
SET STRICTDATE TO 0

*--------------------------------------------------------------------
* 1. A tábla (baza de date) létrehozása
*--------------------------------------------------------------------
CREATE TABLE livrari (Cod_com N(5), Client C(50), Valoare N(7,2), Adresa_liv C(80), Data_liv D)

*--------------------------------------------------------------------
* 2. Minimum 10 rekord bevitele
* A dátumokat a Visual FoxPro {^ÉÉÉÉ-HH-NN} szigorú formátumával adjuk meg
*--------------------------------------------------------------------
INSERT INTO livrari VALUES (10001, "Popescu Ion", 150.00, "Bucuresti, Str. Lalelelor 1", {^2026-10-15})
INSERT INTO livrari VALUES (10002, "Ionescu Maria", 250.00, "Cluj, Str. Memorandumului 2", {^2026-12-05})
INSERT INTO livrari VALUES (10003, "Kovacs Andrei", 300.00, "Timisoara, Piata Unirii 5", {^2026-11-20})
INSERT INTO livrari VALUES (10004, "Radu Stefan", 180.50, "Iasi, Bd. Copou 10", {^2026-12-15})
INSERT INTO livrari VALUES (10005, "Varga Elena", 450.00, "Brasov, Str. Republicii 8", {^2026-01-10})
INSERT INTO livrari VALUES (10006, "Mihai George", 190.00, "Constanta, Bd. Mamaia 12", {^2026-12-01})
INSERT INTO livrari VALUES (10007, "Dumitrescu Ana", 500.00, "Sibiu, Piata Mare 3", {^2026-08-22})
* Ez a rekord egy múlt évi decemberi adat, ezen a 7%-os csökkentés nem fog lefutni
INSERT INTO livrari VALUES (10008, "Szabo Alexandru", 220.00, "Oradea, Str. Primariei 7", {^2025-12-10}) 
INSERT INTO livrari VALUES (10009, "Popa Florin", 120.00, "Arad, Bd. Revolutiei 9", {^2026-12-28})
INSERT INTO livrari VALUES (10010, "Gheorghe Vasile", 600.00, "Zalau, Str. Unirii 14", {^2026-12-30})

*--------------------------------------------------------------------
* a) Să se afișeze comenzile care au o valoare mai mare de 200
*--------------------------------------------------------------------
? "==============================================================="
? "a) Comenzile care au o valoare mai mare de 200:"
? "==============================================================="
BROWSE FOR Valoare > 200

*--------------------------------------------------------------------
* b) Să se reducă cu 7% valoarea comenzilor care au data de livrare 
* luna decembrie a anului curent
*--------------------------------------------------------------------
* Kinyerjük az aktuális évet a rendszerdátumból
LOCAL lnAnulCurent
lnAnulCurent = YEAR(DATE())

* A 7%-os csökkentés matematikailag azt jelenti, hogy megszorozzuk az értéket 0.93-mal
* Feltételek: Hónap = 12 ÉS Év = Aktuális év
REPLACE ALL Valoare WITH Valoare * 0.93 FOR MONTH(Data_liv) = 12 AND YEAR(Data_liv) = lnAnulCurent

* Az eredmény szemléltetéséhez kiíratjuk a módosított, aktuális évi decemberi rekordokat
? " "
? "==============================================================="
? "b) Valorile actualizate (reducere 7% pentru decembrie " + ALLTRIM(STR(lnAnulCurent)) + "):"
? "==============================================================="
BROWSE FOR MONTH(Data_liv) = 12 AND YEAR(Data_liv) = lnAnulCurent

* Erőforrások felszabadítása a végén
CLOSE DATABASES
