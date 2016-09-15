class Product

  attr_reader :name, :price, :quantity

  @@product_id_count=0
  def initialize(name, price, quantity=0)
    @id = @@product_id_count
    @@product_id_count++
    @name = name
    @price = price
    @quantity = quantity
  end

  def buy(buyer)
    return "This product is out of stock!" if @quantity < 1

    @quantity -=1
  end

end
