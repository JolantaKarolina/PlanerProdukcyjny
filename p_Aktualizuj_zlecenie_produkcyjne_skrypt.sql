use jtomasze_b;

-- Procedura aktualizacji zlecenia produkcyjnego
create procedure p_Aktualizuj_zlecenie_produkcyjne
	 @id_zlecenia_produkcyjnego int
	,@nowy_numer_przewodnika_produkcyjnego varchar(20)
	,@id_zlecenia_sprzedazy int
	,@nowy_kod_produktu varchar(50)
	,@nowa_ilosc_sztuk int
AS
BEGIN
	BEGIN TRANSACTION
		UPDATE dbo.Zlecenia_produkcyjne
		SET numer_przewodnika_produkcyjnego = @nowy_numer_przewodnika_produkcyjnego
		,id_zlecenia_sprzedazy = 
		,kod_produktu
		,ilosc_sztuk)
		values 
		(@numer_przewodnika_produkcyjnego
		,@id_zlecenia_sprzedazy
		,@kod_produktu
		,@ilosc_sztuk);

		if @@error <> 0
		begin
			raiserror ('Wystapil blad w trakcie wykonywania transakcji INSERT 
						na tabeli Zlecenia_produkcyjne, procedura p_Dodaj_zlecenie_produkcyjne',16,-1);
			rollback transaction
		end
		
		commit transaction
END