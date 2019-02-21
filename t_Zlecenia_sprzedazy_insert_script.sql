use jtomasze_b;

-- Trigger t_Zlecenia_sprzedazy_insert który po wprowadzeniu wiersza do tabeli Zlecenia_sprzedazy generuje zlecenie produkcyjne

ALTER TRIGGER t_Zlecenia_sprzedazy_insert 
ON dbo.Zlecenia_sprzedazy 
AFTER INSERT 
AS 
BEGIN
	declare @numer_przewodnika_produkcyjnego varchar(20)
	declare @id_zlecenia_sprzedazy int
	declare @kod_produktu varchar(50)
	declare @ilosc_sztuk int
	
	SELECT 	@numer_przewodnika_produkcyjnego = NULL
		,@id_zlecenia_sprzedazy = id_zlecenia_sprzedazy
		,@kod_produktu = kod_produktu
		,@ilosc_sztuk = ilosc_sztuk
	FROM Zlecenia_sprzedazy
	WHERE id_zlecenia_sprzedazy = SCOPE_IDENTITY();
	
	EXEC p_Dodaj_zlecenie_produkcyjne @numer_przewodnika_produkcyjnego
		,@id_zlecenia_sprzedazy
		,@kod_produktu 
		,@ilosc_sztuk
	;
END