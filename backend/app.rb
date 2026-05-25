require 'sinatra'
require 'json'
require 'dotenv/load'


require_relative './config/cors.rb'
require_relative './config/database.rb'




get '/' do
    'Hello World'
end


get "/api/test" do
  content_type :json

  {
    message: "Sinatra backend connected successfully!"
  }.to_json
end

get "/db-test" do
  ActiveRecord::Base.connection.active?

  {
    connected: true
  }.to_json
end