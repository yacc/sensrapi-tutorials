Tutorials for sensrapi
==================

Quick start
------------------

1. Get the sensr gem `wget https://github.com/yacc/sensrapi-tutorials/sensrapi.gem`
2. Get your api key
  * login to your sensr.net account and navigate to https://sensr.net/account/applications
  * create a new api client, you will be asked to enter the following:

    Display Name: "my api client name"
    Link: "https://testclient.com"
    Redirect Url: "https://testclient.com/welcome"
    
3. Open your irb console and write some code

```ruby

    require 'sensr'
    Sensr.oauth_token = 'asaha7yqwokq08ru1hfkajfy7gerh'
    
    cam_id = ARGV[0].to_i
    c = Sensr::Camera.find(cam_id)
```
    

