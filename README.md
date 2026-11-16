# Akademia Małej Odkrywczyni 1.0
Samodzielna aplikacja statyczna (HTML, CSS, JavaScript; bez zewnętrznych bibliotek, kont i backendu). Interfejs w języku polskim, 8 minigier, ilustracje w postaci piktogramów emoji, 217 nagrań MP3 (syntetyczny polski głos eSpeak). Nagrania znajdują się w paczce.

## Windows / kiosk (offline)
1. Rozpakuj CAŁE archiwum w jednym katalogu.
2. Uruchom `URUCHOM-KIOSK.bat` (Microsoft Edge) lub otwórz `index.html` w normalnym Edge i użyj F11. Alt+F4 zamyka okno kiosku. 
3. Zwykłe otwarcie pliku działa offline bez serwera. Pamięć localStorage dla adresów file:// zależy od przeglądarki; tryb kiosku Edge zwykle stosuje sesję InPrivate, więc postępy mogą nie przetrwać ponownego uruchomienia. Jeśli zależy Ci na trwałych postępach, użyj zwykłego profilu Edge z F11 albo PWA zainstalowanej z HTTPS. 

## WWW / telefon (PWA)
Umieść wszystkie pliki z tego katalogu na statycznym hostingu HTTPS (np. własny serwer, GitHub Pages, Netlify). Nie potrzebujesz buildu; `index.html` jest punktem startowym. Nie usuwaj podkatalogów audio i icons ani plików manifestu i service workera. Można serwować także z podścieżki.
- Android/Chrome: po otwarciu adresu wybierz „Zainstaluj aplikację” lub „Dodaj do ekranu głównego”.
- iPhone/Safari: Udostępnij → Do ekranu początkowego (nazwy opcji mogą zależeć od wersji systemu).
- Pierwsze otwarcie przez HTTPS wymaga sieci. Po zainstalowaniu service workera i pobraniu wszystkich zasobów gra działa offline, o ile system nie wyczyści pamięci przeglądarki. Nie opuszczaj strony natychmiast po pierwszym uruchomieniu.
- Test lokalny (jeśli masz Pythona): w katalogu aplikacji `python -m http.server 8080`, następnie http://localhost:8080. Adres http://IP-komputera nie jest bezpiecznym kontekstem dla service workera na telefonie; do PWA na urządzeniu użyj HTTPS.

## Tryby
- Magiczne ogonki: uzupełnianie brakujących znaków, odsłuch wyrazu, model zapisu w podpowiedzi. Wymowa nie zawsze rozstrzyga pisownię, dlatego podpowiedź jest dostępna od razu.
- Sylabowy las: odsłuchiwanie i rozpoznawanie prostych sylab otwartych.
- Pociąg słów: dotykanie liter we właściwej kolejności, bez konieczności klawiatury.
- Skarby smoka: dodawanie i odejmowanie do 20 oraz następna liczba w okolicy 100.
- Sowie memory: 4 pary (6 w trudniejszym trybie).
- Magiczne wzory: losowane sekwencje.
- Detektyw: dopasowanie identycznego obrazka.
- Pracownia artystki: swobodne rysowanie i szlaczki (nie szkolne pismo odręczne).
Każda krótka sesja może być pominięta lub zakończona w dowolnej chwili. Losowa wyprawa zawiera 7 różnych trybów. Ustawienia rodzica dostępne pod ikoną koła zębatego. Statystyki i historia zadań są zapisane wyłącznie lokalnie, bez synchronizacji między urządzeniami. Nie ma pomiaru czasu ani zapisu błędnych odpowiedzi.

## Rozbudowa
- `data.js`: baza obrazkowych wyrazów, sylab, symboli i światów.
- `app.js`: generatory zadań, stan sesji, renderowanie i obsługa dotyku.
- `style.css`: responsywny wygląd.
- `audio-map.js`, `audio-list.json`, `audio/`: offline audio. Dla nowych wyrazów bez nagrania gra próbuje używać syntezy mowy przeglądarki.
- `sw.js`: pamięć offline (po aktualizacji zmień wersję CACHE; uzupełnij listy zasobów).
