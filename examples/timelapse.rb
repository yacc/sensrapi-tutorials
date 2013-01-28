require 'rubygems'
require 'sensr'
require 'pp'

Sensr.oauth_token = "02e79d6b069589aeff34dd03bb050c20e01901eb4a59a4a4c6bcbd271a949067"
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
