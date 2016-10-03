
require File.dirname(__FILE__).chomp("controllers") +  "models/category"



class ProductsController #< BaseController

  def index
    Product.all.to_json
  end

  def create(params)
    return Product.create(params).to_json
  end

  def find(id)
    return Product.find(id).to_json
  end

  def update(id, params)
    return Product.find(id).update_attributes(params).to_json
  end

  def destroy(id)
    return Product.destroy(id).to_json
  end

end
