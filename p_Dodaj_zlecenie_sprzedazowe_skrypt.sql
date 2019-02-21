use jtomasze_b;

-- Procedura dodawania zlecenia sprzeda¿owego
alter procedure p_Dodaj_zlecenie_sprzedazowe
	@zewnetrzny_numer_zlecenia varchar(25)
	,@kod_produktu varchar(50)
	,@ilosc_sztuk int
	,@kod_priorytetu char(2)
AS
BEGIN
	BEGIN TRANSACTION
		insert into dbo.Zlecenia_sprzedazy
			(zewnetrzny_numer_zlecenia
			,kod_produktu
			,ilosc_sztuk
			,kod_priorytetu)
		values
			(@zewnetrzny_numer_zlecenia
			,@kod_produktu
			,@ilosc_sztuk
			,@kod_priorytetu);

		if @@error <> 0
		begin
			raiserror ('Wystapil blad w trakcie wykonywania transakcji INSERT 
						na tabeli Zlecenia_sprzedazy, procedura p_Dodaj_zlecenie_sprzedazowe',16,-1);
			rollback transaction
		end
		
		commit transaction
END