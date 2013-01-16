require 'sensr'
require 'googlecharts'
require './client_config.rb'

Sensr.oauth_token = OAUTH_TOKEN
RestClient.log    = $stderr

c = Sensr::Camera.all