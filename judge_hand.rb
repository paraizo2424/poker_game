module JudgeHand
  def judge(hands)
    @hands = hands

    # 手札の5枚のすべてが同じスートか
    same_suit_flug = all_same_suit?
    # 手札の数字が並びになっているか
    count_up_flug = count_up?
    # 4カード、3カード、ペアが何組ずつあるか
    pair_counts = count_pair

    if same_suit_flug
      if royal_straight?
        return "ロイヤルストレートフラッシュ"
      end
    end

    if same_suit_flug && count_up_flug
      return "ストレートフラッシュ"
    end

    if pair_counts[:four_card?]
      return "フォーカード"
    end

    if pair_counts[:three_card?] && (pair_counts[:pair_count] > 0)
      return "フルハウス"
    end

    if same_suit_flug
      return "フラッシュ"
    end

    if count_up_flug
      return "ストレート"
    end

    if pair_counts[:three_card?]
      return "スリーカード"
    end

    if pair_counts[:pair_count] == 2
      return "ツーペア"
    end

    if pair_counts[:pair_count] == 1
      return "ワンペア"
    end

    "豚"
  end

  def all_same_suit?
    suit = @hands.first.suit
    (1..4).each do |i|
      if suit != @hands[i].suit
        return false
      end
    end

    return true
  end

  def count_up?
    arr = []
    @hands.each do |card|
      arr << card.num
    end

    arr.sort!

    num = arr.first
    (1..4).each do |i|
      if (num + 1) != arr[i]
        return false
      end

      num += 1
    end

    return true
  end

  def royal_straight?
    arr = []
    @hands.each do |card|
      arr << card.num
    end

    return arr.sort == [1, 10, 11, 12, 13]
  end

  def count_pair
    arr = []
    @hands.each do |card|
      arr << card.num
    end

    pair_counts = {pair_count: 0, three_card: false, four_card?: false}
    i = 1
    arr_length = arr.length
    while !arr.empty?
      arr.delete(i)

      if (arr_length - 2) == arr.length
        pair_counts[:pair_count] += 1
      elsif (arr_length - 3) == arr.length
        pair_counts[:three_card?] = true
      elsif (arr_length - 4) == arr.length
        pair_counts[:four_card?] = true
      end

      arr_length = arr.length
      i += 1
    end

    pair_counts
  end
end
