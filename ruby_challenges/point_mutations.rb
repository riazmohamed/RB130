class DNA
  attr_reader :string1
  attr_accessor :length

  def initialize(string1)
    @string1 = string1
    @length = 0
  end

  def hamming_distance(string2)
    return 0 if string1 == string2
    self.length = smallest_length(string1, string2)
    first = chosen_string(string1)
    second = chosen_string(string2)
    compare(first, second)
  end

  def smallest_length(first, second)
    [first, second].map {|ele| ele.chars.count }.min
  end

  def chosen_string(string)
    string.chars[0...length].join
  end

  def compare(first, second)
    hamming_count = 0
    first.chars.each_with_index do |letter, index|
      letter == second[index] ? hamming_count : hamming_count += 1
    end
    hamming_count
  end
end
