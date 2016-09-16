require  Dir.pwd + '/lib/ProductAPI.rb'
require  Dir.pwd + '/lib/TranscationAPI.rb'
require  Dir.pwd + '/lib/BuyerAPI.rb'
require  Dir.pwd + '/lib/SellerAPI.rb'

class MobiStore

  def self.get_logo
    "\n\t\t\t________________\n"+
      "\t\t\t[The Mobi Store]"+
      "\n\n\n"
  end

  def self.show_seller_options
    system 'clear'
    loop do
      print "#{get_logo}\tEnter your option:\n\t'list' | 'search' | 'add' | 'update' | 'delete' | 'quit' : "
      choice = gets.chomp.downcase

      if choice == "list"
        SellerAPI.list_products
      elsif choice == "search"
        SellerAPI.search_product
      elsif choice == "add"
        SellerAPI.add_product
      elsif choice == 'update'
        SellerAPI.update_product
      elsif choice == 'delete'
        SellerAPI.delete_product
      elsif choice == "quit"
        break
      else
        puts "Woops, invalid input. Can you enter again?"
      end
    end
  end


  def self.show_buyer_options
    system 'clear'
    loop do
      print "#{get_logo}\tEnter your option:\n\t'list' | 'search' | 'buy' | 'quit' : "
      choice = gets.chomp.downcase

      if choice == "list"
        BuyerAPI.list_products
      elsif choice == "search"
        BuyerAPI.search_product
      elsif choice == "buy"
        BuyerAPI.buy
      elsif choice == "quit"
        break
      else
        puts "Woops, invalid input. Can you enter again?"
      end
    end
  end



  def self.init
    ProductAPI.seed
    TranscationAPI.seed
    system 'clear'
    print "#{get_logo}\tWhich type of user are you? 'Buyer' | 'Seller' : "
    choice = gets.chomp.downcase
    if choice == "buyer"
      show_buyer_options
    elsif choice == "seller"
      show_seller_options
    else
      puts "Invalid input, try again?"
      return init
    end
  end

end
