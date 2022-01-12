# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable  Style/Documentation
class Octal
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def valid_octal_number?
    num.chars.all? { |ele| ('0'..'7').to_a.include? ele }
  end

  def to_decimal
    return 0 unless valid_octal_number?

    num.to_i.digits.map.with_index { |n, i| n * 8**i }.sum
  end

  private :valid_octal_number?
end
# rubocop:enable Style/FrozenStringLiteralComment
# rubocop:enable  Style/Documentation
