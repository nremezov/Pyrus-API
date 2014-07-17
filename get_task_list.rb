require 'faraday'

conn = Faraday.new(url: 'https://pyrus.com') do |conn|
  conn.request  :url_encoded           
  conn.response :logger             
  conn.adapter  Faraday.default_adapter
end

get_task_list = conn.get do |req|                           
  req.url '/restapi/inbox/1'
  req.headers['Authorization'] = 'Bearer {Access Token}' # Example => req.headers['Authorization'] = 'Bearer fb2e77d.47a0479'
end
