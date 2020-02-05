class Game < ApplicationRecord
    def regular_round_turn_1(game, pinsKnockedDown, turn)
        if turn === 2
            pinsRemaining = 10 - pinsKnockedDown
            #strike
            if pinsKnockedDown === 10 
                game.strikeBalls += 2 
                game.score = 10 
                game.frame += 1
            #regular
            else 
                game.pins = (pinsRemaining)
                game.score = (pinsKnockedDown)
            end 
        end
        game.save
    end

    def regular_round_turn_2(game, pinsKnockedDown, turn)
        if turn === 1
            byebug
        end
    end
end 
