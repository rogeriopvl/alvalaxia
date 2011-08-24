require 'rubygems'
require 'nokogiri'
require 'open-uri'

module SCPHomey
  
  class Scrapper

    # page that lists the next SCP games
    NEXT_GAMES_URL = 'http://www.zerozero.pt/equipa.php?grp=0&ond=c&compet_id_jogos=0&epoca_id=141&id=16&menu=nextmatches&type=season'

    def initialize
      @games = Array.new
    end

    def run
      tds = Array.new
      doc = Nokogiri::HTML(open(NEXT_GAMES_URL))
      doc.css('table.statsn tr').each do |item|
        item.css('td').each do |td|
          tds << td.text
        end
        if tds.length > 0
          game = SCPHomey::Game.new(tds[0], tds[5], tds[6])
          @games << game
        end
      end
      puts @games.inspect
    end

  end 

end
