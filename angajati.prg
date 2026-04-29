CLEAR

CREATE TABLE angajati ;
 (CNP C(13), ;
  Nume C(15), ;
  Prenume C(20), ;
  Data_angajarii D, ;
  Data_nasterii D)

INSERT INTO angajati VALUES ("1900101123456", "Popescu", "Ion", CTOD("10/05/2010"), CTOD("01/01/1990"))
INSERT INTO angajati VALUES ("2910422123456", "Ionescu", "Maria", CTOD("15/03/2012"), CTOD("22/04/1991"))
INSERT INTO angajati VALUES ("1881125123456", "Avram", "Andrei", CTOD("20/09/2008"), CTOD("25/11/1988"))
INSERT INTO angajati VALUES ("2920429123456", "Muresan", "Elena", CTOD("01/06/2018"), CTOD("29/04/1992"))
INSERT INTO angajati VALUES ("1850707123456", "Balan", "Radu", CTOD("12/01/2009"), CTOD("07/07/1985"))
INSERT INTO angajati VALUES ("2940429123456", "Dumitru", "Ana", CTOD("30/11/2015"), CTOD("29/04/1994"))
INSERT INTO angajati VALUES ("1870303123456", "Stan", "Mihai", CTOD("05/04/2011"), CTOD("03/03/1987"))
INSERT INTO angajati VALUES ("2961212123456", "Marin", "Ioana", CTOD("18/08/2020"), CTOD("12/12/1996"))
INSERT INTO angajati VALUES ("1830202123456", "Georgescu", "Paul", CTOD("25/02/2007"), CTOD("02/02/1983"))
INSERT INTO angajati VALUES ("2950429123456", "Vasile", "Cristina", CTOD("14/07/2019"), CTOD("29/04/1995"))

CLEAR

? "Angajati cu vechime mai mare de 10 ani:"
? "---------------------------------------"

GO TOP
DO WHILE !EOF()
    IF YEAR(DATE()) - YEAR(Data_angajarii) > 10
        ? CNP, Nume, Prenume, Data_angajarii
    ENDIF
    SKIP
ENDDO

?
? "Angajati care isi sarbatoresc ziua de nastere astazi:"
? "-----------------------------------------------------"

GO TOP
DO WHILE !EOF()
    IF DAY(Data_nasterii) = DAY(DATE()) AND MONTH(Data_nasterii) = MONTH(DATE())
        ? CNP, Nume, Prenume, Data_nasterii
    ENDIF
    SKIP
ENDDO
