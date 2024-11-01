require 'minitest/autorun'
require './lib/products/tax_calculator'
require './models/order'
require './models/product'

class TestTaxCalculator < Minitest::Test
  def test_only_basic_tax_value
    product = Product.new(name: 'shoes', base_price: 10.0)
    tax_calculator = Products::TaxCalculator.new(product: product)
    tax_calculator.call
    result = tax_calculator.result
    assert_equal result.basic_tax_total, 1.0
    assert_equal result.import_duty_tax_total, 0.0
    assert_equal result.total_taxes, 1.0
    assert_equal result.total, 11.0
  end

  def test_only_imported_tax_value
    product = Product.new(name: 'imported chocolate', base_price: 10.0)
    tax_calculator = Products::TaxCalculator.new(product: product)
    tax_calculator.call
    result = tax_calculator.result
    assert_equal result.basic_tax_total, 0.0
    assert_equal result.import_duty_tax_total, 0.5
    assert_equal result.total_taxes, 0.5
    assert_equal result.total, 10.5
  end

  def test_imported_and_food_tax_value
    product = Product.new(name: 'imported shoes', base_price: 10.0)
    tax_calculator = Products::TaxCalculator.new(product: product)
    tax_calculator.call
    result = tax_calculator.result
    assert_equal result.basic_tax_total, 1.0
    assert_equal result.import_duty_tax_total, 0.5
    assert_equal result.total_taxes, 1.5
    assert_equal result.total, 11.5
  end

  def test_exempt_and_local_tax_value
    product = Product.new(name: 'chocolate', base_price: 10.0)
    tax_calculator = Products::TaxCalculator.new(product: product)
    tax_calculator.call
    result = tax_calculator.result
    assert_equal result.basic_tax_total, 0.0
    assert_equal result.import_duty_tax_total, 0.0
    assert_equal result.total_taxes, 0.0
    assert_equal result.total, 10.0
  end
end
