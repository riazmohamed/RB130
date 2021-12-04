# Write a method that returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

=begin
========== THE PEDAC PROCESS ==========

=====> Problem:
Input: positive integer

Output: returns a list of all of the divisors of the positive integer passed in as an argument. The return value can be in any sequence you wish.

=====> Rules
Explicit Requiremnts:
  - Input is a positive integer
  - returns an array
Implicit Requiremnts:
  - the number will be divisible by itself hence the returned collection will have integer `1` in it by default
  - no duplicates of the elements in the returned array-
  - the number passed in as the argument is also present in the returned array

=====> (Any Questions / Assumptions needing clarification?)
(e.g. return the same string object or an entirely new string???)

=====> Examples, Edge Cases(test rules and boundaries)
divisors(1) == [1]
1 / 1

divisors(7) == [1, 7]
7 / 1 ==> (7, 1)

divisors(12) == [1, 2, 3, 4, 6, 12]
12 / 6 = 2
12 / 4 = 3
12 / 3 = 4
12 / 2 = 6
12 / 1 = 12
[1, 2, 3, 4, 5, 6, 12]

divisors(98) == [1, 2, 7, 14, 49, 98]
98 / 1 = 98
98 / 2 = 49
98 / 3 = float
98 / 4 = float
98 / 14
98 / 7
98 / 2
# Exclude the float

divisors(99400891) == [1, 9967, 9973, 99400891]

=====> Data structure(s):
Input: Integer
Intermediate: array
Output: array

=====> Algorithm:
divisors(num) -----> returns an array of divisors

given num = positive integer passed in as an argument
Initialize result = empty array
Initialize arr = new array
    - new array with elements ranging from 1..num (i.e the passed in argument)
Iterate over arr
    - for each iteration check the condition if (num.to_f / current element == num / current element)
    - if the above condition is true then capture the element in the result array

return the result array

=end

# Code With Intent

def divisors(num)
  result = []
  (1..num).each { |ele| result << ele if (num.to_f / ele) == (num / ele) }
  result
end

p divisors(1) == [1]                              # => true
p divisors(7) == [1, 7]                           # => true
p divisors(12) == [1, 2, 3, 4, 6, 12]             # => true
p divisors(98) == [1, 2, 7, 14, 49, 98]           # => true
p divisors(99400891) == [1, 9967, 9973, 99400891] # => true
