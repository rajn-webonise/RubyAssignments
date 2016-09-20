require_relative 'ProductAPI.rb'
require_relative 'TranscationAPI.rb'
require_relative 'BuyerAPI.rb'
require_relative 'SellerAPI.rb'

class MobiStore

  def self.get_logo
    "\n\t\t\t________________\n"  +
    "\t\t\t[The Mobi Store]"      +
    "\n\n\n"
  end

  def self.show_seller_options
    system 'clear'
    loop do
      print "#{get_logo}\tEnter your option:\n\t " +
                "'#{$SELLER_OPTIONS[:list]}' | " +
                "'#{$SELLER_OPTIONS[:search]}'| " +
                "'#{$SELLER_OPTIONS[:add]}' | " +
                "'#{$SELLER_OPTIONS[:update]}'| " +
                "'#{$SELLER_OPTIONS[:update]}'| " +
                "'quit' (q) : "

      choice = gets.chomp.downcase

      if choice == $SELLER_OPTIONS[:list]
        SellerAPI.list_products
      elsif choice == $SELLER_OPTIONS[:search]
        SellerAPI.search_product
      elsif choice == $SELLER_OPTIONS[:add]
        SellerAPI.add_product
      elsif choice == $SELLER_OPTIONS[:update]
        SellerAPI.update_product
      elsif choice == $SELLER_OPTIONS[:delete]
        SellerAPI.delete_product
      elsif choice == "quit" || choice == 'q'
        break
      else
        puts "Woops, invalid input. Can you enter again?"
      end
    end
  end


  def self.show_buyer_options
    system 'clear'
    loop do
      print "#{get_logo}\tEnter your option:\n\t " +
                "'#{$BUYER_OPTIONS[:list]}' | " +
                "'#{$BUYER_OPTIONS[:search]}'| " +
                "'#{$BUYER_OPTIONS[:buy]}' | " +
                "'quit' (q) : "
      choice = gets.chomp.downcase

      if choice == $BUYER_OPTIONS[:list]
        BuyerAPI.list_products
      elsif choice == $BUYER_OPTIONS[:search]
        BuyerAPI.search_product
      elsif choice == $BUYER_OPTIONS[:buy]
        BuyerAPI.list_products
        BuyerAPI.buy
      elsif choice == "quit" || choice == 'q'
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
    print "#{get_logo}\tWhich type of user are you? 'Buyer'(b) | 'Seller'(s) | 'quit'(q) : "
    choice = gets.chomp.downcase
    if choice == "buyer" || choice == "b"
      show_buyer_options
    elsif choice == "seller" || choice == "s"
      show_seller_options
    elsif choice == "quit" || choice == "q"
      return
    else
      puts "Invalid input, try again?"
      return init
    end
  end

end


MobiStore.init
