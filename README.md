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

#### Warsztat pracy
Do prac związanych z wypełnieniem założeń projektu wykorzystany zostanie notebook z procesorem i3-5010u pracujący pod kontrolą systemu operacyjnego Windows 8.1. 
<br><br>Wykorzystane oprogramowanie to:
* IntelliJ IDEA 2017.2.5 - do edycji kodu, uruchamiania programu oraz obsługi systemu kontroli wersji.
* Reek - jako narzędzie służące do detekcji *code smells.*
* Rubocop - jako narzędzie służące do detekcji miejsc, które szkodzą poprawnemu stylowi kodu.
* Git Bash - do uruchamiania narzędzi Reek oraz Rubocop.

#### Przygotowania do refaktoryzacji
Kod, mimo że jest stosunkowo krótki i składa się jedynie z dwóch klas (Code.rb oraz Game.rb), pozwala się wykazać, jeśli chodzi o refaktoryzację. Program przebadano narzędziem Reek. Co prawda w pliku Game.rb znajdują się jedynie 4 warningi, jednak w pliku Code.rb znajduje się ich aż 14. 

Narzędzie Rubocop wskazało łącznie 112 miejsc do poprawy w obu plikach. Biorąc pod uwagę, że program składa się jedynie ze 124 linijek kodu, jest to kiepski wynik – choć, oczywiście, zostanie on naprawiony w kolejnych fazach refaktoryzacji.


![Reek](/images/reekStart.png)
— Raport narzędzia Reek

Znalezione zostały następujące *code smells:* 

**[Game.rb:](https://github.com/OpenClosed/solid-grupa1/blob/master/lib/Game.rb)**
* [DuplicateMethodCall](https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md)
* [InstanceVariableAssumption](https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md)
* [IrresponsibleModule](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)
* [TooManyStatements](https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md)

**[Code.rb:](https://github.com/OpenClosed/solid-grupa1/blob/master/lib/Code.rb)**
* [ClassVariable](https://github.com/troessner/reek/blob/master/docs/Class-Variable.md)
* [DuplicateMethodCall](https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md)
* [IrresponsibleModule](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)
* [TooManyStatements](https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md)
* [UncommunicativeVariableName](https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md)

Należy wyeliminować jak najwięcej spośród nich, a w miarę możliwości wszystkie.

#### Refaktoryzacja - krok pierwszy
Pierwszym krokiem w refaktoryzacji z pomocą narzędzia Reek będzie nakazanie mu ignorowania wszelkich *code smells* niewystępujących w książce Martina Fowlera i zarazem występujących w przypadku kodu źródłowego programu Mastermind. Usunięto uwzględnianie następujących ostrzeżeń:
* [TooManyStatements](https://github.com/troessner/reek/blob/master/docs/Too-Many-Statements.md)
* [DuplicateMethodCall](https://github.com/troessner/reek/blob/master/docs/Duplicate-Method-Call.md)
* [IrresponsibleModule](https://github.com/troessner/reek/blob/master/docs/Irresponsible-Module.md)
* [UncommunicativeVariableName](https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md)

Co prawda niektóre ostrzeżenia mogą być usunięte bardziej niż łatwo (na przykład [UncommunicativeVariableName](https://github.com/troessner/reek/blob/master/docs/Uncommunicative-Variable-Name.md) wymagające jedynie zmiany nazw niektórych zmiennych z czegoś w stylu "i", "c" na nazwy zgodne z konwencją *samodokumentującego się kodu*)

Dodanie takich restrykcji jest jednak uwzględnione w poleceniach do projektu. Aby tego dokonać, utworzony został plik *conf.reek*, który zawiera odpowiednie ograniczenia dla narzędzia Reek.

#### Refaktoryzacja - krok drugi
Kolejnym zadaniem będzie pozbycie się ostrzeżenia [ClassVariable](https://github.com/troessner/reek/blob/master/docs/Class-Variable.md), które jest główną bolączką klasy [Code.rb.](https://github.com/OpenClosed/solid-grupa1/blob/master/lib/Code.rb) Po dokładniejszym zagłębieniu się w temat można stwierdzić, że Reek odradza stosowanie zmiennych klas, ponieważ mimo że działają i spełniają swoją rolę, to są problematyczne, co wyjaśnia [niniejszy artykuł.](http://4thmouse.com/index.php/2011/03/20/why-class-variables-in-ruby-are-a-bad-idea/)

Ostrzeżenie wyeliminowano dzięki zastosowaniu zmiennych globalnych w miejsce zmiennych klas.

Tym sposobem klasa [Code.rb](https://github.com/OpenClosed/solid-grupa1/blob/master/lib/Code.rb) stała się wolna od ostrzeżeń ze strony narzędzia Reek.

#### Refaktoryzacja - krok trzeci
Ostatnim ostrzeżeniem ze strony narzędzia Reek jest [InstanceVariableAssumption](https://github.com/troessner/reek/blob/master/docs/Instance-Variable-Assumption.md).  Reek widział problem w tym, że kod źródłowy klasy Game.rb zbyt dużo zakłada dla zmiennej instancji. Zamiast zmiennej instancji *@code* należało użyć zmiennej globalnej *$code*, aby pozbyć się tego ostrzeżenia.

#### Dalsze prace nad kodem
Narzędzie Reek nie pokazuje już żadnych ostrzeżeń dla programu, jednak już na pierwszy rzut oka widać, że styl i estetyka kodu pozostawiają wiele do życzenia. W dalszych pracach zostanie wykorzystane narzędzie Rubocop. Na starcie prac wskazuje on łącznie 116 uchybień w całym kodzie źródłowym programu. Dalsza praca jest więc w pełni zasadna. Być może nie uda się pozbyć tak wielu uchybień bez naruszania szkieletu programu, jednak rozsądnym celem wydaje się być eliminacja znacznej większości z nich.


![Rubocop](/images/rubocopStart.png)
— Końcówka raportu narzędzia Rubocop



