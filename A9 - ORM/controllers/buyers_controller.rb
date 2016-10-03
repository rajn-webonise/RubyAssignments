
require File.dirname(__FILE__).chomp("controllers") +  "models/buyer"


class BuyersController #< BaseController

  def index
    Buyer.all.to_json
  end

  def create(params)
    return Buyer.create(params).to_json
  end

  def find(id)
    return Buyer.find(id).to_json
  end

  def update(id, params)
    return Buyer.find(id).update_attributes(params).to_json
  end

  def destroy(id)
    return Buyer.destroy(id).to_json
  end

  def index_orders(id)
    return Buyer.find(id).orders.to_json
  end

  def find_order(id, order_id)
    return Buyer.find(id).orders.find(order_id).order_items.to_json
  end

  def add_product(user_id, params)
    if Buyer.find(user_id).orders.size.zero?
      Buyer.find(user_id).orders << Order.create(total_amount: 0, paid: false)
    end

    current_order = Buyer.find(user_id).orders.find_by_paid(false)
    current_product = Product.find(params["product_id"].to_i)
    current_order_item = OrderItem.create(
      item_name:  current_product.name,
      quantity:   params["quantity"].to_i,
      price:      params["quantity"].to_i * current_product.price,
      discount:   params["discount"].to_i
    )
    current_order.order_items << current_order_item
    current_order.update_attributes(
      total_amount: current_order.total_amount + current_order_item.price
    )

    return current_order.order_items.to_json
  end

  def buy(user_id)
    current_order = Buyer.find(user_id).orders.find_by_paid(false)
    current_order.update_attributes(paid: true)
    Buyer.find(user_id).orders << Order.create(total_amount: 0, paid: false)
    return "true"
  end

end
