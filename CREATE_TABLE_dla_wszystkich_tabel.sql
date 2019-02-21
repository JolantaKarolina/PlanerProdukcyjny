-- DDL tabel tworz¹cych schemat

-- Zlecenia_sprzedazy
CREATE TABLE jtomasze_b.dbo.Zlecenia_sprzedazy (
	id_zlecenia_sprzedazy int IDENTITY(1,1) NOT NULL,
	zewnetrzny_numer_zlecenia varchar(25) NOT NULL,
	kod_produktu varchar(50) NOT NULL,
	ilosc_sztuk int NOT NULL,
	kod_priorytetu char(2) NULL,
	CONSTRAINT Zlecenia_sprzedazy_PK PRIMARY KEY (id_zlecenia_sprzedazy)
) GO;

-- Tabela Priorytety
CREATE TABLE jtomasze_b.dbo.Priorytety (
	kod_priorytetu char(2) NOT NULL,
	opis_priorytetu varchar(50) NULL,
	CONSTRAINT PK_Priorytety_1 PRIMARY KEY (kod_priorytetu)
) GO;

-- Materialy_i_Produkty
CREATE TABLE jtomasze_b.dbo.Materialy_i_Produkty (
	kod_elementu varchar(50) NOT NULL,
	nazwa_elementu varchar(50) NOT NULL,
	sposob_pozyskania char(3) NOT NULL,
	czas_realizacji_w_dniach int NULL,
	kod_glownego_dostawcy varchar(5) NULL,
	aktywny char(3) NOT NULL,
	CONSTRAINT PK_Materialy_i_Produkty PRIMARY KEY (kod_elementu),
	CONSTRAINT CK_Materialy_i_Produkty_SposobPozyskania CHECK ([sposob_pozyskania]='pur' OR [sposob_pozyskania]='man') -- purchased or manufactured
) GO;

--Zlecenia_produkcyjne
CREATE TABLE jtomasze_b.dbo.Zlecenia_produkcyjne (
	id_zlecenia_produkcyjnego int identity(1,1) NOT NULL,
	numer_przewodnika_produkcyjnego varchar(20) NULL,
	id_zlecenia_sprzedazy int NULL,
	kod_produktu varchar(50) NOT NULL,
	ilosc_sztuk int NOT NULL,
	CONSTRAINT PK_Zlecenia_produkcyjne PRIMARY KEY (id_zlecenia_produkcyjnego),
	CONSTRAINT CK_Zlecenia_produkcyjne_ilosc_sztuk CHECK ([ilosc_sztuk]>(0))
) GO;

-- Dostawcy
CREATE TABLE jtomasze_b.dbo.Dostawcy (
	kod_dostawcy varchar(5) NOT NULL,
	nazwa_dostawcy varchar(50) NOT NULL,
	adres_koresp_linia1 varchar(50) NULL,
	adres_koresp_linia2 varchar(50) NULL,
	osoba_kontaktowa varchar(50) NULL,
	adres_email varchar(50) NULL,
	telefon varchar(20) NULL,
	CONSTRAINT PK_Dostawcy PRIMARY KEY (kod_dostawcy)
) GO;

-- Magazyn
CREATE TABLE jtomasze_b.dbo.Magazyn (
	id_wiersza int identity(1,1) NOT NULL,
	kod_elementu varchar(50) NULL,
	ilosc_sztuk int NULL,
	lokalizacja varchar(5) NULL,
	CONSTRAINT PK_Magazyn PRIMARY KEY (id_wiersza),
) GO;

-- Struktury
CREATE TABLE jtomasze_b.dbo.Struktury (
	id_wiersza int IDENTITY(1,1) NOT NULL,
	kod_elementu varchar(50) NOT NULL,
	kod_produktu_nadrzednego varchar(50) NOT NULL,
	kod_produktu_sprzedawanego varchar(50) NOT NULL,
	ilosc_sztuk int NOT NULL,
	poziom_w_hierarchii int NOT NULL,
	liczba_porzadkowa int NOT NULL,
	wersja_struktury varchar(3) NULL,
	CONSTRAINT PK_Struktury PRIMARY KEY (id_wiersza),
	CONSTRAINT CK_Struktury_ilosc_sztuk CHECK ([ilosc_sztuk]>(0))
) GO;

-- Marszruty
CREATE TABLE jtomasze_b.dbo.Marszruty (
	id_wiersza int identity(1,1) NOT NULL,
	id_zlecenia_produkcyjnego int NOT NULL,
	kod_operacji varchar(20) NOT NULL,
	opis_operacji varchar(50) NULL,
	kod_stanowiska_produkcyjnego varchar(10) NULL,
	kod_dzialu_produkcji varchar(3) NULL,
	kod_produktu varchar(50) NOT NULL,
	czas_przezbrojenia decimal(2,2) NULL,
	czas_operacyjny decimal(2,2) NULL,
	wersja_marszruty varchar(3) NOT NULL,
	CONSTRAINT PK_Marszruty PRIMARY KEY (id_wiersza),
	CONSTRAINT CK_Marszruty_czasy CHECK ([czas_przezbrojenia]>(0) AND [czas_operacyjny]>(0)),
) GO;

