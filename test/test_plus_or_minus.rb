require 'minitest/autorun'
require_relative '../lib/plus_or_minus'

class PlusOrMinusTest < Minitest::Test
  using PlusOrMinus

  def setup
    @time = Time.new(2025, 1, 1, 12, 0, 0)
    @num = 100
  end

  def test_plus_or_minus_with_time
    range = @time.plus_or_minus(600)
    assert_equal (@time - 600)..(@time + 600), range
  end

  def test_plus_with_time
    range = @time.plus_upto(600)
    assert_equal @time..(@time + 600), range
  end

  def test_minus_with_time
    range = @time.minus_upto(600)
    assert_equal (@time - 600)..@time, range
  end

  def test_plus_or_minus_with_numbers
    range = @num.plus_or_minus(10)
    assert_equal (90..110), range
  end

  def test_plus_with_numbers
    range = @num.plus_upto(10)
    assert_equal (100..110), range
  end

  def test_minus_with_numbers
    range = @num.minus_upto(10)
    assert_equal (90..100), range
  end
end
