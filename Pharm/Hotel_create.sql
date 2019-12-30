-- Table: Hotel
CREATE TABLE Hotel (
                       Idhotel int  NOT NULL,
                       Nazwa_hotelu varchar2(50)  NOT NULL,
                       Idmiasto int  NOT NULL,
                       CONSTRAINT Hotel_pk PRIMARY KEY (Idhotel)
) ;

-- Table: Klient
CREATE TABLE Klient (
                        Idklient int  NOT NULL,
                        Imie varchar2(50)  NOT NULL,
                        Nazwisko varchar2(50)  NOT NULL,
                        Nr_dowodu varchar2(9)  NOT NULL,
                        CONSTRAINT Klient_pk PRIMARY KEY (Idklient)
) ;

-- Table: Miasto
CREATE TABLE Miasto (
                        Idmiasto int  NOT NULL,
                        Nazwa_miasto varchar2(50)  NOT NULL,
                        Idwojew int  NOT NULL,
                        CONSTRAINT Miasto_pk PRIMARY KEY (Idmiasto)
) ;

-- Table: Platnosc
CREATE TABLE Platnosc (
                          Idplatnosc int  NOT NULL,
                          Nazwa_platnosci varchar2(10)  NOT NULL,
                          CONSTRAINT Platnosc_pk PRIMARY KEY (Idplatnosc)
) ;

-- Table: Pokoj
CREATE TABLE Pokoj (
                       Idpokoj int  NOT NULL,
                       Nr_pokoju varchar2(8)  NOT NULL,
                       Cena_dzien float(6)  NOT NULL,
                       Rozmiar int  NOT NULL,
                       Idstandard int  NOT NULL,
                       Idhotel int  NOT NULL,
                       CONSTRAINT Pokoj_pk PRIMARY KEY (Idpokoj)
) ;

-- Table: Rezerwacja
CREATE TABLE Rezerwacja (
                            IdRezerwacja int  NOT NULL,
                            Idklient int  NOT NULL,
                            Data_zameldowania date  NOT NULL,
                            Data_wymeldowania date  NOT NULL,
                            Idplatnosc int  NOT NULL,
                            Data_platnosci date  NOT NULL,
                            Idpokoj int  NOT NULL,
                            CONSTRAINT Rezerwacja_pk PRIMARY KEY (IdRezerwacja)
) ;

-- Table: Standard
CREATE TABLE Standard (
                          Idstandard int  NOT NULL,
                          Nazwa_standard varchar2(50)  NOT NULL,
                          CONSTRAINT Standard_pk PRIMARY KEY (Idstandard)
) ;

-- Table: Wojewodztwo
CREATE TABLE Wojewodztwo (
                             Idwojew int  NOT NULL,
                             Nazwa_wojew varchar2(50)  NOT NULL,
                             CONSTRAINT Wojewodztwo_pk PRIMARY KEY (Idwojew)
) ;

-- foreign keys
-- Reference: Hotel_Miasto (table: Hotel)
ALTER TABLE Hotel ADD CONSTRAINT Hotel_Miasto
    FOREIGN KEY (Idmiasto)
        REFERENCES Miasto (Idmiasto);

-- Reference: Miasto_Wojewodztwo (table: Miasto)
ALTER TABLE Miasto ADD CONSTRAINT Miasto_Wojewodztwo
    FOREIGN KEY (Idwojew)
        REFERENCES Wojewodztwo (Idwojew);

-- Reference: Pokoj_Hotel (table: Pokoj)
ALTER TABLE Pokoj ADD CONSTRAINT Pokoj_Hotel
    FOREIGN KEY (Idhotel)
        REFERENCES Hotel (Idhotel);

-- Reference: Pokoj_Standard (table: Pokoj)
ALTER TABLE Pokoj ADD CONSTRAINT Pokoj_Standard
    FOREIGN KEY (Idstandard)
        REFERENCES Standard (Idstandard);

-- Reference: Rezerwacja_Klient (table: Rezerwacja)
ALTER TABLE Rezerwacja ADD CONSTRAINT Rezerwacja_Klient
    FOREIGN KEY (Idklient)
        REFERENCES Klient (Idklient);

-- Reference: Rezerwacja_Platnosc (table: Rezerwacja)
ALTER TABLE Rezerwacja ADD CONSTRAINT Rezerwacja_Platnosc
    FOREIGN KEY (Idplatnosc)
        REFERENCES Platnosc (Idplatnosc);

-- Reference: Rezerwacja_Pokoj (table: Rezerwacja)
ALTER TABLE Rezerwacja ADD CONSTRAINT Rezerwacja_Pokoj
    FOREIGN KEY (Idpokoj)
        REFERENCES Pokoj (Idpokoj);

INSERT INTO WOJEWODZTWO (IDWOJEW, NAZWA_WOJEW) VALUES ('1', 'mazowieckie');
INSERT INTO WOJEWODZTWO (IDWOJEW, NAZWA_WOJEW) VALUES ('2', 'lubuskie');
INSERT INTO WOJEWODZTWO (IDWOJEW, NAZWA_WOJEW) VALUES ('3', 'pomorskie');
INSERT INTO WOJEWODZTWO (IDWOJEW, NAZWA_WOJEW) VALUES ('4', 'lubelskie');
INSERT INTO WOJEWODZTWO (IDWOJEW, NAZWA_WOJEW) VALUES ('5', 'kujawsko-pomorskie');

