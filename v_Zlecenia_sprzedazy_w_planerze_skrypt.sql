-- Widok szczegolowy zlecenia sprzedazowego wraz z powiazanym z nim zleceniem produkcyjnym w planerze
use jtomasze_b;


CREATE VIEW v_Zlecenia_sprzedazy_w_planerze
AS
SELECT * 
FROM dbo.Zlecenia_sprzedazy zs
LEFT OUTER JOIN dbo.Zlecenia_produkcyjne zp
ON zs.id_zlecenia_sprzedazy = zp.id_zlecenia_sprzedazy
LEFT OUTER JOIN dbo.Plan_produkcyjny pp
on zp.id_zlecenia_produkcyjnego = pp.id_zlecenia_produkcyjnego;
