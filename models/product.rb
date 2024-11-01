# frozen_string_literal: true

# Product model
class Product
  attr_accessor :name, :base_price

  def initialize(name:, base_price: 0.0)
    self.name = name
    self.base_price = base_price
  end
end
