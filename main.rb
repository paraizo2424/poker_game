require "./dealer"
require "./player"

dealer = Dealer.new
dealer.shuffle
dealer.show(10)
puts "--------"

player = Player.new(dealer)
player.show

puts "--------"
dealer.show(10)

puts "--------"
