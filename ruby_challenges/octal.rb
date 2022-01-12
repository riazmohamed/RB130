class Octal
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def valid_octal_number?
    num.chars.all? { |ele| %w(0 1 2 3 4 5 6 7).include? ele }
  end

  def to_decimal
    return 0 unless valid_octal_number?
    num.to_i.digits.map.with_index { |n, i| n * 8**i }.sum
  end
end
