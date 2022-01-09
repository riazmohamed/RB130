class Series
  attr_reader :num
  
  def initialize(num)
    @num = num
  end

  def slices(number)
    raise ArgumentError.new unless num.size >= number
    arr = []
    num.chars.each_cons(number) { |ele| arr << ele.map(&:to_i) }
    arr
  end
end
