# frozen_string_literal: true

require './models/order'

module Orders
  # Service to print an order
  class Printer
    def call(order)
      raise Order::OrderNotPresentError if order.nil?

      order.line_items.each do |line_item|
        p "#{line_item.quantity} #{line_item.product.name}: #{format('%.2f', line_item.total)}"
      end
      p "Sales Taxes: #{format('%.2f', order.total_taxes)}"
      p "Total: #{format('%.2f', order.total)}"
      nil
    end
  end
end
