use jtomasze_b;

-- Procedura usuniecia zlecenia sprzedazowego

CREATE PROCEDURE p_Usun_zlecenie_sprzedazowe
	@id_zlecenia_sprzedazy int
AS
BEGIN	
	BEGIN TRANSACTION
			DELETE FROM Zlecenia_sprzedazy
			WHERE id_zlecenia_sprzedazy = @id_zlecenia_sprzedazy;
	
			if @@error <> 0
			begin
				raiserror ('Wystapil blad w trakcie wykonywania transakcji DELETE 
							na tabeli Zlecenia_sprzedazy, procedura p_Usun_zlecenie_sprzedazowe',16,-1);
				rollback transaction
			end
			
			-- Tabela Zlecenia_sprzeda¿y posiada trigger INSTEAD OF DELETE, gdzie czyszczone jest wszystko co dotyczy
			-- danego zlecenia sprzeda¿owego.
	COMMIT TRANSACTION		
END;
