require 'lib/alvalaxia'

Gem::Specification.new do |s|
  s.name = 'alvalaxia'
  s.version = Alvalaxia::VERSION
  s.summary = "Fetches all Sporting Clube de Portugal football games and warns you about those that are played at home."
  s.date = '2011-08-23'
  s.authors = 'Rogério Vicente'
  s.email = 'rogeriopvl@gmail.com'
  s.homepage = ''
  s.has_rdoc = false
  s.add_dependency('gcal4ruby', '0.5.5')
  s.add_dependency('cmdparse', '2.0.3')
  s.add_dependency('nokogiri', '1.5.0')
  s.files = %w[
    LICENSE
    README.md
    bin/alvalaxia
    lib/alvalaxia.rb
    lib/alvalaxia/runner.rb
    lib/alvalaxia/scrapper.rb
    lib/alvalaxia/calendar.rb
    lib/alvalaxia/game.rb
  ]
  s.default_executable = 'alvalaxia'
  s.executables        = [ 'alvalaxia' ]
  s.post_install_message = %q{------------------------------------------------------------------------------
  Usage:
      alvalaxia run
  
  There are more options available. You can find more info by typing:
  
      alvalaxia help
  
  You can send feedback to < rogeriopvl@gmail.com >. Have fun!
------------------------------------------------------------------------------
  }
end
