class PerfectNumber

  def self.divisor_sum(number)
    arr = []
    (1...number).each { |e| arr << e if number % e == 0 }
    arr.sum
  end

  def self.find_type(num, sum)
    case
      when sum == num then 'perfect'
      when sum < num then 'deficient'
      when sum > num then 'abundant'
    end
  end

  def self.classify(number)
    raise StandardError.new if number < 1
    aliquot_sum = divisor_sum(number)
    find_type(number, aliquot_sum)
  end

end
