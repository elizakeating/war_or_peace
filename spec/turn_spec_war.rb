require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

RSpec.describe Turn do
    it "exists" do   
        card1 = Card.new(:heart, "Jack", 11)
        card2 = Card.new(:heart, "10", 10)
        card3 = Card.new(:heart, "9", 9)
        card4 = Card.new(:diamond, "Jack", 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, "Queen", 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card4, card3, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(card1).to be_an_instance_of(Card)
        expect(card2).to be_an_instance_of(Card)
        expect(card3).to be_an_instance_of(Card)
        expect(card4).to be_an_instance_of(Card)
        expect(card5).to be_an_instance_of(Card)
        expect(card6).to be_an_instance_of(Card)
        expect(card7).to be_an_instance_of(Card)
        expect(card8).to be_an_instance_of(Card)

        expect(deck1).to be_an_instance_of(Deck)
        expect(deck2).to be_an_instance_of(Deck)

        expect(player1).to be_an_instance_of(Player)
        expect(player2).to be_an_instance_of(Player)

        expect(turn).to be_an_instance_of(Turn)
    end

    it "has readable attributes" do
        card1 = Card.new(:heart, "Jack", 11)
        card2 = Card.new(:heart, "10", 10)
        card3 = Card.new(:heart, "9", 9)
        card4 = Card.new(:diamond, "Jack", 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, "Queen", 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card4, card3, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.player1).to eq(player1)
        expect(turn.player2).to eq(player2)
        expect(turn.spoils_of_war).to eq([])
    end

    it "has a turn type" do
        card1 = Card.new(:heart, "Jack", 11)
        card2 = Card.new(:heart, "10", 10)
        card3 = Card.new(:heart, "9", 9)
        card4 = Card.new(:diamond, "Jack", 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, "Queen", 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card4, card3, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        expect(turn.type).to eq(:war)
    end

    it "returns the winner" do
        card1 = Card.new(:heart, "Jack", 11)
        card2 = Card.new(:heart, "10", 10)
        card3 = Card.new(:heart, "9", 9)
        card4 = Card.new(:diamond, "Jack", 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, "Queen", 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card4, card3, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        winner = turn.winner
        
        expect(winner).to eq(player2)
    end

    it "piles cards" do
        card1 = Card.new(:heart, "Jack", 11)
        card2 = Card.new(:heart, "10", 10)
        card3 = Card.new(:heart, "9", 9)
        card4 = Card.new(:diamond, "Jack", 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, "Queen", 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card4, card3, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        turn.pile_cards

        correct_array = [card1, card2, card5, card4, card3, card6]

        expect(turn.spoils_of_war).to eq(correct_array)
    end

    it "awards spoils" do
        card1 = Card.new(:heart, "Jack", 11)
        card2 = Card.new(:heart, "10", 10)
        card3 = Card.new(:heart, "9", 9)
        card4 = Card.new(:diamond, "Jack", 11)
        card5 = Card.new(:heart, '8', 8)
        card6 = Card.new(:diamond, "Queen", 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2)

        deck1 = Deck.new([card1, card2, card5, card8])
        deck2 = Deck.new([card4, card3, card6, card7])

        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)

        turn = Turn.new(player1, player2)

        winner = turn.winner

        turn.pile_cards
        
        turn.award_spoils(winner)

        correct_array = [card7, card1, card2, card5, card4, card3, card6]

        expect(player1.deck.cards).to eq([card8])
        expect(player2.deck.cards).to eq(correct_array)      
    end

end