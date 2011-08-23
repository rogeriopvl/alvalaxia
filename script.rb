require "rubygems"
require "hpricot"
require "open-uri"

# fetches all home uefa games
def get_uefa_games

	# need to change this URL when the group fase is over
	uefa_group_url="http://desporto.sapo.pt/futebol/liga_europa/resultados/479"
	
	events = []

	uefa_content = open(uefa_group_url).read
	doc = Hpricot(uefa_content)

	res = doc.search("tr")
	res.each do |e|
		td = e.search("td")
		next if td.length < 1
		next if td[2].nil?
		span = td[2].at("span.clube1 a")
		next if span.nil?
		events << "#{td[0].inner_html}" if span.inner_html.index("Sporting")
	end
	events
end

# fetches all games home games from liga sagres
def get_liga_games
	
	# apparently this wont need to be changed
	liga_url = "http://desporto.sapo.pt/futebol/primeira_liga/calendario/";
	
	events = []

	liga_content = open(liga_url).read
	doc = Hpricot(liga_content)

	res = doc.search("table")
	res.each do |t|
		t.search("tr").each do |tr|
			td = tr.search("td")
			next if td.length < 1
			next if td[2].nil?
			span = td[2].at("span.clube1 a")
			next if span.nil?
			events << "#{td[0].inner_html}" if span.inner_html.index("Sporting") && td[0].inner_html.length > 1
		end
	end
	events
end

evs = get_uefa_games << get_liga_games

evs.each do |ev|
	#puts Date.strptime(ev, "%d %m")
	puts ev
end

