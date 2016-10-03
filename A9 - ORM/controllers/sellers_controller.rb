
require File.dirname(__FILE__).chomp("controllers") +  "models/seller"



class SellersController #< BaseController

  def index
    Seller.all.to_json
  end

  def create(params)
    return Seller.create(params).to_json
  end

  def find(id)
    return Seller.find(id).to_json
  end

  def update(id, params)
    return Seller.find(id).update_attributes(params).to_json
  end

  def destroy(id)
    return Seller.destroy(id).to_json
  end

  def add_product(id, params)
    category_id = params.delete("category_id").to_i

    new_product = Product.create(params)
    Category.find(category_id).products << new_product
    Seller.find(id).products << new_product
    return new_product.to_json
  end

end
