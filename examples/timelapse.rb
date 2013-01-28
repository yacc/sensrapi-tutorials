require 'rubygems'
require 'sensr'
require 'pp'

Sensr.oauth_token = "REPLACE_WITH_YOUR_OAUTH_TOKEN"
target_camera     = ARGV[0].to_i
RestClient.log    = $stderr

c = Sensr::Camera.find(target_camera)

c.week(Time.now.to_i - (86400 * 5))["week"]["days"].each do |day|
  day["day"]["hours"].each do |hour|
    time = hour["hour"]["epoch_time"]
    c.hour(time)["hour"]["images"].each do |image|
      puts image["url"].to_s + " " + "0.1" + " UTC"
      $stdout.flush
    end
  end
end
