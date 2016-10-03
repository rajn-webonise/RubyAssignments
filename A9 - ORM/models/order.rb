
require File.dirname(__FILE__) + "/buyer"
require File.dirname(__FILE__) +  "/product"
require File.dirname(__FILE__) +  "/order_item"

class Order < ActiveRecord::Base
  belongs_to :buyer
  has_many :order_items
end
