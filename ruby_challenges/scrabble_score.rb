class Scrabble
  attr_reader :string
  attr_accessor :arr

  LETTER_VALUES = {
                    ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
                    ["D", "G"] => 2,
                    ["B", "C", "M", "P"] => 3,
                    ["F", "H", "V", "W", "Y"] => 4,
                    ["K"] => 5,
                    ["J", "X"] => 8,
                    ["Q", "Z"] => 10
                  }

  def initialize(string)
    @string = string
    @arr = []
  end

  def number_array
    val_arr = ""
    arr.map do |letter|
      LETTER_VALUES.keys.any? do |element|
        if element.include?(letter)
          val_arr = element
        end
      end
      LETTER_VALUES[val_arr]
    end
  end

  def score
    return 0 if string == nil
    self.arr = string.upcase.scan(/\w/)
    return 0 if arr == []
    num_arr = number_array
    num_arr.sum
  end

  def self.score(string)
    self.new(string).score
  end
end
