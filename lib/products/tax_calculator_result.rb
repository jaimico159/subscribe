# frozen_string_literal: true

module Products
  # Class to store the results of the calculation
  class TaxCalculatorResult
    attr_accessor :base_price, :basic_tax_total, :import_duty_tax_total, :total_taxes, :total

    def initialize(base_price:, basic_tax_total:, import_duty_tax_total:, total_taxes:, total:)
      self.base_price = base_price
      self.basic_tax_total = basic_tax_total
      self.import_duty_tax_total = import_duty_tax_total
      self.total_taxes = total_taxes
      self.total = total
    end
  end
end
