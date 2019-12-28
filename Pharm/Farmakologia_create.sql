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
    Nr_ewidencyjny varchar(6)  NOT NULL,
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
-- Inserting Values
INSERT INTO Pacjent (Imie, Nazwisko, PESEL, Adres)
VALUES
('Kazimierz', 'Kowalski', '12345678901', 'Zlota 59, 00-120 Warszawa'),
('Luke', 'Skywalker', '23456789012', 'Pustynia 35, 35-000 Jakku'),
('Han', 'Solo', '34567890123', 'Hangar 35, 99-900 Hoth'),
('Radanat', 'Walko', '45678901234', 'Mulacka 1, 00-000 Nigdzie'),
('Garosh', 'Hellscream', '56789012345', 'Dolina Honoru, 03-130 Orgrimmar'),
('Renfri', 'Blacksun', '67890123456', 'Rynek 21, 59-138 Blaviken');

INSERT INTO Lekarz (Imie, Nazwisko, Nr_ewidencyjny)
VALUES
('Tyrande', 'Whisperwind', '000001'),
('Malfurion', 'Stormrage', '000012'),
('Anduin', 'Wrynn', '000123'),
('Angela', 'Zieger', '001234'),
('Doktor', 'House', '012345');

INSERT INTO Lekarstwo (Nazwa_lekarstwo)
VALUES
('Pentanol'),
('Skorokrzew'),
('Widrygol'),
('Golden Apple'),
('NukaCola'),
('Immanatol'),
('Sektaris'),
('Mewa'),
('Grom');

INSERT INTO Producent (Nazwa_producent, Adres)
VALUES
('Umbrella', 'End of the world 21'),
('Bialogon', 'Zakret 21, Temeria'),
('GnomHeal', 'Mountain 31, Gnomeregan');

INSERT INTO Postac_produkt (Nazwa_postac)
VALUES
('Żel'),
('Proszek'),
('Tabletka'),
('Roslina'),
('Mikstura');

INSERT INTO Produkt (Nazwa_produkt, Idproducent, Idlekarstwo, Idpostac)
VALUES
('Ibuprom', 1, 1, 3),
('Henol', 1, 2, 2),
('Sepson', 1, 3, 5),
('Strepsils', 4, 1, 3),
('Xylogel', 2, 5, 1),
('Xylothan', 2, 6, 5),
('Svenologel', 3, 7, 4),
('Tranix', 2, 8, 4),
('Theraflu', 3, 1, 2),
('Health Potion', 3, 2, 5),
('Pikaxium', 3, 3, 4),
('Seiogen', 2, 9, 2),
('Emeraldian', 1, 9, 1),
('Nurofen', 2, 6, 2),
('Etopiryna', 2, 5, 1),
('Raviscron', 3, 2, 2),
('Mikron Night', 1, 2, 4),
('Ibuprom Noc', 1, 4, 5),
('K2C', 3, 4, 1),
('ITN', 1, 7, 2),
('Semiraklum', 2, 6, 3),
('Easilium', 2, 8, 3),
('Hexogrom', 2, 1, 4),
('Mewian', 1, 2, 5);

INSERT INTO Recepta (Nr_recepta, Idlekarz, Idpacjent)
VALUES
('A0457', 1, 2),
('A0123', 1, 1),
('A0345', 2, 3),
('A0453', 3, 1),
('A0457', 4, 6),
('A0987', 5, 5),
('A0412', 5, 4),
('A0897', 5, 1),
('A2345', 4, 5);

INSERT INTO Recepta_Lekarstwo(Idrecepta, Idlekarstwo)
VALUES
(1,2),
(2,3),
(4,5),
(3,2),
(4,4),
(1,3),
(1,1),
(2,3),
(4,4),
(6,1),
(4,3),
(6,1),
(2,3),
(1,4),
(3,5),
(1,6),
(5,1),
(4,2),
(5,3),
(2,4),
(1,5);

-- End of file.

