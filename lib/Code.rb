class Code	# Kod do odgadnięcia albo zgadywany kod

attr_reader :code

$length = 4	# długość każdego kodu
$complexity = 4	# ilość różnych znaków w kodzie NIE PRZEKRACZAC 9
@code = ""	# kod przechowywany w Stringu
$display_mode = 0

def self.info
"Kod musi mieć #{length} cyfr#{length<=4 ? "y" : ""} z przedialu 1..#{complexity}"
end

def self.set length=4, complexity=4, display_mode=0
$length = length
$complexity = complexity
$display_mode = display_mode
end

def self.length
$length
end

def self.complexity
$complexity
end

def initialize code = random	# inicjalizujemy kod własnym albo losowym
@code = code
self.valid?
end

def random	# metoda losująca
code = ""
$length.times do
code += ((rand ($complexity))+1).to_i.to_s
end
code
end

def to_s
@code
end

def valid?
valid = true
valid = false if @code.length != $length
return false unless valid
@code.each_char do |c|
valid = false if c.to_s <= 0.to_s or c.to_s > $complexity.to_s
end
valid
end

def <=> code
return -1 if self.to_s < code.to_s
return 0 if self.to_s == code.to_s
return 1
end

def compare	code	# metoda porównuje kody i zwraca odpowiednie dane
#code must be valid
dobre_miejsce = 0
dobra_liczba = 0
code_temp = String.new code.to_s
for i in 0..($length-1)
dobre_miejsce += 1 if @code[i]==code.to_s[i]
if code_temp.include? @code[i]
code_temp[code_temp.index @code[i]] = 'x'
dobra_liczba += 1
end
end
if $display_mode==0
dobra_liczba.to_s + " " + dobre_miejsce.to_s
else
(dobra_liczba-dobre_miejsce).to_s + " " + dobre_miejsce.to_s
end
end
end
