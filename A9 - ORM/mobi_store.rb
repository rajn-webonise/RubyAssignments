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
    @resp[:data] = []

    case @req.request_method.upcase
    when "POST"

      case @req.path_info
      when /\/sellers\/[0-9]+\/products/          # POST    "/sellers/:id/products"
        id = (@req.path_info.split('/')[2]).to_i
        @resp[:data] << load_controller.add_product(id, req.params)
      when /\/buyers\/[0-9]+\/orders\/paid/               # POST "/buyers/1/paid"
        id = (@req.path_info.split('/')[2]).to_i
        @resp[:data] << load_controller.buy(id)
      when /\/buyers\/[0-9]+\/orders/             # POST    "/buyers/1/orders"
        id = (@req.path_info.split('/')[2]).to_i
        @resp[:data] << load_controller.add_product(id, req.params)
      else                                        # POST    "/catgories"
        @resp[:data] << load_controller.create(req.params)
      end
    when "GET"
      if @req.path_info.split('/')[2]==nil        # GET     "/categories"
        @resp[:data] << load_controller.index
      elsif (                                     # GET     "/users/id/carts/id"
              @req.path_info.split('/')[2] =~ /[0-9]+/ &&
              @req.path_info.split('/')[3] =~ /[a-z_]+/ &&
              @req.path_info.split('/')[4] =~ /[0-9]+/
            )
        id = (@req.path_info.split('/')[2]).to_i
        order_id = (@req.path_info.split('/')[4]).to_i
        @resp[:data] << load_controller.find_order(id, order_id)
      elsif (                                     # GET     "/users/id/carts"
              @req.path_info.split('/')[2] =~ /[0-9]+/ &&
              @req.path_info.split('/')[3] =~ /[a-z_]+/
            )
        id = (@req.path_info.split('/')[2]).to_i
        @resp[:data] << load_controller.index_orders(id)
      else                                        # GET     "/categories/id"
        id = (@req.path_info.split('/')[2]).to_i
        @resp[:data] << load_controller.find(id)
      end
    when "DELETE"                                # DELETE   "/categories/id"
      id = (@req.path_info.split('/')[2]).to_i
      load_controller.destroy(id)
    when "PATCH"                                # PATCH     "/categories/id"
      id = (@req.path_info.split('/')[2]).to_i
      @resp[:data] << load_controller.update(id, req.params)
    else
      @resp[:code] = 404
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
