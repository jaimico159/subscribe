require 'minitest/autorun'
require './lib/orders/printer'
require './models/order'

class TestTaxCalculator < Minitest::Test
  def test_empty_product
    assert_raises(Order::OrderNotPresentError) do
      printer = Orders::Printer.new
      printer.call(nil)
    end
  end
end
