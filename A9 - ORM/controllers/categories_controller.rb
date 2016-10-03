
require File.dirname(__FILE__).chomp("controllers") +  "models/category"



class CategoriesController #< BaseController
  
  def index
    Category.all.to_json
  end
  
  def create
    Category.create()
  end
  
  def find
    Category.find
  end
  
  def update
  end
  
  def destroy
  end

end
