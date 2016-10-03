require 'byebug'
require 'active_support/inflector'
require_relative "config/config"


class MobiStore
  
  def self.load_controller
    require "#{$APP_ROOT}controllers/#{@req.path_info.split('/')[1]}_controller"
    controller_class = @req.path_info.split('/')[1].capitalize + "Controller"
    Object.const_get(controller_class).new
  end

  def self.routes(req)
    @req = req
    @resp = Hash.new
    @resp[:code] = 200
    @resp[:header]={ "Content-Type" => "text/json" }
    @resp[:data] = ["default data"]
    
    case @req.request_method.upcase
    when "POST"
      @resp[:data] = load_controller.create #"/catgories" 
    when "GET"
      if req.path_info.split('/')[2]==nil
        @resp[:data] << load_controller.index #"/categories"
      else
        load_controller.find #"/categories/id" 
      end
    when "DELETE"
      load_controller.destroy #"/categories/id" 
      when "PATCH"
        load_controller.update #"/categories/id" 
    else
      resp[:data] = ["Reqested via unkown VERB"]
    end
      
    return @resp
  end

end

=begin
    case req.path_info
    
    when /POST/# "/products/:id"
      
      resp[:code] = 200
      resp[:header]={ "Content-Type" => "text/json" }
      resp[:data] = ["hello"]
    return resp
      #return [200, {"Content-Type" => "text/json"}, ["Hello World!"]]
    when /goodbye/
      return [500, {"Content-Type" => "text/json"}, ["Goodbye Cruel World!"]]
    else
      resp[:code] = 404
    resp[:header]={ "Content-Type" => "text/json" }
    resp[:data] = ["You hit 404."]
    return resp
    end
=end  