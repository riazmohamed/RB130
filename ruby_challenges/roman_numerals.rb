class RomanNumeral
  attr_reader :number, :hsh
  attr_accessor :roman

  def initialize(number)
    @number = number
    @roman = ""
    @hsh = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }
  end

  def to_roman
    to_convert = number

    hsh.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        self.roman += (key * multiplier)
      end
      to_convert = remainder
    end
    roman
  end
end

# roma = RomanNumeral.new(367)
# p roma.to_roman
