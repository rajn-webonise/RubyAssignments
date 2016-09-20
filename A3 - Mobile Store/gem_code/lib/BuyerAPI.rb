require_relative 'UserModule.rb'

class BuyerAPI

  extend UserModule

  $BUYER_OPTIONS = { list: "list", search: "search", buy: "buy"}

  @@name = "Raj Negi"
  @@money = 5000
  @@cc_details = "icic"


  def self.buy
    puts "\n\tEnter the details of product you want to buy ('q' to quit): "
    product_id = get_number("ID")
    product = ProductAPI.search_id(product_id)

    if !product
      puts "Product doesn't exist"
    elsif @@money < product[:price]
      puts "Insufficient funds to make purchase!"
    elsif product[:quantity].to_i < 1
      puts "Product out of stock!"
    else
      ProductAPI.update(product[:id], :quantity, product[:quantity] - 1)
      @@money -= product[:price]
      transcation = {
        product_name: product[:name],
        buyer_name: @@name,
        buyer_cc_details: @@cc_details,
        timestamp: Time.now.to_s,
        amount_paid: product[:price]
      }
      TranscationAPI.record(transcation)
      puts "\n\tPurchase successful, current amount left: #{@@money}"
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
