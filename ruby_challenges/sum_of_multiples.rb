# rubocop:disable Style/FrozenStringLiteralComment
# rubocop:disable  Style/Documentation
class SumOfMultiples
  attr_reader :value

  def initialize(*value)
    @value = value == [] ? [3, 5] : value
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end

  def to(num)
    (1...num).select { |n| value.any? { |mul| (n % mul).zero? } }.sum
  end
end
# rubocop:enable Style/FrozenStringLiteralComment
# rubocop:enable  Style/Documentation
