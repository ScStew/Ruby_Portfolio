require 'sinatra'
require 'json'

require_relative './config/cors.rb'

get '/' do
    'Hello World'
end