require 'byebug'


class Routes
  def go_to(env)
    req = Rack::Request.new(env)
    byebug
    case req.path_info
    when /controller/
      call_action("method: Programming: ")
    when /hello/
      [200, {"Content-Type" => "text/json"}, ["Hello World!"]]
    when /goodbye/
      [500, {"Content-Type" => "text/json"}, ["Goodbye Cruel World!"]]
    else
      [404, {"Content-Type" => "text/json"}, ["I'm Lost!"]]
    end
  end
end
