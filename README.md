## Projekt Mastermind

> Mastermind ma prostą budowę, jednak jest wymagający intelektualnie.

— Tymon Oziemblewski, autor programu Mastermind

#### O programie Mastermind
Program Mastermind, wykorzystany w projekcie, został napisany przez Tymona Oziemblewskiego. To prosta, logiczna gra komputerowa uruchamiana w konsoli. 
Zabawa polega na zgadywaniu tajnego kodu składającego się z czterech cyfr.  W trakcie zgadywania gracz otrzymuje od komputera podpowiedzi: ile cyfr przedstawionych przez niego znajduje się we właściwym kodzie i ile z nich znajduje się na wskazanych przez niego pozycjach. 
Po podaniu komputerowi prawidłowego rozwiązania zwracany jest komunikat o sukcesie. Dowiadujemy się też ile prób potrzebowaliśmy, by odgadnąć wynik.

#### Budowa programu
Mastermind zbudowany jest z dwóch plików:
* **[Game.rb](https://github.com/OpenClosed/solid-grupa1/blob/master/lib/Game.rb)** 
* **[Code.rb](https://github.com/OpenClosed/solid-grupa1/blob/master/lib/Code.rb)**

Pierwszy z nich jest plikiem, który należy uruchomić by zagrać w grę Mastermind i zawiera cały zasadniczy rdzeń programu. W drugim z nich można znaleźć zbiór metod pomocniczych wykorzystywanych w rdzeniu programu. 

#### Założenia wstępne
Założeniem projektu jest refaktoryzacja kodu z pomocą narzędzi Reek oraz Rubocop, oraz otwarcie kodu na zmianę, polegającą na pozostawieniu graczowi wyboru, z ilu cyfr będzie składał się kod, przeznaczony do odgadnięcia.

#### Przygotowania do refaktoryzacji
Kod, mimo że jest stosunkowo krótki i składa się jedynie z dwóch klas (Code.rb oraz Game.rb), pozwala się wykazać, jeśli chodzi o refaktoryzację. Program przebadano narzędziem Reek. Co prawda w pliku Game.rb znajdują się jedynie 4 warningi, jednak w pliku Code.rb znajduje się ich aż 14. Narzędzie Rubocop wskazało łącznie 112 miejsc do poprawy w obu plikach. Biorąc pod uwagę, że program składa się jedynie ze 124 linijek kodu, jest to kiepski wynik – choć, oczywiście, zostanie on naprawiony w kolejnych fazach refaktoryzacji.

![Reek](/images/reekStart.png)
— Raport programu Reek


