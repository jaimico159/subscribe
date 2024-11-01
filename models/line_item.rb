# frozen_string_literal: true

# Line Item model
class LineItem
  attr_accessor :product, :quantity, :total_taxes, :total

  def initialize(product:, quantity:)
    self.product = product
    self.quantity = quantity
    total_taxes = 0.0
    total = 0.0
  end
end
