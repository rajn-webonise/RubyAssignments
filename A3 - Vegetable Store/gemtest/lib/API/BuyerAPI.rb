class BuyerAPI

  attr_accessor :id, :name, :money, :cc_details

  def self.buy
    ProductAPI.get_list
    puts "Enter the ID of product you want to buy: "
    product_id = gets.chomp.to_i
    product = ProductAPI.search({id: product_id})

    if BuyerAPI.money > ProductAPI.price(product)
      if ProductAPI.quantity(product) < 1
        puts "Product out of stock!"
        return
      end
      ProductAPI.buy(product)
      BuyerAPI.money = BuyerAPI.money - ProductAPI.price(product)
      TranscationAPI.record(ProductAPI.name(product), BuyerAPI.name, Time.now.to_s, ProductAPI.price)
    else
      puts "Insufficient funds to make purchase!"
    end
  end

  def

end
