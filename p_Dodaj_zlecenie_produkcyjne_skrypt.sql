use jtomasze_b;

-- Procedura dodawania zlecenia produkcyjnego
alter procedure p_Dodaj_zlecenie_produkcyjne
	 @numer_przewodnika_produkcyjnego varchar(20)
	,@id_zlecenia_sprzedazy int
	,@kod_produktu varchar(50)
	,@ilosc_sztuk int
AS
BEGIN
	BEGIN TRANSACTION
		insert into dbo.Zlecenia_produkcyjne
		(numer_przewodnika_produkcyjnego
		,id_zlecenia_sprzedazy
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