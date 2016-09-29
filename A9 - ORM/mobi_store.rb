require 'byebug'


class MobiStore

  def self.routes(req)
    resp = Hash.new
    resp[:code] = 200
    resp[:header]={ "Content-Type" => "text/json" }
    resp[:data] = ["default data"]

    return resp
    case req.path_info
    when /hello/
      [200, {"Content-Type" => "text/json"}, ["Hello World!"]]
    when /goodbye/
      [500, {"Content-Type" => "text/json"}, ["Goodbye Cruel World!"]]
    else
      [404, resp[:header]={ "Content-Type" => "text/json" }, resp[:data] = ["404: Nothing to see here! "]]
    end
  end
end
