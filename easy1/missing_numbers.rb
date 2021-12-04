# Write a method that takes a sorted array of integers as an argument, and returns an array that includes all of the missing integers (in order) between the first and last elements of the argument

=begin
========== THE PEDAC PROCESS ==========

=====> Problem:
Input: sorted array of integers as arguments

Output: returns an array with all the missing integers in order between the first and the last elements of the argument

=====> Rules
Explicit Requiremnts:
  - returns a sorted array
  - only integers
Implicit Requiremnts:
  - no special characters
  - when there is no range return an empty array

=====> (Any Questions / Assumptions needing clarification?)
(e.g. return the same string object or an entirely new string???)

=====> Examples, Edge Cases(test rules and boundaries)
missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]

missing([1, 2, 3, 4]) == []
# already in range ie no missing numbers

missing([1, 5]) == [2, 3, 4]

missing([6]) == []
cannot form a range

=====> Data structure(s):
Input: array of integer(s)
Intermediate: array
Output: array

=====> Algorithm:
missing(arr) -----> returns an array

given arr = collection of integers
    if the total number of elements in arr < 2 then return []
  otherwise
    return missing_range(arr)

missing_range(arr)
  range of arrays from the first element to the last element - arr

=end

# Code With Intent

def missing_range(arr)
  (arr[0]..arr[-1]).to_a - arr
end

def missing(arr)
  return [] if arr.size < 2
  missing_range(arr)
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
