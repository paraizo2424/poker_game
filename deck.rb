require_relative "card"

class Deck
  attr_accessor :decks

  def initialize
    @decks = []

    Card::SUITS.each do |suit|
      (1..13).each do |num|
        @decks << Card.new(suit, num)
      end
    end
  end
end
