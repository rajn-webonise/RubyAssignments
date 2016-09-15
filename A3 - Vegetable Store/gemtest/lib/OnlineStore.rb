class OnlineStore
  def initialize(shopkeeper, product_list)
  #  @shopkeeper = shopkeeper.deep_copy
  #  @product_list = product_list
  end

  def show_products
    @product_list.each do
      puts "Name: #{@product_list.name} | Price: #{@product_list.price} | Quantity: #{@product_list.quantity}"
    end
  end

  def display_options_loop
    loop do
      print "\n\t\t\t--- --- ----\n\n\nEnter your option: 'list' | 'search' | "
      yield
      print " | 'quit' : "
      choice = gets.chomp.downcase

      if choice == "list"
        show_products
      elsif choice == "search"
        show_products
      elsif choice == "buy"
        inventory.class
      elsif choice == "quit"
        break
      else
        "Woops, can you enter again?"
      end
    end
  end


  def ask_type_of_user
    puts "Which type of user are you? 'buyer' | 'seller'"
    choice = gets.chomp.downcase
    if choice == "buyer"
      extra_options = Proc.new{ print "'buy'" }
    elsif choice == "seller"
      extra_options = Proc.new{print "'add' | 'edit' | 'delete'"}
    else
      puts "Invalid input, try again?"
      ask_type_of_user
    end
    display_options_loop(&extra_options)
  end

end
