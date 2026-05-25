require 'sinatra'
require 'json'
require 'dotenv/load'
require 'jwt'
require 'bcrypt'



require_relative './config/cors.rb'
require_relative './config/database.rb'


SECRET_KEY = "ENV['SECRET_KEY']"

# Basic route to test if the server is running
get '/' do
    'Hello World'
end

# Test route to verify backend is working
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
# Add more routes and logic here for your portfolio site backend


# Temporary login route for testing JWT authentication
post "/api/auth/login" do
  content_type :json

  body = JSON.parse(request.body.read)

  email = body["email"]
  password = body["password"]

  # TEMP fake user
  user = {
    id: 1,
    email: "admin@test.com",
    password_digest: BCrypt::Password.create("password123"),
    role: "admin"
  }

  if email != user[:email]
    halt 401, { error: "Invalid credentials" }.to_json
  end

  if !BCrypt::Password.new(user[:password_digest]) == password
    halt 401, { error: "Invalid credentials" }.to_json
  end

  token = JWT.encode(
    {
      user_id: user[:id],
      role: user[:role]
    },
    SECRET_KEY,
    "HS256"
  )

  {
    token: token
  }.to_json
end