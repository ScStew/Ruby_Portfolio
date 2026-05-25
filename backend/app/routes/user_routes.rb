require "json"
require "bcrypt"


get "/api/users" do
  content_type :json
  puts ENV["DATABASE_URL"]
  puts ActiveRecord::Base.connection.active?

  User.all.to_json
end

post "/api/users" do
  content_type :json

  body = JSON.parse(request.body.read)

  user = User.create(
    email: body["email"],
    password_digest: BCrypt::Password.create(body["password"]),
    role: body["role"]
  )

  status 201

  user.to_json
end