class Deck

    attr_reader :cards

    def initialize(cards)
        @cards = cards
    end

    def rank_of_card_at(index)
        cards[index].rank
    end

    def high_ranking_cards    
        high_cards = []
        i = 0

        until i == cards.length
            if cards[i].rank >= 11
                high_cards << cards[i]
                i += 1
            else
                i += 1
            end
        end
        
        high_cards
    end

end

# require './lib/card'
# require './lib/deck'
# card1 = Card.new(:diamond, 'Queen', 12)
# card2 = Card.new(:spade, '3', 3) 
# card3 = Card.new(:heart, 'Ace', 14) 
# cards = [card1, card2, card3]
# deck = Deck.new(cards)
