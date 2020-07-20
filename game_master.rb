require "./dealer"
require "./player"

# 役の強さの順番
HAND_STRENGTH = [
  "ロイヤルストレートフラッシュ",
  "ストレートフラッシュ",
  "フォーカード",
  "フルハウス",
  "フラッシュ",
  "ストレート",
  "スリーカード",
  "ツーペア",
  "ワンペア",
  "豚"
]

class GameMaster
  def initialize
    # ディーラーがトランプ一組を持って現れる
    @dealer = Dealer.new
    @dealer.shuffle

    # プレイヤーの参加人数を入力する
    puts "プレイヤーの参加人数を入力してください"
    player_count = gets.to_i
    @players = []
    player_count.times do |i|
      @players[i] = Player.new(@dealer, i)
    end
  end

  def start
    puts "＜ゲーム開始＞"
    
    @players.each do |player|
      # プレイヤーの手札を表示する
      player.show

      puts "捨てるカードの番号を半角スペース区切りで入力してください。"
      puts "何も捨てない場合は-1を入力してください。"
      discard_cards = gets.chomp

      player.discard(discard_cards)

      player.show
    end

    # 勝敗の判定
    self.judge

    puts "＜ゲーム終了＞"
  end

  def judge
    player_hands = []

    @players.each do |player|
      player_hands << HAND_STRENGTH.find_index(player.judge)
    end

    if player_hands.count(player_hands.min) == 1
      puts "#{player_hands.find_index(player_hands.min)}さんの勝利です。"
    else
      puts "引き分けです。"
    end
  end
end
