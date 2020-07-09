class Player
  def initialize(dealer)
    @hands = dealer.deal(5)
  end

  def show
    puts @hands
  end
end
