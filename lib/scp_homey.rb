module SCPHomey
  VERSION = '0.1'

  puts File.dirname(__FILE__)+'/scp_homey/game'
  autoload :Runner, File.dirname(__FILE__)+'/scp_homey/runner'
  autoload :Scrapper, File.dirname(__FILE__)+'/scp_homey/scrapper'
  autoload :Game, File.dirname(__FILE__)+'/scp_homey/game'
end
