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
Rack::Handler::WEBrick.run App.new, {:Host => "0.0.0.0"}

# app = App.new
# options={}
# environment  = ENV['RACK_ENV'] || 'development'
#   default_host = environment == 'development' ? '0.0.0.0' : nil

#   options[:BindAddress] = options.delete(:Host) || default_host
#   options[:Port] ||= 8080
#   @server = ::WEBrick::HTTPServer.new(options)
#   @server.mount "/", Rack::Handler::WEBrick, app
#   yield @server  if block_given?
#   @server.start