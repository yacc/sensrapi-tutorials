require 'rubygems'
require 'sensr'

Sensr.oauth_token = "02e79d6b069589aeff34dd03bb050c20e01901eb4a59a4a4c6bcbd271a949067"
RestClient.log    = $stderr

mycams = Sensr::Camera.owned
mycams.each {|c| puts  "camera: " + c.attributes["id"].to_s + ' ' + c.attributes["name"] + ' ' + c.attributes["accessibility"] }