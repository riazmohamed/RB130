# Topics

1. ### [Times method](#building-our-own-times-method)

2. ### [Each method](#build-an-each-method)

3. ### [Select Method](#build-select-method)

4. 

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

# Build an each method

## Original implementation

```ruby
#each method
[1, 2, 3].each { |num| puts "do_nothing" }
```

Here the `Array#each` method iterates over an array of integers and yielding each element to the block, applying the logic within the block to the elements in each iteration. `#each` method always returns the calling object.

## Own implementation

```ruby
# Own implementation of the each method which iterates over an array and displays it while returning the calling object
def each(array)
  counter = 0

  loop do
    yield(array[counter])
    counter += 1
    break if counter == array.size
  end

  array
end

p each([1, 2, 3]) { |num| puts num }

# 1
# 2
# 3
# => [1, 2, 3]
```

## LS Implementation 

```ruby 
def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])                           # yield to the block, passing in the current element to the block
    counter += 1
  end

  array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

# 1
# 2
# 3
# 4
# 5
# => [1, 2, 3, 4, 5]
```

Blocks helps the method callers to add additional details during the method invocation by passing in a block. After the block is executed then the execution is returned back to the while loop in the above example.

# Build select method

## Own implementation

```ruby
# build a custom #select method to fullfill the following test cases

array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true
```

## Solution

```ruby
def select(array)
  arr = []

  array.each do |num|
    arr << num if yield(num)
  end

  arr
end

array = [1, 2, 3, 4, 5]

select(array) { |num| num.odd? }      # => [1, 3, 5]
select(array) { |num| puts num }      # => []
select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5]
```

In `line 4 - 6` the `each` method iterates over the collection and it yields the current element to the block. Within the block taken by the `each` method we are yielding the current element to the block passed in as an implicit argument to the `select` method invocation in `lines 13, 14 and 15`. This implicit block  takes a block argument as shown by the block parameter `num`. Within the block the block parameter `num` acts as a `block local variable` which is used by the logic within the block. If this implict block evaluates to `true` then the conditional in `line 5` executes thereby appending the current element into the array referenced by `arr`. Since `arr` is the last evaluated expression within the `select` method, a new collection is returned containing elements based on the truthiness of the return value of the block which is passed in implicitly during the `select` method invocation.

## Another Implementation (LS)

```ruby
def select(array)
  counter = 0
  result = []

  while counter < array.size
    current_element = array[counter]
    result << current_element if yield(current_element)
    counter += 1
  end

  result
end
```



