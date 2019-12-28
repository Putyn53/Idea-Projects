-- Table: Lekarstwo
CREATE TABLE Lekarstwo (
    Idlekarstwo int  NOT NULL AUTO_INCREMENT,
    Nazwa_lekarstwo varchar(50)  NOT NULL,
    CONSTRAINT Lekarstwo_pk PRIMARY KEY (Idlekarstwo)
);

-- Table: Lekarz
CREATE TABLE Lekarz (
    Idlekarz int  NOT NULL AUTO_INCREMENT,
    Imie varchar(50)  NOT NULL,
    Nazwisko varchar(50)  NOT NULL,
    Nr_ewidencyjny varchar(12)  NOT NULL,
    CONSTRAINT Lekarz_pk PRIMARY KEY (Idlekarz)
);

-- Table: Pacjent
CREATE TABLE Pacjent (
    Idpacjent int  NOT NULL AUTO_INCREMENT,
    Imie varchar(50)  NOT NULL,
    Nazwisko varchar(50)  NOT NULL,
    PESEL varchar(11)  NOT NULL,
    Adres varchar(50)  NOT NULL,
    CONSTRAINT Pacjent_pk PRIMARY KEY (Idpacjent)
);

-- Table: Postac_produkt
CREATE TABLE Postac_produkt (
    Idpostac int  NOT NULL AUTO_INCREMENT,
    Nazwa_postac varchar(20)  NOT NULL,
    CONSTRAINT Postac_produkt_pk PRIMARY KEY (Idpostac)
);

-- Table: Producent
CREATE TABLE Producent (
    Idproducent int  NOT NULL AUTO_INCREMENT,
    Nazwa_producent varchar(50)  NOT NULL,
    Adres varchar(50)  NOT NULL,
    CONSTRAINT Producent_pk PRIMARY KEY (Idproducent)
);

-- Table: Produkt
CREATE TABLE Produkt (
    Idprodukt int  NOT NULL AUTO_INCREMENT,
    Nazwa_produkt varchar(50)  NOT NULL,
    Idproducent int  NOT NULL,
    Idlekarstwo int  NOT NULL,
    Idpostac int  NOT NULL,
    CONSTRAINT Produkt_pk PRIMARY KEY (Idprodukt)
);

-- Table: Recepta
CREATE TABLE Recepta (
    Idrecepta int  NOT NULL AUTO_INCREMENT,
    Nr_recepta varchar(20)  NOT NULL,
    Idlekarz int  NOT NULL,
    Idpacjent int  NOT NULL,
    Data_wystawienia date  NOT NULL,
    Data_wygasniecia date  NULL,
    CONSTRAINT Recepta_pk PRIMARY KEY (Idrecepta)
);

-- Table: Recepta_Lekarstwo
CREATE TABLE Recepta_Lekarstwo (
    Idrec_lek int  NOT NULL AUTO_INCREMENT,
    Idrecepta int  NOT NULL,
    Idlekarstwo int  NOT NULL,
    CONSTRAINT Recepta_Lekarstwo_pk PRIMARY KEY (Idrec_lek)
);

-- foreign keys
-- Reference: Produkt_Lekarstwo (table: Produkt)
ALTER TABLE Produkt ADD CONSTRAINT Produkt_Lekarstwo
    FOREIGN KEY (Idlekarstwo)
    REFERENCES Lekarstwo (Idlekarstwo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Produkt_Postac_lekarstwo (table: Produkt)
ALTER TABLE Produkt ADD CONSTRAINT Produkt_Postac_lekarstwo
    FOREIGN KEY (Idpostac)
    REFERENCES Postac_produkt (Idpostac)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Produkt_Producent (table: Produkt)
ALTER TABLE Produkt ADD CONSTRAINT Produkt_Producent
    FOREIGN KEY (Idproducent)
    REFERENCES Producent (Idproducent)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recepta_Lekarstwo_Lekarstwo (table: Recepta_Lekarstwo)
ALTER TABLE Recepta_Lekarstwo ADD CONSTRAINT Recepta_Lekarstwo_Lekarstwo
    FOREIGN KEY (Idlekarstwo)
    REFERENCES Lekarstwo (Idlekarstwo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recepta_Lekarstwo_Recepta (table: Recepta_Lekarstwo)
ALTER TABLE Recepta_Lekarstwo ADD CONSTRAINT Recepta_Lekarstwo_Recepta
    FOREIGN KEY (Idrecepta)
    REFERENCES Recepta (Idrecepta)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recepta_Lekarz (table: Recepta)
ALTER TABLE Recepta ADD CONSTRAINT Recepta_Lekarz
    FOREIGN KEY (Idlekarz)
    REFERENCES Lekarz (Idlekarz)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: Recepta_Pacjent (table: Recepta)
ALTER TABLE Recepta ADD CONSTRAINT Recepta_Pacjent
    FOREIGN KEY (Idpacjent)
    REFERENCES Pacjent (Idpacjent)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;
-- Creation of
-- End of file.

