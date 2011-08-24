require 'rubygems'
require 'nokogiri'
require 'open-uri'

module SCPHomey
  
  class Scrapper

    # PT_LEAGUE_URL = 'http://desporto.sapo.pt/futebol/primeira_liga/calendario/156'
    PT_LEAGUE_URL = 'http://www.sporting.pt/Futebol/Fut_Prof/Liga/futsen_liga_calendario.asp' #get all classes Calendario_Item3
    # EUROPE_LEAGUE_URL = 'http://www.sporting.pt/Futebol/Fut_Prof/Liga_Europa/futsen_ligaeuropa_calendario.asp' #same class
    EUROPE_LEAGUE_URL = ''

    def initialize
      puts "TODO"
    end

    def run
      doc = Nokogiri::HTML(open(PT_LEAGUE_URL))
      doc.css('tr.Calendario_Item3').each do |item|
        puts item.text
      end
    end

  end 

end
