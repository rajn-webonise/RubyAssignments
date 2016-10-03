require 'rack'
require 'rack/server'
#require 'thin'
require 'webrick'

require_relative 'mobi_store'


class App
  def call(env)
    req = Rack::Request.new(env)
    resp = MobiStore.routes(req)

    [resp[:code], resp[:header], resp[:data]]
  end
end
#byebug
#run App.new
Rack::Handler::WEBrick.run App.new#, {:Host => "0.0.0.0"}
