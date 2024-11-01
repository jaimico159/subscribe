# frozen_string_literal: true

require './lib/orders/string_lines_to_order'

module Orders
  # Service to process the user input through the standard input
  class ConsoleProcessor
    attr_accessor :order

    def call
      parser = Orders::StringLinesToOrder.new
      loop do
        line = gets.chomp
        break if line.empty?

        parser.call(line.strip.squeeze(' '))
      end
      parser.process_order
      self.order = parser.order
    end
  end
end
