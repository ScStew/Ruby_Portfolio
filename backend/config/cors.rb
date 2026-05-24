before do
  response.headers["Access-Control-Allow-Origin"] = "http://localhost:3000"
  response.headers["Access-Control-Allow-Methods"] = "GET,POST,PUT,DELETE,OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Content-Type, Authorization"
end

options "*" do
  200
end