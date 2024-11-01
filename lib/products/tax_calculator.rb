# frozen_string_literal: true

require './lib/products/tax_calculator_result'

module Products
  # Service to calculate the taxes for a given product
  class TaxCalculator
    attr_accessor :product, :result

    EXEMPT_WORDS = %w[choco book pill].freeze

    def initialize(product:)
      raise StandardError('Product not present') if product.nil?

      self.product = product
      self.result = TaxCalculatorResult.new(base_price: 0.0, basic_tax_total: 0.0, import_duty_tax_total: 0.0,
                                            total_taxes: 0.0, total: 0.0)
    end

    def call
      result.base_price = product.base_price
      result.basic_tax_total = ((product.base_price * 0.1) * 20).ceil / 20.0 unless exempt?
      result.import_duty_tax_total = ((product.base_price * 0.05) * 20).ceil / 20.0 if imported?
      result.total_taxes = (result.basic_tax_total + result.import_duty_tax_total).round(2)
      result.total = (result.base_price + result.total_taxes).round(2)
    end

    private

    def exempt?
      EXEMPT_WORDS.each do |word|
        return true if product.name.include?(word)
      end
      false
    end

    def imported?
      product.name.start_with?('imported')
    end
  end
end
