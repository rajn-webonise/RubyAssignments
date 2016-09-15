#Dir[ Dir.pwd + "/*.rb"].each {|file| require file }

#load 'UserModule.rb'


class SellerAPI

  attr_accessor :id, :name, :money, :valid_hash

  extend UserModule

  def self.add_product
    puts "Enter product details:"
    print "\tName: "
    name = gets.chomp
    print "\tColor: "
    color = gets.chomp
    print "\tPrice: "
    price = gets.chomp
    print "\tQuantity: "
    quantity = gets.chomp

    product = {name: name, color: color, price: price, quantity: quantity}
    ProductAPI.add(product)
    system 'clear'
  end


  def self.update_product(id, key, value)
    list_products
    print "\n\nEnter product 'id key value' to be updated: "
    input = gets.chomp.split(" ")
    ProductAPI.update(input[0].to_i, input[1].to_s, input[2])
    system 'clear'
  end

  def self.delete_product
    list_products
    print "\n\nEnter product id to be deleted: "
    id = gets.chomp.to_i
    ProductAPI.delete(id)
    system 'clear'
  end


  def self.show_options
    loop do
      print "\n\t\t\t--- --- ----\n\n\nEnter your option: 'list' | 'search' | 'add' | 'update' | 'delete' | 'quit' : "
      choice = gets.chomp.downcase

      if choice == "list"
        list_products()
      elsif choice == "search"
        search_product
      elsif choice == "add"
        add_product
      elsif choice == 'update'
        update_product
      elsif choice == 'delete'
        delete_product
      elsif choice == "quit"
        break
      else
        "Woops, invalid input. Can you enter again?"
      end
    end
  end



end
