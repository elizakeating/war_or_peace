class Turn
    attr_reader :player1, :player2, :spoils_of_war

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2
        @spoils_of_war = []
    end

    def type
        player1_0card = player1.deck.rank_of_card_at(0)
        player2_0card = player2.deck.rank_of_card_at(0)
        player1_2card = player1.deck.rank_of_card_at(2)
        player2_2card = player2.deck.rank_of_card_at(2)

        if (player1_0card == player2_0card) && (player1_2card == player2_2card)
            :mutually_assured_destruction
        elsif player1_0card == player2_0card
            :war
        elsif player1_0card != player2_0card
            :basic
        end
    end

    def winner
        if self.type == :basic
            player1card = player1.deck.rank_of_card_at(0)
            player2card = player2.deck.rank_of_card_at(0)

            if player1card > player2card
                player1
            else
                player2
            end
        elsif self.type == :war
            player1card = player1.deck.rank_of_card_at(2)
            player2card = player2.deck.rank_of_card_at(2)

            if player1card > player2card
                player1
            else
                player2
            end
        elsif turn.type == :mutually_assured_destruction
            "No Winner"
        end
    end

    def pile_cards
        if self.type == :basic
            player1card = player1.deck.cards.shift
            player2card = player2.deck.cards.shift

            @spoils_of_war.push(player1card, player2card)
        elsif self.type == :war
            player1card0 = player1.deck.cards.shift
            player1card1 = player1.deck.cards.shift
            player1card2 = player1.deck.cards.shift
            player2card2 = player2.deck.cards.shift
            player2card2 = player2.deck.cards.shift
            player2card2 = player2.deck.cards.shift

            @spoils_of_war.push(player1card0, player1card1, player1card2, player2card0, player2card1, player2card2)
        elsif self.type == :mutually_assured_destruction
            3.times do
                player1.deck.shift
            end

            3.times do
                player2.deck.shift
            end
        end
    end

    def award_spoils(winner)
        winner.deck.cards.push(spoils_of_war).flatten!
    end

end