INSERT INTO MIASTO (IDMIASTO, NAZWA_MIASTO, IDWOJEW) VALUES ('1', 'Warszawa', '1');
INSERT INTO MIASTO (IDMIASTO, NAZWA_MIASTO, IDWOJEW) VALUES ('2', 'Bydgoszcz', '1');
INSERT INTO MIASTO (IDMIASTO, NAZWA_MIASTO, IDWOJEW) VALUES ('3', 'Kraków', '2');
INSERT INTO MIASTO (IDMIASTO, NAZWA_MIASTO, IDWOJEW) VALUES ('4', 'Lubeczyn', '3');
INSERT INTO MIASTO (IDMIASTO, NAZWA_MIASTO, IDWOJEW) VALUES ('5', 'Toruń', '3');
INSERT INTO MIASTO (IDMIASTO, NAZWA_MIASTO, IDWOJEW) VALUES ('6', 'Piaseczno', '5');
INSERT INTO MIASTO (IDMIASTO, NAZWA_MIASTO, IDWOJEW) VALUES ('7', 'Legionowo', '4');
INSERT INTO MIASTO (IDMIASTO, NAZWA_MIASTO, IDWOJEW) VALUES ('8', 'Marysin', '2');

INSERT INTO HOTEL (IDHOTEL, NAZWA_HOTELU, IDMIASTO) VALUES ('1', 'Continental', '1');
INSERT INTO HOTEL (IDHOTEL, NAZWA_HOTELU, IDMIASTO) VALUES ('2', 'Hilton', '2');
INSERT INTO HOTEL (IDHOTEL, NAZWA_HOTELU, IDMIASTO) VALUES ('3', 'Maroni', '3');
INSERT INTO HOTEL (IDHOTEL, NAZWA_HOTELU, IDMIASTO) VALUES ('4', 'Falcone', '4');
INSERT INTO HOTEL (IDHOTEL, NAZWA_HOTELU, IDMIASTO) VALUES ('5', 'Tipton', '5');
INSERT INTO HOTEL (IDHOTEL, NAZWA_HOTELU, IDMIASTO) VALUES ('6', 'Hotelx', '1');

INSERT INTO STANDARD (IDSTANDARD, NAZWA_STANDARD) VALUES ('1', 'Low');
INSERT INTO STANDARD (IDSTANDARD, NAZWA_STANDARD) VALUES ('2', 'Normal');
INSERT INTO STANDARD (IDSTANDARD, NAZWA_STANDARD) VALUES ('3', 'High');

INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('1', 'A05', '131', '3', '2', '1');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('2', '006', '90', '1', '1', '2');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('3', '008', '50', '1', '1', '3');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('4', '001', '110', '2', '1', '4');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('5', 'A05', '500', '6', '3', '5');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('6', '5', '21', '1', '1', '1');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('7', '708', '31', '1', '1', '2');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('8', '1111', '12', '2', '1', '3');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('9', '1234', '412', '5', '2', '4');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('10', '142', '53', '2', '1', '5');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('11', 'B06', '23', '1', '1', '1');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('12', '987', '234', '3', '3', '2');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('13', 'C1', '100', '2', '1', '3');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('14', 'A1', '250', '4', '3', '4');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('15', 'A2', '100', '2', '2', '5');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('16', 'A1', '50', '1', '1', '1');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('17', '58', '100', '6', '2', '5');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('18', '789', '400', '2', '3', '2');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('19', '012', '20', '1', '1', '3');
INSERT INTO POKOJ (IDPOKOJ, NR_POKOJU, CENA_DZIEN, ROZMIAR, IDSTANDARD, IDHOTEL) VALUES ('20', '1500', '600', '5', '3', '4');

INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('1', 'Kacper', 'Putynkowski', 'ABC123456');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('2', 'Tomek', 'Kosztowny', 'BCD234567');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('3', 'Kamila', 'Rutkowiecz', 'CDE345678');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('4', 'Patrycja', 'Kwiatek', 'DEF456789');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('5', 'Milosz', 'Treichel', 'EFG567890');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('6', 'Kamil', 'Urodny', 'FGH678901');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('7', 'Marcin', 'Jonski', 'GHI789012');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('8', 'Cezary', 'Baryka', 'HIJ890123');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('9', 'Aleksander', 'Masny', 'IJK901234');
INSERT INTO KLIENT (IDKLIENT, IMIE, NAZWISKO, NR_DOWODU) VALUES ('10', 'Marta', 'Igliwia', 'JKL012345');

INSERT INTO PLATNOSC (IDPLATNOSC, NAZWA_PLATNOSCI) VALUES ('1', 'Gotowka');
INSERT INTO PLATNOSC (IDPLATNOSC, NAZWA_PLATNOSCI) VALUES ('2', 'Karta');
INSERT INTO PLATNOSC (IDPLATNOSC, NAZWA_PLATNOSCI) VALUES ('3', 'Blik');
INSERT INTO PLATNOSC (IDPLATNOSC, NAZWA_PLATNOSCI) VALUES ('4', 'Przelew');
INSERT INTO REZERWACJA (IDREZERWACJA, IDKLIENT, DATA_ZAMELDOWANIA, DATA_WYMELDOWANIA, IDPLATNOSC, DATA_PLATNOSCI, IDPOKOJ)
VALUES (1,1,TO_DATE('12/01/2020', 'DD/MM/YYYY'),TO_DATE('15/01/2020', 'DD/MM/YYYY'),1,TO_DATE('11/01/2020', 'DD/MM/YYYY'),1);






