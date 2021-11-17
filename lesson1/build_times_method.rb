# build our own times method
# original method
5.times do |num|
  puts num
end

# 0
# 1
# 2
# 3
# 4
# => 5

# our own times method
def times(number)
  counter = 0
  arr = []

  loop do
    arr << counter
    counter += 1
    break if counter == number
  end

  arr.each { |num| yield(num) }
  number
end

p times(5) { |num| puts num }

# 0
# 1
# 2
# 3
# 4
# => 5

# In the above example we are creating our own times method by yielding to the block provided during the times method invocation
