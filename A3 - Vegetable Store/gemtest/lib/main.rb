def ask_type_of_user
  puts "Which type of user are you? 'buyer' | 'seller'"
  choice = gets.chomp.downcase
  if choice == "buyer"
    #extra_options = Proc.new{ print "'buy'" }
    BuyerAPI.show_options(&common_options)
  elsif choice == "seller"
    #extra_options = Proc.new{print "'add' | 'edit' | 'delete'"}
    SellerAPI.show_options(&common_options)
  else
    puts "Invalid input, try again?"
    ask_type_of_user
  end
  display_options_loop(&extra_options)
end

ask_type_of_user
