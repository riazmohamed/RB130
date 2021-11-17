# Topics

1. ### [Times method](#building-our-own-times-method)

2. ### 

# Building our own times method

## Original times method behaviour

```ruby
5.times do |num|
  puts num
end

# 0
# 1
# 2
# 3
# 4
# => 5
```

## Times method implmentation

```ruby
# method implementation
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

# method invocation
p times(5) { |num| puts num }

# 0
# 1
# 2
# 3
# 4
# => 5
```

## LS implementation

```ruby
# method implementation
def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number                      # return the original method argument to match behavior of `Integer#times`
end

# method invocation
times(5) do |num|
  puts num
end

# Output:
# 0
# 1
# 2
# 3
# 4
# => 5
```

here we are `yielding the execution to the block` and also passing an argument to the block. During the method invocation we are passing in a block that takes an argument