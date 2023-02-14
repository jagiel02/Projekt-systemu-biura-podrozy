# PROJEKT SYSTEMU BIURA PODRÓŻY

## *Projekt przedstawia przykładowy model bazy danych systemu biura podróży*

**Model logiczny bazy danych – diagram ERD**

Diagram związków encji ERD (Rys. 1.1) jest graficzną prezentacją struktury danych wraz z relacjami danego systemu informatycznego. Można z niego wyczytać jakie informacje będą przechowywane w systemie, a także w jaki sposób będą ze sobą powiązane.

![](https://i.imgur.com/DV4Sw6L.png)

<p> Rys 1.1: Diagram związków encji ERD </p>
<br>

**Projekt systemu**

System to nazwana, zdefiniowana i współdziałająca kolekcja faktów, procedur i procesów, łącznie z organizacją ludzi, maszyn, różnych mechanizmów i innych zasobów, które te procedury i procesy wykonują. Projekt fizyczny struktury bazy danych jest ostatnim etapem przed przystąpieniem do budowy i dostarczenia systemu.

## 2.1. Projekt obiektów bazy danych.

### 2.1.1. Model fizyczny bazy danych

Model fizyczny bazy danych (Rys. 2.1) w porównaniu do modelu logicznego zawiera fizyczne elementy struktury bazy. Możemy zaobserwować tu wyszczególnione klucze główne oznaczone literką „P”, klucze obce „F” oraz indeksy. Z modelu możemy także wyczytać dokładne typy danych występujące w tabelach.

![](https://i.imgur.com/Mxoe7fK.png)
<p> Rys. 2.1 Model fizyczny bazy danych </p>
<br>


---
 **Tabela TypKonta (Tab. 2.1)** \
 Przeznaczona do przechowywania informacji o typach kątach dostępnych w bazie danych. Tabela zawiera TypKontaID, NazwaTypu, oraz klucz obcy UzytkownikID z tabeli Uzytkownik. 




**Opis pól:**

* TypKontaID – klucz główny tabeli

* NazwaTypu – nazwa typu konta

* UzytkownikID – klucz obcy z tabeli Uzytkownik 

<br>

**Tab 2.1 Struktura tabeli TypKonta**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|TypKontaID|INT|No|- |PK|
|NazwaTypu|VARCHAR(100)|No|- |- |
|UzytkownikID|INT|No|-|FK|


SQL: 

```sql
CREATE TABLE TypKonta(

    TypKontaId INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    NazwaTypu varchar(100) NOT NULL

);
```
-----

**Tabela Uzytkownik (Tab. 2.2)** \
przeznaczona do przechowywania informacji o użytkownikach dostępnych w bazie danych. Tabela zawiera imię, nazwisko, pesel, numer telefonu, login, hasło, oraz klucz obcy TypKontaID, z tabeli TypKonta. 

**Opis pól:** 

* UzytkownikID – klucz główny tabeli

* Imie – imie użytkownika

* Nazwisko – nazwisko użytkownika

* Pesel – pesel użytkownika

* NumerTelefonu – numer telefonu użytkownika

* Login – login użytkownika

* Haslo – haslo użytkownika

* TypKontaID – klucz obcy z tabeli TypKonta

<br>
Tab. 2.2 Struktura tabeli Uzytkownik

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|UzytkownikID|INT|No|- |PK|
|Imie|VARCHAR2(100)|No|- |- |
|<p>Nazwisko</p><p></p>|VARCHAR(100)|No|- |- |
|Pesel|VARCHAR(100)|No|-|<p></p><p>-</p><p></p>|
|NumerTelefonu|VARCHAR(100)|No|-|-|
|<p></p><p>Login</p>|VARCHAR(25)|No|-|-|
|Haslo|VARCHAR(255)|No|-|-|
|TypKontaID|INT|No|-|FK|

**SQL:**

```sql
CREATE TABLE Uzytkownik (

    UZYTKOWNIKID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    IMIE VARCHAR(100) NOT NULL,

    NAZWISKO VARCHAR(100) NOT NULL,

    PESEL VARCHAR(11) NOT NULL UNIQUE,

    NUMERTELEFONU VARCHAR(100) NOT NULL,

    LOGIN VARCHAR(25) NOT NULL,

    HASLO VARCHAR(255) NOT NULL,

    TypKontaID INT NOT NULL,

    FOREIGN KEY (TypKontaID) REFERENCES TypKonta(TypKontaId)

);
```
------
**Tabela Reklama (Tab. 2.3)**\
Przeznaczona jest do przechowywania informacji o reklamach dostępnych bazie danych. Tabela zawiera temat, treść, datę wysłania, oraz klucz obcy UzytkownikID z tabeli Uzytkownik.

**Opis pól:**

* ReklamaID – klucz główny tabeli

* Temat – temat reklamy

* Tresc – tresc reklamy

* DataWyslania – data wyslania reklamy

* UzytkownikID – klucz obcy z tabeli Uzytkownik
<br>

**Tab 2.3 Struktura tabeli Reklama**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|ReklamaID|INT|No|- |PK|
|Temat|VARCHAR(100)|No|- |- |
|Tresc|VARCHAR(100)|No|- |- |
|DataWyslania|DATE|No|-|<p></p><p>-</p><p></p>|
|UzytkownikID|INT|No|-|FK|


**SQL:**
```sql
CREATE TABLE Reklama(

    ReklamaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    Temat VARCHAR(100) NOT NULL,

    Tresc VARCHAR(100) NOT NULL,

    DataWyslania DATE NOT NULL,

    UzytkownikID INT NOT NULL,

    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownik(UzytkownikID)

);
```
-----
**Tabela WyslanieReklamy (tab. 2.4)**\
 przeznaczona do przechowywania informacji o wysłanych reklamach dostępnych w bazie danych. Tabela zawiera WyslanieReklamyID, DataWyslania, WyslanieSukces, oraz klucz obcy ReklamaID z tabeli Reklama.

**Opis pol:**

* WyslanieReklamyID – klucz główny tabeli

* DataWyslania, - data wysłania reklamy

* WyslanieSukces – czy reklama została wysłana

* ReklamaID – klucz obcy z tabeli Reklama
<br>

**Tab 2.4 Struktura tabeli WyslanieReklamy**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|WyslanieReklamyID|INT|No|- |PK|
|DataWyslania|DATE|No|- |- |
|<p>WyslanieSukces</p><p></p>|BIT|No|- |- |
|ReklamaID|INT|No|-|FK|


**SQL:**
```sql
CREATE TABLE WyslanieReklamy(

    WyslanieReklamyID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    DataWyslania DATE NOT NULL,

    WyslanieSukces BIT

    ReklamaID INT NOT NULL,

    FOREIGN KEY (ReklamaID) REFERENCES REKLAMA(REKLAMAID)

);
```
-----
**Tabela Wiadomosc (Tab. 2.5)**\
 Przeznaczona do przechowywania informacji o wiadomościach, dostępnych w bazie danych. Tabela zawiera WiadomoscID, Temat, Tresc, oraz klucz obcy UzytkownikID z tabeli Uzytkownik.

**Opis pól:**

* WiadomoscID – klucz głowny tabeli

* Temat – temat wiadomości

* Tresc – treści wiadomości

* UzytkownikID – klucz obcy z tabeli Uzytkownik
<br>


**Tab 2.5 Struktura tabeli Wiadomosc**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|WiadomoscID|INT|No|- |PK|
|TEMAT|VARCHAR(100)|No|- |- |
|<p>Tresc</p><p></p>|VARCHAR(100)|No|- |- |
|UzytkownikID|INT|No|-|FK|


**SQL:**

```sql
CREATE TABLE Wiadomosc(

    WiadomoscID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    Temat VARCHAR(100) NOT NULL,

    Tresc VARCHAR(100) NOT NULL,	

    UzytkownikID INT NOT NULL,

    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownik(UzytkownikID)

    );

```
-----
**Tabela Klient (Tab. 2.6)**\
 Przeznaczona do przechowywania informacji o klientach dostępnych w bazie danych. Tabela zawiera KlientID, Imie, Nazwisko, Pesel, Adres, NumerTelefonu, Email.

**Opis pól:**

* KlientID – klucz główny tabeli

* Imie – imie klienta

* Nazwisko – nazwisko klienta

* Pesel – pesel klienta

* Adres – ades klienta

* NumerTelefonu – numer telefonu klienta

* Email – email klienta
<br>

**Tab 2.6 Struktura tabeli Klient**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|KlientID|INT|No|- |PK|
|Imie|VARCHAR(100)|No|- |- |
|<p>Nazwisko</p><p></p>|VARCHAR(100)|No|- |- |
|Pesel|VARCHAR(100)|No|-|<p></p><p>-</p><p></p>|
|Adres|VARCHAR(255)|No|-|-|
|<p></p><p>NumerTelefonu</p>|VARCHAR(25)|No|-|-|
|Email|VARCHAR(100)|No|-|-|


**SQL:**
```sql
CREATE TABLE Klient(

    KlientID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    Imie VARCHAR(100) NOT NULL,

    Nazwisko VARCHAR(100) NOT NULL,

    Pesel VARCHAR(11) NOT NULL,

    Adres VARCHAR(255) NOT NULL,

    NumerTelefonu VARCHAR(100) NOT NULL,

    Email VARCHAR(100) NOT NULL

);
```
---

**Tabela (Tab. 2.7)**\
 Przeznaczona do przechowywania informacji o rodzajach ubezpieczenia w bazie danych. Tabela zawiera RodzajeUbezpieczeniaID, NazwaRodzaju.

**Opis pól:**

* RodzajeUbezpieczeniaID – klucz główny tabeli 

* NazwaRodzaju – nazwa rodzaju ubezpieczenia
<br>

**Tab 2.7 Struktura tabeli RodzajUbezpieczenia**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|RodzajUbezpieczeniaID|INT|No|- |PK|
|NazwaRodzaju|VARCHAR(100)|No|- |- |\




**SQL:**

```sql
CREATE TABLE RodzajUbezpieczenia(

    RodzajUbezpieczeniaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    NazwaRodzaju VARCHAR(100) NOT NULL

);
```
---
**Tabela (tab. 2.8)**\
 Przeznaczona do przechowywania informacji o ubezpieczeniach w bazie danych. Tabela zawiera UbezpieczenieID, KwotaUbezpieczenia, CzasTrwaniaWDniach, oraz klucz obcy RodzajUbezpieczeniaID, z tabeli RodzajUbezpieczenia.

**Opis pól:**

* UbezpieczenieID – klucz główny tabeli 

* KwotaUbezpieczenia – Kwota ubezpieczenia

* CzasTrwaniaWDniach – Czas trwania ubezpieczenia w dniach

* RodzajUbezpieczeniaID – klucz obcy z tabeli RodzajUbezpieczenia
<br>




**Tabela 2.8 Ubezpieczenie**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|UbezpieczenieID|INT|No|- |PK|
|KwotaUbezpieczenia|DECIMAL(10,2)|No|- |- |
|<p>CzasTrwaniaWDniach</p><p></p>|INT|No|- |- |
|RodzajUbezpieczenia|INT|No|-|FK|


**SQL:**
```sql
CREATE TABLE Ubezpieczenie(

    UbezpieczenieID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    KwotaUbezpieczenia DECIMAL(10,2) NOT NULL,

    CzasTrwaniaWDniach INT NOT NULL

    RodzajUbezpieczeniaID INT NOT NULL,

    FOREIGN KEY (RodzajUbezpieczeniaID) REFERENCES RodzajUbezpieczenia(RodzajUbezpieczeniaID)

);
```
---
**Tabela SprzedazUbezpieczenie (Tab. 2.9)**\
 Przeznaczona do przechowywania informacji o sprzedażach ubezpieczeń dostępnych w bazie danych. Tabela zawiera SprzedazUbezpieczeniaID, DataWaznosciOd, DataWaznosciDo, oraz klucze obce UzytkownikID z tabeli Uzytkownik, KlientID z tabeli Klient i UbezpieczenieID z tabeli Ubezpieczenie.


**Opis pól:**

* SprzedazUbezpieczeniaID – klucz główny

* DataWaznosciOd – data ważnośći ubezpieczenia od

* DataWaznosciDo – data ważnośći ubezpieczenia do

* UzytkownikID – klucz obcy z tabeli Uzytkownik

* KlientID – klucz obcy z tabeli Klient

* UbezpieczenieID – klucz obcy z tabeli Ubezpieczenie
<br>


**Tab 2.9 Struktura tabeli SprzedazUbezpieczenia**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|SprzedazUbezpieczeniaID|INT|No|- |PK|
|DataWaznosciOd|DATE|No|- |- |
|<p>DataWaznosciDo</p><p></p>|DATE|No|- |- |
|UzytkownikID|INT|No|-|FK|
|KlientID|INT|No|-|FK|
|UbezpieczenieID|INT|No|-|FK|


**SQL:**
```sql
CREATE TABLE SprzedazUbezpieczenia(

    SprzedazUbezpieczeniaID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    DataWaznosciOd DATE NOT NULL,

    DataWaznosciDo DATE NOT NULL,

    FOREIGN KEY (UzytkownikID) REFERENCES Uzytkownik(UzytkownikID),

    FOREIGN KEY (KlientID) REFERENCES Klient(KlientID),

    FOREIGN KEY (UbezpieczenieID) REFERENCES Ubezpieczenie(UbezpieczenieID)

);
```
---
**Tabela Kontynent (Tab. 2.10)**\
 Przeznaczona do przechowywania informacji o kontynentach w bazie danych. Tabela zawiera KontynentID, NazwaKontynentu.

**Opis pól:**

* KontynentID – klucz główny tabeli

* NazwaKontynentu – nazwa kontynentu
<br>

**Tab 2.10 Struktura tabeli Kontynent**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|KontynentID|INT|No|- |PK|
|NazwaKontynentu|VARCHAR(100)|No|- |- |



**SQL:**
```sql
CREATE TABLE Kontynent(

    KontynentID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    NazwaKontynentu VARCHAR(100) NOT NULL

);
```
---
**Tabela(Tab 2.11)**\
 Przeznaczona do przechowywania informacji o krajach w bazie danych. Tabela zawiera KrajID, NazwaKraju, oraz klucz obcy KontynentID z tabeli Kontynent.

**Opis pól:**

* KrajID – klucz główny tabeli 

* NazwaKraju – nazwa kraju

* KontynentID – klucz obcy z tabeli Kontynent
<br>

**Tab 2.11 Struktura tabeli Kraj**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|KrajID|INT|No|- |PK|
|NazwaKraju|VARCHAR(100)|No|- |- |
|KontynentID|INT|No|-|FK|

**SQL:**
```sql
CREATE TABLE Kraj(

`    `KrajID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

`    `NazwaKraju VARCHAR(100) NOT NULL,

`    `KontynentID INT NOT NULL,

`    `FOREIGN KEY (KontynentID) REFERENCES Kontynent(KontynentID)

);
```
---
**Tabela(Tab 2.12)**\
 Przeznaczona do przechowywania informacji o miastach w bazie danych. Tabela zawiera MiastoID, NazwaMiasta, oraz klucz obcy KrajID z tabeli Kraj.

**Opis pól:**

* MiastoID – klucz główny tabeli

* NazwaMiasta – nazwa lotniska

* KrajID – klucz obcy z tabeli Kraj
<br>

**Tab 2.12 Struktura tabeli Miasto**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|MiastoID|INT|No|- |PK|
|NazwaMiasta|VARCHAR(100)|No|- |- |
|KrajID|INT|No|-|FK|

**SQL:**

```sql
CREATE TABLE Miasto(

    MiastoID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    NazwaMiasta VARCHAR(100) NOT NULL,

    KrajID INT NOT NULL,

    FOREIGN KEY (KrajID) REFERENCES Kraj(KrajID)

);
```
---
**Tabela Hotel(Tab 2.13 Hotel)**\
 Przeznaczona do przechowywania informacji o hotelach w bazie danych. Tabela zawiera HotelID, NazwaHotelu, IloscGwiazdek, Opis, oraz klucz obcy MiastoID z tabeli Miasto i WycieczkaID z tabeli Wycieczka.

**Opis pól:**

* HotelID – klucz główny tabeli

* NazwaHotelu – nazwa hotelu

* IloscGwiazdek – ilość gwiazdek hotelu

* Opis – opis hotelu

* MiastoID – klucz obcy z tabeli Miasto
<br>

**Tab 2.13 Struktura tabeli Hotel**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|HotelID|INT|No|- |PK|
|NazwaHotelu|VARCHAR(100)|No|- |- |
|<p>IloscGwiazdek</p><p></p>|INT|No|- |- |
|Opis|VARCHAR(100)|No|-|<p>-</p>|
|MiastoID|INT|No|-|FK|


**SQL:**
```sql
CREATE TABLE Hotel(

    HotelID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,

    Nazwa VARCHAR(100) NOT NULL,

    Adres VARCHAR(255) NOT NULL,

    MiastoID INT NOT NULL,

    FOREIGN KEY (MiastoID) REFERENCES Miasto(MiastoID)

);
```	
---
**Tabela(Tab 2.14)**\
 Przeznaczona do przechowywania informacji o lotniskach w bazie danych. Tabela zawiera LotniskoID, NazwaLotniska, oraz klucz obcy MiastoID z tabeli Miasto.

**Opis pól:**

* LotniskoID – klucz główny tabeli

* NazwaLotniska – nazwa lotniska

* MiastoID – klucz obcy z tabeli Miasto
<br>

**Tab 2.14 Struktura tabeli Lotnisko**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|LotniskoID|INT|No|- |PK|
|NazwaLotniska|VARCHAR(100)|No|- |- |
|MiastoID|INT|No|-|FK|



**SQL:**
```sql
CREATE TABLE Lotnisko(

    LotniskoID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,

    NazwaLotniska VARCHAR(100) NOT NULL,

    MiastoID INT NOT NULL,

    FOREIGN KEY (MiastoID) REFERENCES Miasto(MiastoID)

);
```
---

**Tabela Wycieczka (Tab. 2.15)**\
 Przeznaczona do przechowywania informacji o wycieczkach w bazie danych. Tabela zawiera WycieczkaID, NazwaWycieczki, DataWaznosciRozpoczecie, DataWaznosciZakonczenie, CzasTrwaniaDni, DoZatwierdzenia, oraz klucz obcy UzytkownikID z tabeli Uzytkownik, HotelID z tabeli Hotel, LotniskoID z tabeli Lotnisko.

**Opis pól:**

* WycieczkaID – klucz główny

* NazwaWycieczki – nazwa wycieczki

* DataWaznosciRozpoczecie – data rozpoczęcia wycieczki

* DataWaznosciZakonczenie – data zakończenia wycieczki

* CzasTrwaniaDni – czas trwania wycieczki

* DoZatwierdzenia – czy wycieczka została zatwierdzona

* UzytkownikID – klucz obcy z tabeli Uzytkownik

* HotelID – klucz obcy z tabeli Hotel

* LotniskoID – klucz obcy z tabeli Lotnisko
<br>


**Tab 2.15 Struktura tabeli Wycieczka**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|WycieczkaID|INT|No|- |PK|
|NazwaWycieczki|VARCHAR2(100)|No|- |- |
|<p>DataWaznosciRozpoczecie</p><p></p>|DATE|No|- |- |
|DataWaznosciZakonczenie|DATE|No|-|<p></p><p>-</p><p></p>|
|CzasTrwaniaDnia|INT|No|-|-|
|<p></p><p>DoZatwierdzenia</p>|`             `INT|No|-|-|
|UzytkownikID|`             `INT|No|-|FK|
|HotelID|`             `INT|No|-|FK|
|LotniskoID|`             `INT|No|-|FK|







**SQL:**

```sql
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
```
---

**Tabela WycieczkaPlatnosc (Tab. 2.16)**\
 Przeznaczona do przechowywania informacji o płatnościach wycieczki dostępnych w bazie danych. Tabela zawiera WyczkaPlatnoscID, KwotaZaplacona, KwotaPozostala, TerminPlatnosci, CzyZaleglosc, oraz klucze obce UzytkownikID z tabeli Uzytkownik, WycieczkaID z tabeli Wycieczka i KlientID z tabeli Klient.

**Opis pol:**
* WycieczkaPlatnoscID – klucz główny tabeli

* KwotaZaplacona – zaplacona kwota

* KwotaPozostala – pozostala kwota do zaplaty

* TerminPlatnosci – termin kiedy została przyjęta płatność

* CzyZaległość – czy ktoś zalega z zapłatą

* UzytkownikID – klucz obcy z tabeli Uzytkownik

* WycieczkaID – klucz obcy z tabeli Wycieczka

* KlientID – klucz obcy z tabeli Klient
<br>

**Tab 2.16 Struktura tabeli WycieczkaPlatnosc**

|**Nazwa kolumny**|**Typ danych**|**Null**|**Domyślnie**|**Klucz**|
| :-: | :-: | :-: | :-: | :-: |
|WycieczkaPlatnoscID|INT|No|- |PK|
|KwotaZaplacona|DECIMAL(10,2)|No|- |- |
|<p>KwotaPozostala</p><p></p>|DECIMAL(10,2)|No|- |- |
|TerminPlatnosci|DATE|No|-|<p></p><p>-</p><p></p>|
|CzyZaleglosc|INT|No|-|-|
|UzytkownikID|INT|No|-|FK|
|WycieczkaID|INT|No|-|FK|
|KlientID|INT|No|-|`       `FK|

**SQL:**
```sql
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

    FOREIGN KEY (WycieczkaID) REFERENCES Wycieczka(WycieczkaID),

    FOREIGN KEY (KlientID) REFERENCES Klient(KlientID),

);
```
 
