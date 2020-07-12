require "./dealer"
require "./player"

puts "＜ゲーム開始＞"

# ディーラーがトランプ一組を持って現れる
dealer = Dealer.new
dealer.shuffle
puts "--------"

# プレイヤーが卓に座る
player = Player.new(dealer)

# プレイヤーの手札を表示する
player.show

puts "--------"

puts "＜ゲーム終了＞"
