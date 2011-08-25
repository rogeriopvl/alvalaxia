require '../lib/scp_homey.rb'
require 'rubygems'
require 'gcal4ruby'

scp = SCPHomey::Scrapper.new
games = scp.run
cal = SCPHomey::Calendar.new
cal.delete_all_events

games.each do |game|
  unless ['Sunday', 'Saturday'].include?(game.date.strftime("%A"))
    puts game.date
    cal.create_event(game.date)
  end
end


