require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'missing_numbers'

class MissingNumbers < Minitest::Test
  def test_missing_range
    assert_equal(missing([6]), [])
    assert_equal(missing([1, 2, 3, 4]), [])
    assert_equal(missing([1, 5]), [2, 3, 4])
    assert_equal(missing([-3, -2, 1, 5]), [-1, 0, 2, 3, 4])
  end
end
