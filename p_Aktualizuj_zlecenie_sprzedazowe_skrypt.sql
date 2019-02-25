use jtomasze_b;

-- Procedura aktualizacji zlecenia sprzeda¿owego
create procedure p_Aktualizuj_zlecenie_sprzedazowe
	 @id_zlecenia_sprzedazy int
	,@nowy_zewnetrzny_numer_zlecenia varchar(25)
	,@nowy_kod_produktu varchar(50)
	,@nowa_ilosc_sztuk int
	,@nowy_kod_priorytetu char(2)
AS
BEGIN
	BEGIN TRANSACTION
		UPDATE dbo.Zlecenia_sprzedazy
		SET zewnetrzny_numer_zlecenia = @nowy_zewnetrzny_numer_zlecenia
			,kod_produktu = @nowy_kod_produktu
			,ilosc_sztuk = @nowa_ilosc_sztuk
			,kod_priorytetu = @nowy_kod_priorytetu
		WHERE id_zlecenia_sprzedazy = @id_zlecenia_sprzedazy;

		if @@error <> 0
		begin
			raiserror ('Wystapil blad w trakcie wykonywania transakcji UPDATE 
						na tabeli Zlecenia_sprzedazy, procedura p_Aktualizuj_zlecenie_sprzedazowe',16,-1);
			rollback transaction
		end
		
	COMMIT TRANSACTION
END