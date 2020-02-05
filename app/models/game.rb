class Game < ApplicationRecord
    def regular_round_turn_1(game, pinsKnockedDown)
        if game.turn === 2
            pinsRemaining = 10 - pinsKnockedDown
            #strike
            if pinsKnockedDown === 10 
                game.strikeBalls = 2 
                game.score = 10 
                game.frame += 1
            #regular
            else 
                game.turn = 1 
                game.pins = (pinsRemaining)
                game.score = (pinsKnockedDown)
            end 
        end
        game.save
    end

    def regular_round_turn_2(game, pinsKnockedDown)
        if game.turn === 1 && pinsKnockedDown <= game.pins && turn_2 = true 
            byebug
        end
    end
end 
