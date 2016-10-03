class BaseController
  
  attr_accessor :req
  
  def call_controller(req)
    @req = req
      
  end
  

end