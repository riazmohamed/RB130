# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.

=begin
========== THE PEDAC PROCESS ==========

=====> Problem:
Input: Given a triangle
        # An equilateral triangle has all three sides the same length.
        # An isosceles triangle has exactly two sides of the same length.
        # A scalene triangle has all sides of different lengths.

Output: A string which says whether a triangle is equilateral, isosceles, or scalene.

=====> Rules
Explicit Requiremnts:
  - given length of the sides of the triangle as integers
  - When the value is <= 0 raise an ArgumentError
  -  the sum of the lengths of any two sides must be greater than the length of the third side (for isoceles and scalene triangles only).
  - equilateral triangle has all sides equal
  - isoceles triangle has two sides equal
  - scalene triangle has no side equal. All three are different

Implicit Requiremnts:
  - Arguments can be positive or negative integers
  - only integers allowed

=====> (Any Questions / Assumptions needing clarification?)
(e.g. return the same string object or an entirely new string???)

=====> Examples, Edge Cases(test rules and boundaries)
Valid tests
    Triangle.new(2, 2, 2).kind == 'equilateral'
    Triangle.new(3, 4, 4).kind == 'isosceles'
    Triangle.new(3, 4, 5).kind == 'scalene'
    Triangle.new(0.4, 0.6, 0.3).kind = 'scalene'

The following test cases should produce an error as
- One or more of the arguments are 0 or lesser then 0
    Triangle.new(0, 0, 0)
    Triangle.new(3, 4, -5)

- The sum of any two sides are not greater than the third side
    Triangle.new(7, 3, 2)
    Triangle.new(10, 1, 3)
    Triangle.new(1, 1, 2)

=====> Data structure(s):
Input: Integers
Intermediate: array, string
Output: string

=====> Algorithm:
- Initialize a new class (Triangle)
  - constructor - Initialize the constructor method, #initialize
    - initialize(side1, side2, side3)
      - The constructor method takes three arguments
        initialize instance varibles
        @side1 = side1
        @side2 = side2
        @side3 = side3
    - raise an ArgumentError unless valid?

  - #kind - initialize the kind method
    assign scalene, equilateral or isoceles to the appropriate triangle
    - if all_sides_equal then return "equilateral"
    - if two_sides_greater then && al thn return "isoceles"
    - otherwise return "scalene"

  - define #all_sides_equal - check if all the sides are equal
    - @side1 == @side2 == @side3

  - define #greater_than_zero - check if all the sides are greater then zero
    [@side1, @side2, @side3].all? { |num| num > 0 }

  - define #two_sides_greater - check if any two sides are greater than the third
    @side1 + @side2 > @side3 ||
    @side2 + @side3 > @side1 ||
    @side1 + @side3 > @side 2

  - define two_sides_equal
    any two sides are equal
    - @side1 == @side2 || @side2 == @side3

  - valid? - private helper method
    - checks if the triangle is valid
      - #all_sides_equal || #greater_than_zero || #two_sides_greater
=end

# Code With Intent

class Triangle.new
  attr_reader :kind

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise ArgumentError.new("This is not a valid triangle!") unless valid?
  end

  def kind
    if all_sides_equal
      "equilateral"
    elsif two_sides_equal
      "isosceles"
    else
      "scalene"
    end
  end

  def all_sides_equal
    @side1 == @side2 == @side3
  end

  def greater_than_zero
    [@side1, @side2, @side3].all? { |num| num > 0 }
  end

  def two_sides_greater
    @side1 + @side2 > @side3 ||
    @side2 + @side3 > @side1 ||
    @side1 + @side3 > @side2
  end

  def two_sides_equal
    @side1 == @side2 || @side2 == @side3
  end

  private

  def valid?
    all_sides_equal || greater_than_zero || two_sides_greater
  end
end
