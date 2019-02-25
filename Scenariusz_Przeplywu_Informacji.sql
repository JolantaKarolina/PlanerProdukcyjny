/*
Przep³yw danych:

1.
p_Dodaj_zlecenie_sprzedazowe wykonuje INSERT
t_Zlecenie_sprzedazowe_insert wywo³uje p_Dodaj_zlecenie_produkcyjne
poniewa¿ planista dodaje tylko te zlecenia sprzeda¿owe, które wymagaj¹ wyprodukowania towaru.

2. Mo¿na dodaæ samodzielne zlecenie produkcyjne, które nie ma zlecenia sprzeda¿owego,
u¿ywaj¹c p_Dodaj_zlecenie_produkcyjne

3.
Usuniecie zlecenia sprzeda¿owego powoduje usuniecie zlecenia produkcyjnego.
Aktualizacja zlecenia sprzeda¿owego powoduje aktualizacje zlecenia produkcyjnego.







/*