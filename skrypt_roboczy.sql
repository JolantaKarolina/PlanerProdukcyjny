use jtomasze_b;

exec p_Dodaj_zlecenie_sprzedazowe 
	 @zewnetrzny_numer_zlecenia = '0033001237'
	,@kod_produktu = 'H'
	,@ilosc_sztuk = 20
	,@kod_priorytetu = 'SI';
	
SELECT * FROM Zlecenia_sprzedazy;
SELECT * FROM Zlecenia_produkcyjne;

exec p_Dodaj_zlecenie_produkcyjne
	 @numer_przewodnika_produkcyjnego = NULL
	,@id_zlecenia_sprzedazy = 1008
	,@kod_produktu = F
	,@ilosc_sztuk = 15;
	
