use jtomasze_b;

-- Trigger t_Zlecenia_sprzedazy_instead_of_delete który usuwa z bazy danych zlecenie sprzedazowe i stworzone przez niego 
-- 	zlecenie produkcyjne wraz z jego szczegolami z planera produkcyjnego

CREATE TRIGGER t_Zlecenia_sprzedazy_instead_of_delete
ON dbo.v_Zlecenia_sprzedazy_w_planerze
INSTEAD OF DELETE
AS 
BEGIN
	if @@ROWCOUNT = 0 return;
	
	BEGIN TRANSACTION
		DELETE zs
		FROM Zlecenia_sprzedazy zs JOIN deleted d 
		ON zs.id_zlecenia_sprzedazy = d.id_zlecenia_sprzedazy;
	
		if @@error <> 0
			begin
				raiserror ('Wystapil blad w trakcie wykonywania transakcji INSTEAD OF DELETE 
							z tabeli Zlecenia_sprzedazy, trigger t_Zlecenia_sprzedazy_instead_of_delete',16,-1);
				rollback transaction
			end
	COMMIT TRANSACTION
END