require "./dealer"
require "./player"

puts "＜ゲーム開始＞"

# ディーラーがトランプ一組を持って現れる
dealer = Dealer.new
dealer.shuffle

# プレイヤーが卓に座る
player = Player.new(dealer)

# プレイヤーの手札を表示する
player.show

puts "捨てるカードの番号を半角スペース区切りで入力してください。"
puts "何も捨てない場合は-1を入力してください。"
discard_cards = gets.chomp

player.discard(discard_cards)

player.show

puts "＜ゲーム終了＞"
