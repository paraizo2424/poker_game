class Player
  def initialize(dealer)
    @dealer = dealer
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

    puts "現在の役は#{self.judge}です。"
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

  def judge
    same_suit_flug = all_same_suit?
    count_up_flug = count_up?

    # if same_suit_flug
    #   return "ロイヤルストレートフラッシュ"
    # end

    # if same_suit_flug && count_up_flug
    #   return "ストレートフラッシュ"
    # end

    # if 
    #   return "フォーカード"
    # end

    # if same_suit_flug
    #   return "フルハウス"
    # end

    if same_suit_flug
      return "フラッシュ"
    end

    # if count_up_flug
    #   return "ストレート"
    # end

    # if same_suit_flug
    #   return "スリーカード"
    # end

    # if same_suit_flug
    #   return "ツーペア"
    # end

    # if same_suit_flug
    #   return "ワンペア"
    # end

    "豚"
  end

  def all_same_suit?
    suit = @hands.first[:suit]
    (1..4).each do |i|
      if suit != @hands[i][:suit]
        return false
      end
    end

    return true
  end

  def count_up?
  end
end
