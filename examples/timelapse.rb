require 'sensr'
require 'pp'
require './client_config.rb'

Sensr.oauth_token = OAUTH_TOKEN
target_camera     = MYCAMERA
RestClient.log    = $stderr

c = Sensr::Camera.find(MYCAMERA)

c.week(Time.now.to_i - (86400 * 5))["week"]["days"].each do |day|
  day["day"]["hours"].each do |hour|
    time = hour["hour"]["epoch_time"]
    c.hour(time)["hour"]["images"].each do |image|
      puts image["url"].to_s + " " + "0.1" + " UTC"
      $stdout.flush
    end
  end
end
