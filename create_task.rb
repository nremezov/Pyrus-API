require 'faraday'

conn = Faraday.new(url: 'https://pyrus.com') do |conn|
  conn.request  :url_encoded           
  conn.response :logger             
  conn.adapter  Faraday.default_adapter
end

create_task = conn.put do |req|
	req.url '/restapi/addtask'
	req.headers['Content-Type'] = 'application/json'
	req.headers['Authorization'] = 'Bearer {Access Token}' # Example => req.headers['Authorization'] = 'Bearer fb2e77d.47a0479'
	req.body = '{"Text": "Hello world",
    "ResponsibleId": 81461, # => This is your Profile ID
    "AddedProjectIds": [1,3],
    "DueDate": "/Date(1405382400000)/"}'
end 

puts create_task.body