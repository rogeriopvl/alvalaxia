require 'lib/scp_homey'

Gem::Specification.new do |s|
  s.name = 'scp_homey'
  s.version = SCPHomey::VERSION
  s.summary = "Fetches all Sporting Clube de Portugal football games and warns you about those that are played at home."
  s.date = '2011-08-23'
  s.authors = 'Rogério Vicente'
  s.email = 'rogeriopvl@gmail.com'
  s.homepage = ''
  s.has_rdoc = false
  s.files = %w[
    LICENSE
    README.md
    bin/scp_homey
    lib/scp_homey.rb
    lib/scp_homey/runner.rb
    lib/scp_homey/scrapper.rb
    lib/scp_homey/calendar.rb
    lib/scp_homey/game.rb
  ]
  s.default_executable = 'scp_homey'
  s.executables        = [ 'scp_homey' ]
  s.post_install_message = %q{------------------------------------------------------------------------------
  Usage:
      scp_homey run
  
  There are more options available. You can find more info by typing:
  
      scp_homey help
  
  You can send feedback to < rogeriopvl@gmail.com >. Have fun!
------------------------------------------------------------------------------
  }
end
