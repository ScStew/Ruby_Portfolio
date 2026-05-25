require "active_record"
require "dotenv/load"

ActiveRecord::Base.establish_connection(
  adapter:  "postgresql",
  encoding: "unicode",
  url: ENV["DATABASE_URL"]
)