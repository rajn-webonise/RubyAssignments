require "../config/config"

require_relative "category.rb"
require_relative "seller.rb"

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :seller

  validates :name, presence: true, length: { minimum: 4 }
  validates :price, numericality: true
end

# byebug

puts 4
