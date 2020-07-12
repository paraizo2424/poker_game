require "./deck"

class Dealer
  def initialize
    @deck = Deck.new.decks
  end

  def shuffle
    @deck.shuffle!
  end

  def deal(num)
    deal_kards = @deck.first(num)
    @deck.slice!(0..num-1)
    deal_kards
  end

  def show(num)
    puts @deck.first(num)
  end

  def change(hands)
    hands.length.times do |num|
      if hands[num].nil?
        hands[num] = @deck.shift
      end
    end
    hands
  end
end