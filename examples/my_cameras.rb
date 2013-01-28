require 'rubygems'
require 'sensr'

Sensr.oauth_token = "REPLACE_WITH_YOUR_OAUTH_TOKEN"
RestClient.log    = $stderr

mycams = Sensr::Camera.owned
mycams.each {|c| puts  "camera: " + c.attributes["id"].to_s + ' ' + c.attributes["name"] + ' ' + c.attributes["accessibility"] }