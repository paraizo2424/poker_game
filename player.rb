require_relative 'judge_hand'

class Player
  include JudgeHand

  def initialize(dealer, i)
    @dealer = dealer
    @hands = dealer.deal(5)
    @Player_id = i
  end

  def show
    puts "--------"
    puts "#{@Player_id} さんのターンです。"
    @hands.each_with_index do |card, i|
      print "#{i} => "
      if card
        puts "#{card.show}"
      else
        pp card
      end
    end

    puts "現在の役は#{self.judge(@hands)}です。"
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
    end

    @hands = @dealer.change(@hands)
  end
end
