require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'


suits = [:heart, :spade, :diamond, :club]
value = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
full_deck = []
suits.each do |suit| #since each suit will have all the values and ranks, we want to do this loop for each of them
    value.length.times do |i| #we want to loop this the amount of cards in each suit, which is determined by the length of the value array
            full_deck << Card.new(suit, value[i], i+2) #this code is run 13 times for each suit, the i + 2 is because we start at 2 for rank and i starts at 0
    end
end

shuffled_deck = full_deck.shuffle

deck1_cards = []
deck2_cards = []

26.times do
    deck1_cards << shuffled_deck.shift
end
26.times do 
    deck2_cards << shuffled_deck.shift
end

deck1 = Deck.new(deck1_cards)
deck2 = Deck.new(deck2_cards)

player1 = Player.new("Megan", deck1)
player2 = Player.new("Aurora", deck2)

game = Game.new

puts "Welcome to War! (or Peace) This game will be played with 52 cards.\nThe players today are #{player1.name} and #{player2.name}.\nType 'GO' to start the game!\n------------------------------------------------------"

word = gets.chomp

loop do
    if word == "GO"
        game.start
        break
    else
        p "Incorrect, try again!"
        word = gets.chomp
    end
end
    