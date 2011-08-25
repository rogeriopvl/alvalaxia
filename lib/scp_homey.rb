module SCPHomey
  VERSION = '0.1'

  autoload :Runner, File.dirname(__FILE__)+'/scp_homey/runner'
  autoload :Scrapper, File.dirname(__FILE__)+'/scp_homey/scrapper'
  autoload :Game, File.dirname(__FILE__)+'/scp_homey/game'
  autoload :Calendar, File.dirname(__FILE__)+'/scp_homey/calendar'
end
