# rubocop:disable GlobalVars
require_relative 'Code'

# Klasa wykonywalna Game.rb, zawiera podstawowy interfejs programu Mastermind
class Game
  def initialize
    @secret_code = Code.new
  end

  def guess
    begin
      input = input_reader
      $code = Code.new(input)
      puts Code.info unless $code.valid?
    end while !$code.valid?
    if @secret_code.code == $code.code then true
    else
      puts "#{$code} #{@secret_code.compare $code}"
      false
    end
  end

  def input_reader
    input = gets.chomp
    if input.include?('nowa')
      puts '[to do] powinna sie zaczac nowa gra'
    end
    input
  end

  def play
    tries = 0
    begin
      tries += 1
    end while !guess
    puts "Odgadłeś kod po #{tries} prób#{tries == 1 ? 'ie' : 'ach'}."
  end

  def hello
    puts '', 'Mastermind 1.0'.center(80)
    puts "długość_kodu = #{Code.length}"
    puts "różnych_znaków = #{Code.complexity}", ''
  end
end

game = Game.new
game.hello
game.play
