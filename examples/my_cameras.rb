require 'rubygems'
require 'sensr'
require 'googlecharts'

Sensr.oauth_token = REPLACE_WITH_YOUR_OAUTH_TOKEN
RestClient.log    = $stderr

c = Sensr::Camera.owned