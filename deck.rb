class Deck
  SUITS = ["♠︎", "♣︎", "❤︎", "♦︎"]
  
  attr_accessor :decks
  
  def initialize
    @decks = []
    
    SUITS.each do |suit|
      (1..13).each do |num|
        @decks << {suit: suit, num: num}
      end
    end
  end
end