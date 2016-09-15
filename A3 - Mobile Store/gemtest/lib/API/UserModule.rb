#require "ProductAPI.rb"

module UserModule
  def self.list_products
    system 'clear'
    puts "MAAAAAAAAAAAAAAADARRRRRRRRRRRRRRRRRRRRRRRRRRRR"
    #puts ProductAPI.get_list
  end

  def self.search_product
    list_products
    puts "\n\nEnter 'key value' pair (space in between) to search a product: "
  #  puts ProductAPI.search(key, value)
  end
end
