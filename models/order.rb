# frozen_string_literal: true

# Order model
class Order
  attr_accessor :line_items, :total_taxes, :total

  OrderNotPresentError = Class.new(StandardError)
  EmptyOrderError = Class.new(StandardError)
  InvalidAttributeError = Class.new(StandardError)

  def initialize
    self.line_items = []
    self.total_taxes = 0.0
    self.total = 0.0
  end

  def add_line_item(line_item)
    line_items << line_item
  end

  def print_order(printer)
    printer.call(self)
  end
end
