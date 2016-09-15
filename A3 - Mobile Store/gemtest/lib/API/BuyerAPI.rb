#Dir[ Dir.pwd + "/*.rb"].each {|file| require file }

require_relative 'UserModule.rb'


class BuyerAPI

  extend UserModule

  @@name = "raj"
  @@money = 5000
  @@cc_details = "icic"

  def self.buy

    puts "Enter the ID of product you want to buy: "
    product_id = gets.chomp.to_i
    product = ProductAPI.search_id(product_id)

    if @@money > product[:price].to_i #safety net for update bug: to_i
      if product[:quantity].to_i < 1
        puts "Product out of stock!"
        return
      end
      ProductAPI.update(product[:id], :quantity, (product[:quantity].to_i) - 1)
      @@money -= product[:price]
      transcation = {
        product_name: product[:name],
        buyer_name: @@name,
        timestamp: Time.now.to_s,
        amount_paid: product[:price]
      }
      TranscationAPI.record(transcation)
    else
      puts "Insufficient funds to make purchase!"
    end
    system 'clear'
  end

  def self.show_options
    loop do
      print "\n\t\t\t--- --- ----\n\n\nEnter your option: 'list' | 'search' | 'buy' | 'quit' : "
      choice = gets.chomp.downcase

      if choice == "list"
        list_products
      elsif choice == "search"
        search_products
      elsif choice == "buy"
        buy
      elsif choice == "quit"
        break
      else
        "Woops, invalid input. Can you enter again?"
      end
    end
  end

  def self.set_name(n)
    @@name = n
  end

  def self.set_money(m)
    @@money = m
  end

  def self.set_cc_details(cc)
    @@cc_details = cc
  end

end
