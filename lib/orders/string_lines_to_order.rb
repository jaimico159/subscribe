# frozen_string_literal: true

require './models/order'
require './models/product'
require './models/line_item'
require './lib/products/tax_calculator'

module Orders
  # Service to parse the lines to line items and to create an Order
  class StringLinesToOrder
    attr_accessor :line, :order

    def initialize
      self.order = Order.new
    end

    def call(line)
      self.line = line
      process_line
      self.line = nil
    end

    def process_order
      order.line_items.each do |line_item|
        product = line_item.product
        strategy = Products::TaxCalculator.new(product: product)
        strategy.call
        result = strategy.result
        line_item.total_taxes = result.total_taxes * line_item.quantity
        line_item.total = result.total * line_item.quantity
      end

      order.total_taxes = order.line_items.sum(&:total_taxes)
      order.total = order.line_items.sum(&:total)
    end

    private

    def process_line
      first_part, price = line.split(' at ')
      quantity, name = first_part.split(' ', 2)

      product = Product.new(name: name, base_price: price.to_f)
      line_item = LineItem.new(product: product, quantity: quantity.to_i)

      order.add_line_item(line_item)
    end
  end
end
