INSERT INTO jtomasze_b.dbo.Stanowiska_produkcyjne 
(kod_stanowiska, opis_stanowiska) VALUES
	('M1', 'Maszyna 1'),
	('M2', 'Maszyna 2'),
	('M3', 'Maszyna 3'),
	('M4', 'Maszyna 4'),
	('M5', 'Maszyna 5'),
	('M6', 'Maszyna 6');

INSERT INTO jtomasze_b.dbo.Dostawcy
(kod_dostawcy, nazwa_dostawcy, adres_koresp_linia1, adres_koresp_linia2, osoba_kontaktowa, adres_email, telefon) VALUES
('dost1', 'Dostawca 1', NULL, NULL, NULL, NULL, NULL),
('dost2', 'Dostawca 2', NULL, NULL, NULL, NULL, NULL),
('dost3', 'Dostawca 3', NULL, NULL, NULL, NULL, NULL);

INSERT INTO jtomasze_b.dbo.Dzialy_produkcji
(kod_dzialu_produkcji, nazwa_dzialu_produkcji) VALUES
('DZ1', 'Painting Station'),
('DZ2', 'General Manufacturing'),
('DZ3', 'Parts Manufacturing)'),
('DZ4', 'Quality Control');

INSERT INTO jtomasze_b.dbo.Uzytkownicy
(login, haslo, imie, nazwisko, stanowisko, typ_stanowiska) VALUES
('PLKRAAA', 'pl123', 'Adam', 'Adamowicz', 'operator', 'prod'),
('PLKRBBB', 'pl456', 'Bogdan', 'Bogdanowicz', 'operator', 'prod'),
('PLKRCCC', 'pl789', 'Cezary', 'Czarkiewicz', 'operator', 'prod'),
('PLKRDDD', 'kr123', 'Damian', 'Dominikiewicz', 'operator', 'prod'),
('PLKREEE', 'kr456', 'Edward', 'Edkiewicz', 'operator', 'prod'),
('PLKRFFF', 'kr789', 'Franciszek', 'Frankowicz', 'monta¿', 'prod'),
('PLKRGGG', 'eu123', 'Grzegorz', 'Grzeœkowiak', 'kier-prod', 'biuro'),
('PLKRHHH', 'eu456', 'Henryk', 'Henrykowicki', 'planista', 'biuro'),
('PLKRIII', 'eu789', 'Ignacy', 'Ignasiewicz', 'kier-dzial', 'biuro');


INSERT INTO jtomasze_b.dbo.Priorytety
(kod_priorytetu, opis_priorytetu) VALUES
('BI', 'Business item'),
('NI', 'Non-stock item'),
('RI', 'Requested item'),
('SI', 'Stock item');

INSERT INTO jtomasze_b.dbo.Materialy_i_Produkty
(kod_elementu, nazwa_elementu, sposob_pozyskania, czas_realizacji_w_dniach, kod_glownego_dostawcy, aktywny)
VALUES
('MD', 'Material D', 'pur', 0, 'dost1', 'a'),
('D', 'Produkt D', 'man', 4, NULL, 'a'),
('ME', 'Material E', 'pur', 0, 'dost2', 'a'),
('FF2', 'Polprodukt FF2', 'man', 3, null, 'a'),
('MG', 'Material G', 'pur', 0, 'dost2', 'a'),
('FF3', 'Polprodukt FF3', 'man', 3, null, 'a'),
('FF1', 'Polprodukt FF1', 'man', 3, null, 'a'),
('F', 'Produkt F', 'man', 4, null, 'a'),
('MH', 'Material H', 'pur', 0, 'dost3', 'a'),
('HH1', 'Polprodukt HH1', 'man', 3, null, 'a'),
('H', 'Produkt H', 'man', 5, null, 'a');

INSERT INTO jtomasze_b.dbo.Struktury
(kod_elementu, kod_produktu_nadrzednego, kod_produktu_sprzedawanego,
ilosc_sztuk, poziom_w_hierarchii, liczba_porzadkowa, wersja_struktury) VALUES
('MD', 'D', 'D', 1, 1, 1, '001'),
('FF1', 'F', 'F', 1, 1, 1, '001'),
('FF3', 'FF1', 'F', 1, 2, 2, '001'),
('FF2', 'FF1', 'F', 1, 2, 3, '001'),
('MG', 'FF3', 'F', 1, 3, 4, '001'),
('ME', 'FF2', 'F', 1, 3, 5, '001'),
('HH1', 'H', 'H', 1, 1, 1, '001'),
('FF1', 'H', 'H', 1, 1, 2, '001'),
('FF3', 'FF1', 'H', 1, 2, 3, '001'),
('FF2', 'FF1', 'H', 1, 2, 4, '001'),
('MH', 'HH1', 'H', 1, 2, 5, '001'),
('MG', 'FF3', 'H', 1, 3, 6, '001'),
('ME', 'FF2', 'H', 1, 3, 7, '001');

INSERT INTO jtomasze_b.dbo.Problemy_hala
(opis_problemu) VALUES
('Brak produkcyjny'),
('Problemy z materia³em'),
('Awaria maszyny'),
('Awaria narzedzia'),
('Braki w dokumentacji'),
('Sztuka do odbioru'),
('Powiadom dzial zakupow'),
;
