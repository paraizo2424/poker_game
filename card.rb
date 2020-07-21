class Card
  SUITS = [:♠︎, :♣︎, :♡, :♢]

  def initialize(suit, num)
    @num = num
    @suit = suit
  end

  def show
    @suit.to_s + @num.to_s
  end
end
