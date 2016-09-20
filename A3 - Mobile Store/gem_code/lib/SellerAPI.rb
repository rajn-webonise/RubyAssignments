require_relative 'UserModule.rb'

$SELLER_OPTIONS = {list: "list", search: "search", add: "add", update: "update", delete: "delete"}
$PRODUCT_FIELD = {name: "Name", color: "Price", quantity: "Quantity"}

class SellerAPI

  attr_accessor :id, :name, :money, :valid_hash

  extend UserModule

  def self.add_product
    puts "Enter product details: ('q' to quit )"

    name = get_string($PRODUCT_FIELD[:name])
    return if name == -1
    color = get_string($PRODUCT_FIELD[:color])
    return if color == -1
    price = get_number($PRODUCT_FIELD[:price])
    return if price == -1
    quantity = get_number($PRODUCT_FIELD[:quantity])
    return if quantity == -1

    product = {name: name, color: color, price: price, quantity: quantity}
    ProductAPI.add(product)
  end

  def self.update_product
    list_products
    puts "\n\tEnter the product needed to be updated: ('q' to quit) "

    id = get_number("ID of product")
    return if id == -1
    key = get_string("Update field ")
    return if key == -1
    value = get_string("New value for '#{key}'")
    return if id == -1

    ProductAPI.update(id, key.to_sym, value)
  end

  def self.delete_product
    list_products
    print "\n\tEnter product id to be deleted ('q' to quit): "
    id = gets.chomp.to_i
    return if id == -1
    ProductAPI.delete(id)
  end


end
