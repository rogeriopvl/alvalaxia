require "rubygems"
require "hpricot"
require "open-uri"

# fetches all home uefa games
def get_uefa_games

	# need to change this URL when the group fase is over
	uefa_group_url="http://desporto.sapo.pt/futebol/liga_europa/resultados/479"
	
	uefa_content = open(uefa_group_url).read
	doc = Hpricot(uefa_content)

	res = doc.search("tr")
	res.each do |e|
		td = e.search("td")
		next if td.length < 1
		sp = td[2].at("span.clube1 a").inner_html
		puts "Sporting joga em casa: #{td[0].inner_html} - #{td[1].inner_html}" if sp.index("Sporting")
	end
end

# fetches all games home games from liga sagres
def get_liga_games
	
	# apparently this wont need to be changed
	liga_url = "http://desporto.sapo.pt/futebol/primeira_liga/calendario/";
	
	liga_content = open(liga_url).read
	doc = Hpricot(liga_content)

	res = doc.search("table")
	res.each do |t|
		t.search("tr").each do |tr|
			td = tr.search("td")
			next if td.length < 1
			sp = td[2].at("span.clube1 a").inner_html
			puts "Sporting joga em casa: #{td[0].inner_html} - #{td[1].inner_html}" if sp.index("Sporting")
		end
	end
end

get_uefa_games

