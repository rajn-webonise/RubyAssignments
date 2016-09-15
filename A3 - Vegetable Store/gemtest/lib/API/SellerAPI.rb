class SellerAPI

  attr_accessor :id, :name, :money, :valid_hash

  def self.edit
    ProductAPI.get_list
    puts "Enter the ID of product you want to edit: "
    product_id = gets.chomp.to_i
    product = ProductAPI.search(product_id)

    puts "Change what? 'name' | 'quantity'"


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
