require "active_record"

# MUST happen once, globally
ActiveRecord::Base.establish_connection(
  adapter: "postgresql",
  url: ENV["DATABASE_URL"]
)
