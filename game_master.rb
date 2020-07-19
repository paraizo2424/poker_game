require "./dealer"
require "./player"

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

    puts "＜ゲーム終了＞"
  end
end
