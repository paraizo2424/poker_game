class Card
  SUITS = [:spade, :heart, :diamond, :clover]

  MARK = {
    spade: "♠",
    heart: "♡",
    diamond: "♢",
    clover: "♣",
    1 => "A",
    11 => "J",
    12 => "Q",
    13 => "K"
  }

  def initialize(suit, num)
    @num = num
    @suit = suit
  end

  def show
    corresponding_mark(@suit) + corresponding_mark(@num)
  end

  def corresponding_mark(sym)
    if MARK[sym]
      return MARK[sym]
    else
      return sym.to_s
    end
  end
end
