-- Klucze obce tabel

ALTER TABLE jtomasze_b.dbo.Zlecenia_sprzedazy ADD CONSTRAINT FK_Zlecenia_sprzedazy_Materialy_i_Produkty FOREIGN KEY (kod_produktu) REFERENCES jtomasze_b.dbo.Materialy_i_Produkty(kod_elementu)
ALTER TABLE jtomasze_b.dbo.Zlecenia_sprzedazy ADD CONSTRAINT FK_Zlecenia_sprzedazy_Priorytety FOREIGN KEY (kod_priorytetu) REFERENCES jtomasze_b.dbo.Priorytety(kod_priorytetu)

ALTER TABLE jtomasze_b.dbo.Zlecenia_produkcyjne ADD CONSTRAINT FK_Zlecenia_produkcyjne_Materialy_i_Produkty FOREIGN KEY (kod_produktu) REFERENCES jtomasze_b.dbo.Materialy_i_Produkty(kod_elementu)
ALTER TABLE jtomasze_b.dbo.Zlecenia_produkcyjne ADD CONSTRAINT FK_Zlecenia_produkcyjne_Zlecenia_sprzedazy FOREIGN KEY (id_zlecenia_sprzedazy) REFERENCES jtomasze_b.dbo.Zlecenia_sprzedazy(id_zlecenia_sprzedazy)

ALTER TABLE jtomasze_b.dbo.Materialy_i_Produkty ADD CONSTRAINT FK_Materialy_i_Produkty_Dostawcy FOREIGN KEY (kod_glownego_dostawcy) REFERENCES jtomasze_b.dbo.Dostawcy(kod_dostawcy)

ALTER TABLE jtomasze_b.dbo.Magazyn ADD	CONSTRAINT FK_Magazyn_Materialy_i_Produkty FOREIGN KEY (kod_elementu) REFERENCES jtomasze_b.dbo.Materialy_i_Produkty(kod_elementu)

ALTER TABLE jtomasze_b.dbo.Struktury ADD CONSTRAINT FK_Struktury_Materialy_i_Produkty FOREIGN KEY (kod_elementu) REFERENCES jtomasze_b.dbo.Materialy_i_Produkty(kod_elementu);
ALTER TABLE jtomasze_b.dbo.Struktury ADD CONSTRAINT FK_Struktury_Materialy_i_Produkty_nadrzedny FOREIGN KEY (kod_produktu_nadrzednego) REFERENCES jtomasze_b.dbo.Materialy_i_Produkty(kod_elementu);
ALTER TABLE jtomasze_b.dbo.Struktury ADD CONSTRAINT FK_Struktury_Materialy_i_Produkty_sprzedawany FOREIGN KEY (kod_produktu_sprzedawanego) REFERENCES jtomasze_b.dbo.Materialy_i_Produkty(kod_elementu);
ALTER TABLE jtomasze_b.dbo.Struktury ADD CONSTRAINT CHK_Struktury_wersja CHECK (wersja_struktury IN ('001','002','003'));

ALTER TABLE jtomasze_b.dbo.Marszruty ADD CONSTRAINT FK_Marszruty_Dzialy_produkcji FOREIGN KEY (kod_dzialu_produkcji) REFERENCES jtomasze_b.dbo.Dzialy_produkcji(kod_dzialu_produkcji);
ALTER TABLE jtomasze_b.dbo.Marszruty ADD CONSTRAINT FK_Marszruty_Materialy_i_Produkty FOREIGN KEY (kod_produktu) REFERENCES jtomasze_b.dbo.Materialy_i_Produkty(kod_elementu);
ALTER TABLE jtomasze_b.dbo.Marszruty ADD CONSTRAINT FK_Marszruty_Stanowiska_produkcyjne FOREIGN KEY (kod_stanowiska_produkcyjnego) REFERENCES jtomasze_b.dbo.Stanowiska_produkcyjne(kod_stanowiska);

ALTER TABLE jtomasze_b.dbo.Plan_produkcyjny ADD	CONSTRAINT FK_Plan_produkcyjny_Zlecenia_produkcyjne FOREIGN KEY (id_zlecenia_produkcyjnego) REFERENCES jtomasze_b.dbo.Zlecenia_produkcyjne(id_zlecenia_produkcyjnego);
ALTER TABLE jtomasze_b.dbo.Plan_produkcyjny ADD CONSTRAINT FK_Plan_produkcyjny_Marszruty FOREIGN KEY (kod_operacji) REFERENCES jtomasze_b.dbo.Marszruty(id_wiersza);

ALTER TABLE jtomasze_b.dbo.Harmonogram_zmianowy ADD CONSTRAINT FK_Harmonogram_zmianowy_Stanowiska_produkcyjne FOREIGN KEY (stanowisko_produkcyjne) REFERENCES jtomasze_b.dbo.Stanowiska_produkcyjne(kod_stanowiska);
ALTER TABLE jtomasze_b.dbo.Harmonogram_zmianowy ADD CONSTRAINT FK_Harmonogram_zmianowy_Uzytkownicy FOREIGN KEY (kod_pracownika) REFERENCES jtomasze_b.dbo.Uzytkownicy(login);

ALTER TABLE jtomasze_b.dbo.Komunikacja_wewnetrzna ADD CONSTRAINT FK_Komunikacja_wewnetrzna_Plan_produkcyjny FOREIGN KEY (id_operacji) REFERENCES jtomasze_b.dbo.Plan_produkcyjny(id_wiersza);
ALTER TABLE jtomasze_b.dbo.Komunikacja_wewnetrzna ADD CONSTRAINT FK_Komunikacja_wewnetrzna_Uzytkownicy FOREIGN KEY (autor) REFERENCES jtomasze_b.dbo.Uzytkownicy(login);

ALTER TABLE jtomasze_b.dbo.Stan_produkcyjny ADD CONSTRAINT FK_Stan_produkcyjny_Plan_produkcyjny FOREIGN KEY (id_operacji) REFERENCES jtomasze_b.dbo.Plan_produkcyjny(id_wiersza);
ALTER TABLE jtomasze_b.dbo.Stan_produkcyjny ADD CONSTRAINT FK_Stan_produkcyjny_Uzytkownicy FOREIGN KEY (kod_pracownika) REFERENCES jtomasze_b.dbo.Uzytkownicy(login);
ALTER TABLE jtomasze_b.dbo.Stan_produkcyjny ADD CONSTRAINT FK_Stan_produkcyjny_Stanowiska_produkcyjne FOREIGN KEY (kod_stanowiska) REFERENCES jtomasze_b.dbo.Stanowiska_produkcyjne(kod_stanowiska);

ALTER TABLE jtomasze_b.dbo.Problemy_odpowiedzialni
ADD CONSTRAINT FK_Problemy_odpowiedzialni_Problemy_hala FOREIGN KEY (oznaczenie_problemu) 
REFERENCES jtomasze_b.dbo.Problemy_hala (oznaczenie_problemu);

ALTER TABLE jtomasze_b.dbo.Problemy_odpowiedzialni
ADD CONSTRAINT FK_Problemy_odpowiedzialni_Uzytkownicy FOREIGN KEY (osoba_odpowiedzialna)
REFERENCES jtomasze_b.dbo.Uzytkownicy (login);





