require "./deck"

class Dealer
  def initialize
    @deck = Deck.new
  end

  def shuffle
    @deck.decks.shuffle!
  end

  def deal(num)
    deal_kards = @deck.decks.first(num)
    @deck.decks.slice!(0..num-1)
    deal_kards
  end

  def show(num)
    puts @deck.decks.first(num)
  end
end