CLEAR

CREATE TABLE personal ;
 (Cod_pers C(6), ;
  Nume C(15), ;
  Prenume C(20), ;
  Tarif_orar N(6,2), ;
  Ore_lucrate N(4))

INSERT INTO personal VALUES ("P001", "Popescu", "Ion", 25.50, 160)
INSERT INTO personal VALUES ("P002", "Ionescu", "Maria", 30.00, 150)
INSERT INTO personal VALUES ("P003", "Avram", "Andrei", 28.75, 170)
INSERT INTO personal VALUES ("P004", "Muresan", "Elena", 22.00, 160)
INSERT INTO personal VALUES ("P005", "Balan", "Radu", 35.00, 180)
INSERT INTO personal VALUES ("P006", "Dumitru", "Ana", 27.50, 140)
INSERT INTO personal VALUES ("P007", "Stan", "Mihai", 24.00, 170)
INSERT INTO personal VALUES ("P008", "Marin", "Ioana", 31.25, 155)
INSERT INTO personal VALUES ("P009", "Georgescu", "Paul", 29.00, 160)
INSERT INTO personal VALUES ("P010", "Vasile", "Cristina", 26.50, 145)

* a) Ordonare descrescator dupa ore, apoi alfabetic dupa nume si prenume
INDEX ON STR(9999 - Ore_lucrate, 4) + Nume + Prenume TAG ordonare
SET ORDER TO ordonare

BROWSE TITLE "Personal ordonat"

* b) Afisarea salariului
CLEAR
? "Cod    Nume            Prenume              Salariu"
? "---------------------------------------------------"

GO TOP
DO WHILE !EOF()
    salariu = Tarif_orar * Ore_lucrate
    ? Cod_pers, Nume, Prenume, salariu
    SKIP
ENDDO
