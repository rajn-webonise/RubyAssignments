#require "../config/config"

require File.dirname(__FILE__) + "/category.rb"
require File.dirname(__FILE__) + "/seller.rb"

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :seller

  validates :name, presence: true, length: { minimum: 4 }
  validates :price, numericality: true
end
