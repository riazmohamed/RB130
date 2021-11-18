def reduce(array, starting_value=nil)
  array = array.clone
  starting_value = array.shift if starting_value == nil

  array.each do |num|
    starting_value = yield(starting_value, num)
  end

  starting_value
end

array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
p reduce(array) { |acc, num| acc += num if num.odd?; acc }  # => 9
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
