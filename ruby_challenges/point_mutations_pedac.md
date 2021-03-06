# Hamming distance
Counting the number of differences between the two homologous strand of DNA taken from a differnt genome from a common ancenstor

### Write a programme that can calculate the Hamming distance between two DNA strands

### ========== THE PEDAC PROCESS ==========

### =====> Problem:

Input: given two strings of equal length

Output: integer denoting the Hamming number

### =====> Rules

#### Explicit Requirements:

  - The two strings should be of equal value
  - if one of them is small then use the length of the smallest one for both
  - returns the difference count

#### Implicit Requiremnts:

  - can be empty strings
  - one string can be smaller than the other
  - when they both are the same then return 0
  - test_ignores_extra_length_on_other_strand_when_longer
  - test_ignores_extra_length_on_original_strand_when_longer
  - test_does_not_actually_shorten_original_strand
  - Both the strings are in upper cases

### =====> (Any Questions / Assumptions needing clarification?)

(e.g. return the same string object or an entirely new string???)

### =====> Examples, Edge Cases(test rules and boundaries)

 test_no_difference_between_empty_strands
    assert_equal 0, DNA.new('').hamming_distance('')
    - when both are empty string then return the diffreence which is 0

 test_no_difference_between_identical_strands
    assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
  when they both are the same then return 0

 test_complete_hamming_distance_in_small_strand
    assert_equal 3, DNA.new('ACT').hamming_distance('GGA')
    ACT
    GGA
    ^^^ - 3

 test_hamming_distance_in_off_by_one_strand
    strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
    distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
    assert_equal 19, DNA.new(strand).hamming_distance(distance)
    GGACGGATTCTGACCTGGACTAATTTTGGGG
    AGGACGGATTCTGACCTGGACTAATTTTGGGG
    ^ ^^^ ^^ ^^^^^ ^^ ^^^^ ^   ^     - 19
    note:- only the smaller one is counted

 test_small_hamming_distance_in_middle_somewhere
    assert_equal 1, DNA.new('GGACG').hamming_distance('GGTCG')

 test_larger_distance
    assert_equal 2, DNA.new('ACCAGGG').hamming_distance('ACTATGG')

 test_ignores_extra_length_on_other_strand_when_longer
    assert_equal 3, DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')
    A AA CTAG G GG
    A GG CTAG C GG
    A GG CTAG C GG TAGGAC

 test_ignores_extra_length_on_original_strand_when_longer
    strand = 'GACTACGGACAGGGTAGGGAAT'
    distance = 'GACATCGCACACC'
    assert_equal 5, DNA.new(strand).hamming_distance(distance)

 test_does_not_actually_shorten_original_strand
    dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')
    assert_equal 1, dna.hamming_distance('AGGCAA')
    assert_equal 4, dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
    assert_equal 1, dna.hamming_distance('AGG')

    AGACAACAGCCAGCCGCCGGATT
    AGGCAA - 1
    AGACATCTTTCAGCCGCCGGATT AGGCAA - 4
    AGG - 1

### =====> Data structure(s):

Input: String
Intermediate: Array
Output: Integer

### =====> Algorithm:

Initialize a class DNA
  getter method for string1
  getter/setter method for length

  define #initialize(string1)
    - Instance variable @string1 = parameter string1
    - Instance variable @length = 0

  define hamming_distance(string2)
    - return 0 if string1 == string2
    - SET self.length = smallest_length(string1, string2)
    - initialize first = chosen_string(string1)
    - initialize second = chosen_string(string2)
    - compare(first, second)

  SUBPROCESS smallest_length(string1, string2)
  - find out the smallest of the two strings with the alphabet count
  - return the smallest count

  SUBPROCESS chosen_string(string)
  - return string.chars[0...length].join

  SUBPROCESS compare(first, second)
    - initialize hamming_count = 0
    - first.chars.each_with_index |letter, index|
        letter == second[index] ? hamming_count : hamming_count += 1
    - return hamming_count

### =====> Implementation (Optional):

# Code With Intent

```ruby
class DNA
  attr_reader :string1
  attr_accessor :length

  def initialize(string1)
    @string1 = string1
    @length = 0
  end

  def hamming_distance(string2)
    return 0 if string1 == string2
    self.length = smallest_length(string1, string2)
    first = chosen_string(string1)
    second = chosen_string(string2)
    compare(first, second)
  end

  def smallest_length(first, second)
    [first, second].map {|ele| ele.chars.count }.min
  end

  def chosen_string(string)
    string.chars[0...length].join
  end

  def compare(first, second)
    hamming_count = 0
    first.chars.each_with_index do |letter, index|
      letter == second[index] ? hamming_count : hamming_count += 1
    end
    hamming_count
  end
end
```
# [MiniTest](./test_point_mutations.rb)

```ruby
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require_relative 'point_mutations'

class DNATest < Minitest::Test
  def test_no_difference_between_empty_strands
    assert_equal 0, DNA.new('').hamming_distance('')
  end

  def test_no_difference_between_identical_strands
    # skip
    assert_equal 0, DNA.new('GGACTGA').hamming_distance('GGACTGA')
  end

  def test_complete_hamming_distance_in_small_strand
    # skip
    assert_equal 3, DNA.new('ACT').hamming_distance('GGA')
  end

  def test_hamming_distance_in_off_by_one_strand
    # skip
    strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
    distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
    assert_equal 19, DNA.new(strand).hamming_distance(distance)
  end

  def test_small_hamming_distance_in_middle_somewhere
    # skip
    assert_equal 1, DNA.new('GGACG').hamming_distance('GGTCG')
  end

  def test_larger_distance
    # skip
    assert_equal 2, DNA.new('ACCAGGG').hamming_distance('ACTATGG')
  end

  def test_ignores_extra_length_on_other_strand_when_longer
    # skip
    assert_equal 3, DNA.new('AAACTAGGGG').hamming_distance('AGGCTAGCGGTAGGAC')
  end

  def test_ignores_extra_length_on_original_strand_when_longer
    # skip
    strand = 'GACTACGGACAGGGTAGGGAAT'
    distance = 'GACATCGCACACC'
    assert_equal 5, DNA.new(strand).hamming_distance(distance)
  end

  def test_does_not_actually_shorten_original_strand
    # skip
    dna = DNA.new('AGACAACAGCCAGCCGCCGGATT')
    assert_equal 1, dna.hamming_distance('AGGCAA')
    assert_equal 4, dna.hamming_distance('AGACATCTTTCAGCCGCCGGATTAGGCAA')
    assert_equal 1, dna.hamming_distance('AGG')
  end
end
```
