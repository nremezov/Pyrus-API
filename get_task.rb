require 'faraday'
 
conn = Faraday.new(url: 'https://pyrus.com') do |conn|
  conn.request  :url_encoded           
  conn.response :logger             
  conn.adapter  Faraday.default_adapter
end

get_task = conn.get do |req|                           
  req.url '/restapi/task/{task ID}' # Example => '/restapi/task/1235'
  req.headers['Authorization'] = 'Bearer {Access Token}' # Example => req.headers['Authorization'] = 'Bearer fb2e77d.47a04799005062'
end

puts get_task.body