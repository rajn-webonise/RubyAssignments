
require File.dirname(__FILE__) + "/product.rb"

class Seller < ActiveRecord::Base
  has_many :products
end
