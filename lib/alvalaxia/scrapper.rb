require 'rubygems'
require 'nokogiri'
require 'open-uri'

module Alvalaxia
  
  # Exception to raise when an error occurs scrapping the site
  class UnableToParseDataError < Exception; end

  class Scrapper

    # page that lists the next SCP games
    USER_AGENT = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_1) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.215 Safari/535.1'
    NEXT_GAMES_URL = 'http://www.zerozero.pt/equipa.php?grp=0&ond=c&compet_id_jogos=0&epoca_id=141&id=16&menu=nextmatches&type=season'

    def initialize
      @games = Array.new
    end

    def fetch
      doc = Nokogiri::HTML(open(NEXT_GAMES_URL, 'User-Agent' => USER_AGENT))
      doc.css('table.statsn tr').each do |item|
        tds = Array.new
        item.css('td').each do |td|
          tds << td.text
        end
        unless tds.empty?
          # index 0 contains date, 5 the opponent and 6 the competition
          game = Alvalaxia::Game.new(tds[0], tds[5], tds[6])
          @games << game
        end
      end
      
      if @games.empty?
        raise UnableToParseDataError
      end

      return @games
    end

  end 

end
