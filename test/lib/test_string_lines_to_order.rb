require 'minitest/autorun'
require './lib/orders/string_lines_to_order'
require './models/order'

class TestStringLinesToOrder < Minitest::Test
  def setup
    @string_lines_to_order = Orders::StringLinesToOrder.new
  end

  def test_empty_order
    assert_raises(Order::EmptyOrderError) do
      @string_lines_to_order.process_order
    end
  end

  def test_single_valid_line
    line = '2 book at 12.49'
    @string_lines_to_order.call(line)
    @string_lines_to_order.process_order
    refute_nil @string_lines_to_order.order
    refute_empty @string_lines_to_order.order.line_items
  end

  def test_single_invalid_line_case1
    line = '2 at 12.49'
    assert_raises(Order::InvalidAttributeError) do
      @string_lines_to_order.call(line)
    end
  end

  def test_single_invalid_line_case2
    line = '2 12.49'
    assert_raises(Order::InvalidAttributeError) do
      @string_lines_to_order.call(line)
    end
  end

  def test_single_invalid_line_case3
    line = 'at 12.49'
    assert_raises(Order::InvalidAttributeError) do
      @string_lines_to_order.call(line)
    end
  end

  def test_single_invalid_line_case4
    line = ''
    assert_raises(Orders::StringLinesToOrder::InvalidLineError) do
      @string_lines_to_order.call(line)
    end
  end
end
