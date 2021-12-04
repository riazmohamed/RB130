require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'optional_blocks'

class MockTest < Minitest::Test
  def test_add_numbers
    result = compute { 5 + 3 }
    assert_equal(result, 8)
  end

  def test_add_strings
    assert_equal(compute { 'a' + 'b' }, 'ab')
  end

  def test_no_block
    assert_equal(compute, 'Does not compute.')
  end
end
