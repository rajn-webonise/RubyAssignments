
require File.dirname(__FILE__).chomp("controllers") +  "models/category"



class CategoriesController #< BaseController

  def index
    Category.all.to_json
  end

  def create(params)
    return Category.create(params).to_json
  end

  def find(id)
    return Category.find(id).to_json
  end

  def update(id, params)
    return Category.find(id).update_attributes(params).to_json
  end

  def destroy(id)
    return Category.destroy(id).to_json
  end

end
