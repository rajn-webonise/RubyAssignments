require "../config/config"

require_relative "product.rb"
#Dir["#{File.dirname(__FILE__)}/*.rb"].each { |f| load(f) }

class Category < ActiveRecord::Base
  has_many :products
  validates :name, presence: true, length: { minimum: 4 }
end

#byebug

puts 4
