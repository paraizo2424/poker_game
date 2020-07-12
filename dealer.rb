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

  def change(hands)
    hands.length.times do |num|
      if hands[num].nil?
        hands[num] = @deck.decks.shift
      end
    end
    hands
  end
end