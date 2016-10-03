
require File.dirname(__FILE__) + "/order"

class OrderItem < ActiveRecord::Base
  belongs_to :order
end
