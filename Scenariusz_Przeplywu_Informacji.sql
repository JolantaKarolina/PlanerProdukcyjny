/*
Przep�yw danych:

1.
p_Dodaj_zlecenie_sprzedazowe wykonuje INSERT
t_Zlecenie_sprzedazowe_insert wywo�uje p_Dodaj_zlecenie_produkcyjne
poniewa� planista dodaje tylko te zlecenia sprzeda�owe, kt�re wymagaj� wyprodukowania towaru.

2. Mo�na doda� samodzielne zlecenie produkcyjne, kt�re nie ma zlecenia sprzeda�owego,
u�ywaj�c p_Dodaj_zlecenie_produkcyjne

3.
Usuniecie zlecenia sprzeda�owego powoduje usuniecie zlecenia produkcyjnego.
Aktualizacja zlecenia sprzeda�owego powoduje aktualizacje zlecenia produkcyjnego.







/*