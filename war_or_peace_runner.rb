require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'


suits = [:heart, :spade, :diamond, :club]
value = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King", "Ace"]
full_deck = []
suits.each do |suit| #since each suit will have all the values and ranks, we want to do this loop for each of them
    value.length.times do |i| #we want to loop this the amount of cards in each suit, which is determined by the length of the value array
            full_deck << Card.new(suit, value[i], i+2) #this code is run 13 times for each suit, the i + 2 is because we start at 2 for rank and i starts at 0
    end
end
    