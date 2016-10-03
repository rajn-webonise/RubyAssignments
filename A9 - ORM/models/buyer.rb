
require File.dirname(__FILE__) + "/order.rb"

class Buyer < ActiveRecord::Base
  has_many :orders
end
