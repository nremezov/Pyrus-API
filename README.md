Pyrus
=====


A Ruby wrapper for the [Pyrus API](https://pyrus.com/api).


Installation
------------

    $ gem install faraday


Obtaining Access Token
-------------------------------

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

    puts response.body

Get Task
-------------------------------

    require 'faraday'

    conn = Faraday.new(url: 'https://pyrus.com') do |conn|
      conn.request  :url_encoded           
      conn.response :logger             
      conn.adapter  Faraday.default_adapter
    end

    get_task = conn.get do |req|                           
      req.url '/restapi/task/{task ID}' # Example => '/restapi/task/1235'
      req.headers['Authorization'] = 'Bearer {Access Token}' # Example => req.headers['Authorization'] = 'Bearer fb2e77d.47a0479'
    end

    puts get_task.body

 Get Task List
-------------------------------
    
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

    puts get_task_list.body

Create Task
-------------------------------

    require 'faraday'

    conn = Faraday.new(url: 'https://pyrus.com') do |conn|
      conn.request  :url_encoded           
      conn.response :logger             
      conn.adapter  Faraday.default_adapter
    end

    create_task = conn.put do |req|
      req.url '/restapi/addtask'
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = 'Bearer {Access Token}' # Example => req.headers['Authorization'] = 'Bearer fb2e77d.0479'
      req.body = '{"Text": "Hello world",
        "ResponsibleId": 81461,
        "DueDate": "/Date(1405382400000)/"}'
    end 

    puts create_task.body

Create Comment
-------------------------------

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

Get Profile
-------------------------------

    require 'faraday'

    conn = Faraday.new(url: 'https://pyrus.com') do |conn|
      conn.request  :url_encoded           
      conn.response :logger             
      conn.adapter  Faraday.default_adapter
    end

    get_profile = conn.get do |req|
      req.url '/restapi/profile'
      req.headers['Authorization'] = 'Bearer {Access Token}' # Example => req.headers['Authorization'] = 'Bearer fb2e77d.47a0479'
    end 

    puts get_profile.body

Saving Data to a File
-------------------------------

    file_name = "data.txt"
    file = File.open(file_name, "w")
    file.puts get_profile.body
    file.close

Troubleshooting
---------------

The Pyrus documentation contains a list of functions (https://pyrus.com/api)

Please report all bugs/issues via the GitHub issue tracker.
