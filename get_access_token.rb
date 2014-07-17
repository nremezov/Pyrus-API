require 'faraday'

conn = Faraday.new(url: 'https://pyrus.com') do |conn|
  conn.request  :url_encoded           
  conn.response :logger             
  conn.adapter  Faraday.default_adapter
end

response = conn.post do |req|
  req.url '/restapi/accesstoken'
  req.headers['Content-Type'] = 'application/json'
  req.body = '{
   "ClientId" : "demokey",
   "Login": "email login",
   "Password": "password_here"}'
end
