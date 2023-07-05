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

end
