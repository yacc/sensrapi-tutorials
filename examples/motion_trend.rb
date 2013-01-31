require 'rubygems'
require 'sensr'
require 'googlecharts'

Sensr.oauth_token = REPLACE_WITH_YOUR_OAUTH_TOKEN
target_camera     = ARGV[0].to_i
RestClient.log    = $stderr

camera = Sensr::Camera.find(target_camera)

motion_data   = []
legend        = ["week1","week2","week3","week4","week5"] 

def week_motion_trend(week,camera)
  day_data = []
  camera.week(week)["week"]["days"].each do |day|
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
  day_data
end


def is_mac_os?
 (/darwin/ =~ RUBY_PLATFORM) != nil
end

5.times.each do |nb|
  nb_week_ago = (Time.now - 60*60*24*7*(nb+1) ).to_i
  motion_data << week_motion_trend(nb_week_ago,camera)
end

motion_trend_chart = "./motion_trend_#{target_camera}.png"
chart = Gchart.new( :type => 'line',
                    :size => '720x300', 
                    :title => "Camera \"#{camera.name}\" (#{target_camera}) Motion Trend",
                    :theme => :thirty7signals,
                    :data => motion_data,
                    :line_colors => 'FF0000,ccff00,00FF00,0000FF,00000F',
                    :legend => legend,
                    :axis_with_labels => ['x','y'],
                    :axis_labels => ['Mon|Tue|Wed|Thu|Fri|Sat|Sun'],
                    :filename => motion_trend_chart)
chart.file

`open #{motion_trend_chart}` if is_mac_os? 





