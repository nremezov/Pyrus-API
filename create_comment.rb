require 'faraday'

conn = Faraday.new(url: 'https://pyrus.com') do |conn|
  conn.request  :url_encoded           
  conn.response :logger             
  conn.adapter  Faraday.default_adapter
end

create_comment = conn.put do |req|
	req.url '/restapi/addcomment'
	req.headers['Content-Type'] = 'application/json'
	req.headers['Authorization'] = 'Bearer {Access Token}' # Example => req.headers['Authorization'] = 'Bearer fb2e77d.47a0479'
	req.body = '{
    "Text": "Hello World",
    "TaskId": 4038676, # => Task ID is needed 
    "ActivityAction": "MarkAsIrrelevant"
}'
end 

puts create_comment.body