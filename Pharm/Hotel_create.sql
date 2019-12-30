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
                            Pokoj_Idpokoj int  NOT NULL,
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
    FOREIGN KEY (Pokoj_Idpokoj)
        REFERENCES Pokoj (Idpokoj);