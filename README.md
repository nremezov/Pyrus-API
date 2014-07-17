Pyrus
=====


A Ruby wrapper for the [Pyrus API](https://pyrus.com/api).


Installation
------------

    $ gem install faraday


Authentication with Pyrus
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

Get Tasks
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


Troubleshooting
---------------

The Pyrus documentation contains a list of functions (https://pyrus.com/api)

Please report all bugs/issues via the GitHub issue tracker.
