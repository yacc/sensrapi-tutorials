require 'rubygems'
require 'sensr'
require 'googlecharts'

Sensr.oauth_token = REPLACE_WITH_YOUR_OAUTH_TOKEN
target_camera     = ARGV[0].to_i
RestClient.log    = $stderr

cam_id = MYCAMERA
c = Sensr::Camera.find(cam_id)
cam_name = c.name

data   = []
legend = ["week1","week2","week3","week4","week5"] 

five_weeks_ago = Time.now.to_i - 9*(86400 * 5)
day_data = []
c.week(five_weeks_ago)["week"]["days"].each do |day|
  day_label = day["day"]["date_label"]
  day_motions = 0
  day["day"]["hours"].each do |hour|
    nb_motion  = hour["hour"]["image_count"]
    day_motions += nb_motion
    $stdout.flush
  end
  puts "---> Day #{day_label} :: #{day_motions}"
  day_data << day_motions
end
data << day_data

four_weeks_ago = Time.now.to_i - 7*(86400 * 5)
day_data = []
c.week(four_weeks_ago)["week"]["days"].each do |day|
  day_label = day["day"]["date_label"]
  day_motions = 0
  day["day"]["hours"].each do |hour|
    nb_motion  = hour["hour"]["image_count"]
    day_motions += nb_motion
    $stdout.flush
  end
  puts "---> Day #{day_label} :: #{day_motions}"
  day_data << day_motions
end
data << day_data

three_weeks_ago = Time.now.to_i - 5*(86400 * 5)
day_data = []
c.week(three_weeks_ago)["week"]["days"].each do |day|
  day_label = day["day"]["date_label"]
  day_motions = 0
  day["day"]["hours"].each do |hour|
    nb_motion  = hour["hour"]["image_count"]
    day_motions += nb_motion
    $stdout.flush
  end
  puts "---> Day #{day_label} :: #{day_motions}"
  day_data << day_motions
end
data << day_data

two_weeks_ago = Time.now.to_i - 3*(86400 * 5)
day_data = []
c.week(two_weeks_ago)["week"]["days"].each do |day|
  day_label = day["day"]["date_label"]
  day_motions = 0
  day["day"]["hours"].each do |hour|
    nb_motion  = hour["hour"]["image_count"]
    day_motions += nb_motion
    $stdout.flush
  end
  puts "---> Day #{day_label} :: #{day_motions}"
  day_data << day_motions
end
data << day_data

a_week_ago = Time.now.to_i - (86400 * 5)
day_data = []
c.week(a_week_ago)["week"]["days"].each do |day|
  day_label = day["day"]["date_label"]
  day_motions = 0
  day["day"]["hours"].each do |hour|
    nb_motion  = hour["hour"]["image_count"]
    day_motions += nb_motion
    $stdout.flush
  end
  puts "---> Day #{day_label} :: #{day_motions}"
  day_data << day_motions
end
data << day_data

chart = Gchart.new( :type => 'line',
                    :size => '720x300', 
                    :title => "Camera \"#{cam_name}\" (#{cam_id}) Motion Trend",
                    :theme => :thirty7signals,
                    :data => data,
                    :line_colors => 'FF0000,ccff00,00FF00,0000FF,00000F',
                    :legend => legend,
                    :axis_with_labels => ['x','y'],
                    :axis_labels => ['Mon|Tue|Wed|Thu|Fri|Sat|Sun'],
                    :filename => "tmp/motion_trend_#{cam_id}.png")
chart.file







