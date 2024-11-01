# frozen_string_literal: true

# Author: Jaime Huarsaya Rivera
# Assumptions for the problem:
# The line inputs will always have the form: "<quantity> <product_name> at <base_price>"
# quantity is always an integer
# product name is a string
# base_price is a float
# The script will treat the data as such.

# To run the script run: irb app.rb
# It will require you to copy paste the input to the standard input thorugh the console.
# For example (don't include the # from the comments):
# 1 imported bottle of perfume at 27.99
# 1 bottle of perfume at 18.99
# 1 packet of headache pills at 9.75
# 3 imported boxes of chocolates at 11.25
# After pasting the input, press Enter to process the order.
# The script will make the tax calculations and will print the result.
require './lib/orders/console_processor'
require './lib/orders/printer'

# Application
class App
  def call
    processor = Orders::ConsoleProcessor.new
    processor.call
    order = processor.order
    printer = Orders::Printer.new
    order.print_order(printer)
  end
end

App.new.call
