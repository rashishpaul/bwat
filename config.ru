require "sinatra/base"
# require "sinatra/reloader"
require_relative "server"
require "pry"
run Sinatra::Server
