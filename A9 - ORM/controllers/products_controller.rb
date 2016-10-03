require_relative "../models/product"

class ProductsController < BaseController
  def index
    Product.all
  end
  
  def create
    
    Product.create()
    
  end
  
  
  def update
  end
  
  
  def destroy
  end
  

end