-- Dzia³y_produkcji
CREATE TABLE jtomasze_b.dbo.Dzialy_produkcji (
	kod_dzialu_produkcji varchar(3) NOT NULL,
	nazwa_dzialu_produkcji varchar(50) NOT NULL,
	CONSTRAINT PK_Dzialy_produkcji PRIMARY KEY (kod_dzialu_produkcji)
) GO;

-- Stanowiska_produkcyjne
CREATE TABLE jtomasze_b.dbo.Stanowiska_produkcyjne (
	kod_stanowiska varchar(10) NOT NULL,
	opis_stanowiska varchar(50) NULL,
	CONSTRAINT PK_Stanowiska_produkcyjne PRIMARY KEY (kod_stanowiska)
) GO;

-- Plan_produkcyjny
CREATE TABLE jtomasze_b.dbo.Plan_produkcyjny (
	id_wiersza int identity(1,1) NOT NULL,
	status_wiersza char(1) NOT NULL,
	kod_produktu varchar(50) NOT NULL,
	kod_operacji varchar(20) NOT NULL,
	start_przezbrojenia decimal(2,2) NULL,
	start_obrobki decimal(2,2) NULL,
	zakonczenie_obrobki decimal(2,2) NULL,
	id_zlecenia_produkcyjnego int NOT NULL,
	pozadany_termin_zakonczenia_obrobki decimal(2,2) NULL,
	sumaryczny_czas_wczesniejszych_operacji decimal(2,2) NOT NULL,
	CONSTRAINT PK_Plan_produkcyjny PRIMARY KEY (id_wiersza),
	CONSTRAINT CK_Plan_produkcyjny_StatusWiersza CHECK ([status_wiersza] IN ('n','p','t','z')) -- nieprzydzielony, zaplanowany, trwajacy, zakonczony
) GO;

-- Uzytkownicy
CREATE TABLE jtomasze_b.dbo.Uzytkownicy (
	id_wiersza int IDENTITY(1,1) NOT NULL,
	login varchar(7) NOT NULL,
	haslo varchar(8) NOT NULL,
	imie varchar(20) NOT NULL,
	nazwisko varchar(20) NOT NULL,
	stanowisko varchar(20) NOT NULL,
	typ_stanowiska varchar(5) NOT NULL
	CONSTRAINT PK_Uzytkownicy PRIMARY KEY (id_wiersza),
	CONSTRAINT AK_Uzytkownicy_login UNIQUE (login),
	CONSTRAINT CK_Uzytkownicy_TypStanowiska CHECK ([typ_stanowiska]='biuro' OR [typ_stanowiska]='prod') -- stanowisko biurowe lub produkcja
) GO;

-- Harmonogram_zmianowy
CREATE TABLE jtomasze_b.dbo.Harmonogram_zmianowy (
	id_wiersza int identity(1,1) NOT NULL,
	kod_pracownika varchar(7) NULL,
	stanowisko_produkcyjne varchar(10) NOT NULL,
	[data] date NOT NULL,
	nr_zmiany int NOT NULL,
	CONSTRAINT PK_Harmonogram_zmianowy PRIMARY KEY (id_wiersza),
	CONSTRAINT CK_Harmonogram_zmianowy_NumerZmiany CHECK ([nr_zmiany]=(1) OR [nr_zmiany]=(2)) -- poranna lub wieczorna zmiana
) GO;

-- Komunikacja_wewnetrzna
CREATE TABLE jtomasze_b.dbo.Komunikacja_wewnetrzna (
	id_wiersza int identity(1,1) NOT NULL,
	id_operacji int NOT NULL,
	komentarz varchar(250) NOT NULL,
	know_how varchar(3) NOT NULL,
	autor varchar(7) NOT NULL,
	CONSTRAINT PK_Komunikacja_wewnetrzna PRIMARY KEY (id_wiersza),
	CONSTRAINT CK_know_how_TakNie CHECK ([know_how]=('tak') OR [know_how]=('nie')) -- czy komentarz zawiera wiedze typu know-how
); GO

-- Stan_produkcyjny
CREATE TABLE jtomasze_b.dbo.Stan_produkcyjny (
	id_wiersza int identity(1,1) NOT NULL,
	id_operacji int NOT NULL,
	typ_zdarzenia char(3) NOT NULL,
	czas_zdarzenia datetime NOT NULL,
	kod_stanowiska varchar(10) NOT NULL,
	kod_pracownika varchar(7) NULL,
	CONSTRAINT PK_Stan_produkcyjny PRIMARY KEY (id_wiersza),
	CONSTRAINT CK_Stan_produkcyjny_TypZdarzenia CHECK ([typ_zdarzenia] IN ('roz','wst','wzn','zak'))
);

CREATE TABLE jtomasze_b.dbo.Problemy_hala (
	oznaczenie_problemu int identity(1,1) not null,
	opis_problemu varchar(50),
	CONSTRAINT PK_Problemy_hala PRIMARY KEY(oznaczenie_problemu)
);

CREATE TABLE jtomasze_b.dbo.Problemy_odpowiedzialni (
	id_wiersza int identity(1,1) not null,
	oznaczenie_problemu int not null,
	osoba_odpowiedzialna varchar(7) NOT NULL
	constraint PK_Problemy_odpowiedzialni PRIMARY KEY (id_wiersza)
);


