class Player
  def initialize(dealer)
    @hands = dealer.deal(5)
  end

  def show
    puts "--------"
    @hands.each_with_index do |hand, i|
      print "#{i} => "
      if hand
        puts "#{hand[:suit]}#{hand[:num]}"
      else
        pp hand
      end
    end
    puts "--------"
  end

  def discard(discard_cards)
    discard_cards = discard_cards.split(" ").map{|i| i.to_i}

    if discard_cards.include?(-1)
      return
    else
      discard_cards.each do |num|
        @hands[num] = nil
      end
      return
    end
  end
end
