class SumOfMultiples
  attr_reader :value

  MULTI = [3, 5]

  def initialize(*value)
    @value = value
  end

  def self.to(num)
    (1...num).select { |n| MULTI.any? { |mul| n % mul == 0 } }.sum
  end

  def to(num)
    (1...num).select { |n| value.any? { |mul| n % mul == 0 } }.sum
  end
end
