require_relative 'Code'

# Klasa wykonywalna Game.rb, zawiera podstawowy interfejs programu Mastermind
class Game
  def initialize
  end

  def guess
    begin
      input = gets.chomp
      $code = Code.new(input)
      puts Code.info unless $code.valid?
    end while !$code.valid?
    if @secret_code.code == $code.code then true
    else
      puts "#{$code} #{@secret_code.compare $code}"
      false
    end
  end

  def play
    tries = 0
    begin
      tries += 1
    end while !guess
    puts "Odgadłeś kod po #{tries} prób#{tries == 1 ? 'ie' : 'ach'}."
  end

  def read_length
    puts 'Z ilu cyfr ma składać się zgadywany przez ciebie kod? Wprowadź liczbę z zakresu 3-9.'
    begin
      length = gets.chomp.to_i
      puts 'Błąd! Wprowadź poprawną liczbę z zakresu 3-9!' unless valid_length?(length)
    end while !valid_length?(length)
    $length = length
    $complexity = length
  end

  def valid_length?(length)
    valid = false
    if length >= 3 && length <= 9
      valid = true
    end
    valid
  end

  def hello
    puts '', 'Witaj w grze Mastermind!'.center(80)
    read_length
    @secret_code = Code.new
    puts "Długość kodu to #{Code.length}."
    puts "W kodzie mogą wystąpić cyfry z przedziału (1;#{Code.complexity})."
    puts 'Po każdej nieudanej próbie odgadnięcia kodu otrzymasz podpowiedź: ile cyfr znajduje się w kodzie i ile spośród nich znajduje się na dobrym miejscu.'
    puts 'Rozpocznij zgadywanie wpisując swoją propozycję w konsoli!', ''
  end
end

game = Game.new
game.hello
game.play
