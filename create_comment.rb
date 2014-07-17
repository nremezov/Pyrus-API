require 'faraday'

conn = Faraday.new(url: 'https://pyrus.com') do |conn|
  conn.request  :url_encoded           
  conn.response :logger             
  conn.adapter  Faraday.default_adapter
end

