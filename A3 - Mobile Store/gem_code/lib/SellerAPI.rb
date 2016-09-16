require_relative 'UserModule.rb'

class SellerAPI

  attr_accessor :id, :name, :money, :valid_hash

  extend UserModule

  def self.add_product
    puts "Enter product details:"

    name = get_string("Name")
    color = get_string("Color")
    price = get_number("Price")
    quantity = get_number("Quantity")
    product = {name: name, color: color, price: price, quantity: quantity}
    ProductAPI.add(product)
  end

  def self.update_product
    list_products
    puts "\n\tEnter the product needed to be updated: "

    id = get_number("ID of product")
    key = get_string("Update field ")
    value = get_string("New value for '#{key}'")
    ProductAPI.update(id, key.to_sym, value)
  end

  def self.delete_product
    list_products
    print "\n\tEnter product id to be deleted: "
    id = gets.chomp.to_i
    ProductAPI.delete(id)
  end


end
