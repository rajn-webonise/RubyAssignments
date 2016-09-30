require "../config/config"

require_relative "product"

class Seller < ActiveRecord::Base
  has_many :products
end

# byebug

puts 4
