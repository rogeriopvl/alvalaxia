require 'time'

module Alvalaxia

  # Contains needed info of a game
  class Game

    attr_accessor :date, :opponent, :competition

    def initialize(date, opponent, competition)
      @date = Time.parse(date.gsub('/', '-'))
      @opponent = opponent
      @competition = competition
    end

  end

end
