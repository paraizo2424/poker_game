require_relative 'judge_hand'

class Player
  include JudgeHand

  attr_accessor :id
  attr_accessor :poker_hand

  def initialize(dealer, i)
    @dealer = dealer
    @hands = dealer.deal(5)
    @poker_hand = self.judge(@hands)
    @id = i
  end

  def show
    puts "--------"
    @hands.each_with_index do |card, i|
      print "#{i} => "
      if card
        puts "#{card.show}"
      else
        pp card
      end
    end

    puts "現在の役は#{@poker_hand}です。"
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
    @poker_hand = self.judge(@hands)
  end
end
