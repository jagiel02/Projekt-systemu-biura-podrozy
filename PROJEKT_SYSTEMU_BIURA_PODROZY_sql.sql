DROP TABLE IF EXISTS Uzytkownik;
DROP TABLE IF EXISTS Reklama;
DROP TABLE IF EXISTS TypKonta;
DROP TABLE IF EXISTS Wiadomosc;
DROP TABLE IF EXISTS WycieczkaPlatnosc;
DROP TABLE IF EXISTS SprzedazUbezpieczenia;
DROP TABLE IF EXISTS WyslanieReklamy;
DROP TABLE IF EXISTS Klient;
DROP TABLE IF EXISTS Wycieczka;
DROP TABLE IF EXISTS Ubezpieczenie;
DROP TABLE IF EXISTS RodzajUbezpieczenia;
DROP TABLE IF EXISTS Kontynent;
DROP TABLE IF EXISTS Kraj;
DROP TABLE IF EXISTS Miasto;
DROP TABLE IF EXISTS Lotnisko;
DROP TABLE IF EXISTS Hotel;


CREATE TABLE Uzytkownik(
    UzytkownikID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Imie VARCHAR(100) NOT NULL,
    Nazwisko VARCHAR(100) NOT NULL,
    Pesel VARCHAR(11) NOT NULL,
    NumerTelefonu VARCHAR(100) NOT NULL,
    Login VARCHAR(25) NOT NULL,
    Haslo VARCHAR(255) NOT NULL,
    TypKontaID INT NOT NULL,
    FOREIGN KEY (TypKontaID) REFERENCES TypKonta(TypKontaId)
);

CREATE TABLE TypKonta(
    TypKontaId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NazwaTypu VARCHAR(100) NOT NULL
);
 
CREATE TABLE REKLAMA(
    REKLAMAID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    TEMAT VARCHAR(100) NOT NULL,
    TRESC VARCHAR(100) NOT NULL,
    DATAWYSLANIA DATE NOT NULL,
    UzytkownikID INT NOT NULL,
    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownik(UzytkownikID)
);


CREATE TABLE WyslanieReklamy(
    WyslanieReklamyID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    DataWyslania DATE NOT NULL,
    WyslanieSukces BIT,
    ReklamaID INT NOT NULL,
    FOREIGN KEY (ReklamaID) REFERENCES REKLAMA(REKLAMAID)
);



CREATE TABLE Wiadomosc(
    WiadomoscID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Temat VARCHAR(100) NOT NULL,
    Tresc VARCHAR(100) NOT NULL,
    UzytkownikID INT NOT NULL,
    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownik(UzytkownikID)
);


CREATE TABLE Klient(
    KlientID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Imie VARCHAR(100) NOT NULL,
    Nazwisko VARCHAR(100) NOT NULL,
    Pesel VARCHAR(11) NOT NULL,
    Adres VARCHAR(255) NOT NULL,
    NumerTelefonu VARCHAR(100) NOT NULL,
    Email VARCHAR(100)
);


CREATE TABLE RodzajUbezpieczenia(
    RodzajUbezpieczeniaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NazwaRodzaju VARCHAR(100) NOT NULL
);


CREATE TABLE Ubezpieczenie(
    UbezpieczenieID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KwotaUbezpieczenia DECIMAL(10,2) NOT NULL,
    CzasTrwaniaWDniach INT NOT NULL,
    RodzajUbezpieczeniaID INT NOT NULL,
    FOREIGN KEY (RodzajUbezpieczeniaID) REFERENCES RodzajUbezpieczenia(RodzajUbezpieczeniaID)
);

CREATE TABLE SprzedazUbezpieczenia(
    SprzedazUbezpieczeniaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    DataWaznosciOd DATE NOT NULL,
    DataWaznosciDo DATE NOT NULL,
    UzytkownikID INT NOT NULL,
    KlientID INT NOT NULL,
    UbezpieczenieID INT NOT NULL,
    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownik(UzytkownikID),
    FOREIGN KEY (KlientID) REFERENCES Klient(KlientID),
    FOREIGN KEY (UbezpieczenieID) REFERENCES Ubezpieczenie(UbezpieczenieID)
);

CREATE TABLE Kontynent(
    KontynentID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NazwaKontynentu VARCHAR(100) NOT NULL
);

CREATE TABLE Kraj(
    KrajID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NazwaKraju VARCHAR(100),
    KontynentID INT NOT NULL,
    FOREIGN KEY (KontynentID) REFERENCES Kontynent(KontynentID)
);

CREATE TABLE Miasto(
    MiastoID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NazwaMiasta VARCHAR(100) NOT NULL,
    KrajID INT NOT NULL,
    FOREIGN KEY (KrajID) REFERENCES Kraj(KrajID)
);


CREATE TABLE Hotel(
    HotelID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nazwa VARCHAR(100) NOT NULL,
    Adres VARCHAR(255) NOT NULL,
    MiastoID INT NOT NULL,
    FOREIGN KEY (MiastoID) REFERENCES Miasto(MiastoID)
);

CREATE TABLE Lotnisko(
    LotniskoID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nazwa VARCHAR(100) NOT NULL,
    MiastoID INT NOT NULL,
    FOREIGN KEY (MiastoID) REFERENCES Miasto(MiastoID)
);


CREATE TABLE Wycieczka(
    WycieczkaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NazwaWycieczki VARCHAR(100) NOT NULL,
    DataWaznosciRozpoczecie DATE NOT NULL,
    DataWaznosciZakonczenie DATE NOT NULL,
    CzasTrwaniaDni INT NOT NULL,
    DoZatwierdzenia BIT,
    UzytkownikID INT NOT NULL,
    HotelID INT NOT NULL,
    LotniskoID INT NOT NULL,
    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownik(UzytkownikID),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
    FOREIGN KEY (LotniskoID) REFERENCES Lotnisko(LotniskoID)
);

CREATE TABLE WycieczkaPlatnosc(
    WycieczkaPlatnoscID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    KwotaZaplacona DECIMAL(10,2) NOT NULL,
    KwotaPozostala DECIMAL(10,2) NOT NULL,
    TerminPlatnosci DATE NOT NULL,
    CzyZaleglosc BIT,
    UzytkownikID INT NOT NULL,
    KlientID INT NOT NULL,
    WycieczkaID INT NOT NULL,
    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownik(UzytkownikID),
    FOREIGN KEY (KlientID) REFERENCES Klient(KlientID),
    FOREIGN KEY (WycieczkaID) REFERENCES Wycieczka(WycieczkaID)
);



