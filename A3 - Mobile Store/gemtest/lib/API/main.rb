require  Dir.pwd + '/ProductAPI.rb'
require  Dir.pwd + '/TranscationAPI.rb'
require  Dir.pwd + '/BuyerAPI.rb'
require  Dir.pwd + '/SellerAPI.rb'

#Dir[ Dir.pwd + "/*.rb"].each {|file| require file }


def init
  ProductAPI.seed
  puts ProductAPI.get_list
  TranscationAPI.seed
  puts TranscationAPI.get_list

  puts "Which type of user are you? 'Buyer' | 'Seller'"
  choice = gets.chomp.downcase
  if choice == "buyer"
    BuyerAPI.show_options()
  elsif choice == "seller"
    SellerAPI.show_options()
  else
    puts "Invalid input, try again?"
    return init
  end
end

init()
