module Alvalaxia
  VERSION = '0.1'

  autoload :Runner, File.dirname(__FILE__)+'/alvalaxia/runner'
  autoload :Scrapper, File.dirname(__FILE__)+'/alvalaxia/scrapper'
  autoload :Game, File.dirname(__FILE__)+'/alvalaxia/game'
  autoload :Calendar, File.dirname(__FILE__)+'/alvalaxia/calendar'
end
